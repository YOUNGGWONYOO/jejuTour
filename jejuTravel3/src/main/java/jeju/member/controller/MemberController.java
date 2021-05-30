package jeju.member.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jeju.manager.command.NoticeCommand;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;
import jeju.member.service.MemberService;
  
@Controller 
@RequestMapping("/member/*") // 모든맵핑은 /member/를 상속
public class MemberController {
	
    @Autowired
    MemberService service;

	// 회원가입폼
	@RequestMapping("/insert.do")
	public String list() {
		System.out.println("회원가입폼으로 이동");
		return "member/registerForm";
		}
	
	//01. 회원가입
	@RequestMapping("/insertUser.do")
	public ModelAndView mem(MemberCommand mem,Member_DetailCommand mem_de)
											throws Exception {
		
		if(mem.getM_id().length()<=0 || mem_de.getM_pw().length()<=0 || mem.getM_name().length()<=0 || mem.getM_email().length()<=0 || mem.getM_phone().length()<=0) {
			
			return new ModelAndView("member/registerForm","check","check");
		}else {
			boolean check=service.idCheck(mem.getM_id());
			if(check) {
				service.s_insertUser(mem,mem_de);
				System.out.println("회원가입 완료");
				return new ModelAndView("member/loginForm");
			}else {
				return new ModelAndView("member/registerForm");
			}	
		}
	}
	
	// 아이디 중복체크
	@RequestMapping("/idCheck.do")
	public ModelAndView idCheck(@RequestParam("m_id") String m_id) {
		boolean check=service.idCheck(m_id);
		ModelAndView mav = new ModelAndView();
		if(check) {
			mav.setViewName("member/registerForm");
			mav.addObject("msg","id_true");
			mav.addObject("id",m_id);
			return mav;
		}else {
			mav.setViewName("member/registerForm");
			mav.addObject("msg","id_false");
			mav.addObject("id",m_id);
			return mav;
		}
	}
		
    // 로그인 화면 
    @RequestMapping("/login.do")
    public String login(){
        return "member/loginForm";    // member/login.jsp로 포워드
    }
    
    // 01. 로그인 처리
    @RequestMapping("/loginCheck.do")
    public ModelAndView loginCheck(@RequestParam("m_id") String m_id,
    												  @RequestParam("m_pw") String m_pw,
    												  HttpSession session
    												  ){
    	boolean result=service.s_loginCheck(m_id, m_pw,session);
    	ModelAndView mav = new ModelAndView();
    	if (result == true) { // 로그인 성공
        	//loginSuccess.jsp로 이동
            mav.setViewName("form/main");
            mav.addObject("msg", "success");
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("member/loginForm");
            mav.addObject("msg", "failure");
        }
        System.out.println("로그인 완료");
    	
    	return mav;
    }
    
    // 04. 회원정보
    @RequestMapping("/viewUser.do")
    public ModelAndView viewUser(@RequestParam("m_id") String m_id,HttpSession session) {
    	
    	MemberCommand mem=service.s_viewUser(m_id);
    	Member_DetailCommand mem_de=service.s_viewUser2(m_id);
    	ModelAndView mav =new ModelAndView("member/viewUser");
    	mav.addObject("mem",mem);
    	mav.addObject("mem_de",mem_de);
    	return mav;
    }
    //비밀번호 확인폼
    @RequestMapping("/passwordConfirm_Form.do")
    public String passwordConfirm_Form() {
    	return "member/updateUser_Lock";
    }
    //비밀번호 확인
    @RequestMapping("/passwordConfirm.do")
    public ModelAndView passwordConfirm(Member_DetailCommand mem_de) {
    	boolean check=service.passwordConfirm(mem_de);
    	ModelAndView mav=new ModelAndView();
    	if(check) {
    		mav.setViewName("redirect:/member/viewUser.do");
    		mav.addObject("m_id",mem_de.getM_id());
    		return mav;
    	}else {
    		mav.setViewName("member/updateUser_Lock");
    		mav.addObject("msg","password");
    		return mav;
    	}
    }
    //Qna,공지목록 보기
    @RequestMapping("/qna.do")
    public ModelAndView notice(@RequestParam(value="pageNum",defaultValue="1")int currentPage) {
    	ModelAndView mav=service.s_getQnaList(currentPage);
    	return mav;
    }
    
    //qna 작성폼 이동
    @RequestMapping("/qnaWriteForm.do")
    public String NoticeForm(){
        return "member/user_qna_Write";    
    }
    
    //qna 작성
    @RequestMapping("/qnaWrite.do")
    public ModelAndView noticeWrite(QnaCommand not) {
    	if(not.getM_id()!=null) {
    		service.s_insertQna(not);
    		return new ModelAndView("redirect:/member/qna.do");
    	}else {
    		return new ModelAndView("member/user_qna_Write");
    	}
    }
    //qna 수정폼
    @RequestMapping("/qnaUpdate.do")
    public ModelAndView noticeUpdateForm(@RequestParam("q_seq") int q_seq) {
    	
    	QnaCommand qna=service.s_viewQna(q_seq);
    	
    	return new ModelAndView("member/user_qna_Update","qna",qna);
    }
    //qna 수정
    @RequestMapping("/qnaUpdate_confirm.do")
    public ModelAndView noticeUpdate(QnaCommand qna) {
    	service.s_updateQna(qna);
    	int q_seq=qna.getQ_seq();
    	return new ModelAndView("redirect:/member/user_qnaDetail.do","q_seq",q_seq);
    }
    
    
    //qna 삭제
    @RequestMapping("/qnaDelete.do")
    public ModelAndView noticeDelete(@RequestParam("q_seq") int q_seq) {
    	
    	QnaCommand qna=service.s_viewQna(q_seq);
	    service.s_deleteQna(qna);
	    return new ModelAndView("redirect:/member/qna.do");
    }
    
    //qna 정보
    @RequestMapping("/user_qnaDetail.do")
    public ModelAndView qnaDetail(@RequestParam("q_seq") int q_seq) {
    	QnaCommand qna=service.s_viewQna(q_seq);
    	List<ReplyCommand> re=service.s_viewReply(q_seq);
    	ModelAndView mav=new ModelAndView("member/user_qna_Detail");
    	mav.addObject("qna",qna);
    	mav.addObject("re",re);
    	return mav;
    	
    }
    
    //qna 댓글 작성
    @RequestMapping("/insertReply.do")
    public ModelAndView insertReply(ReplyCommand re) {
    	
    	service.s_insertReply(re);
    	QnaCommand qna=service.s_viewQna(re.getQ_seq());
    	List<ReplyCommand> re2=service.s_viewReply(re.getQ_seq());
    	ModelAndView mav=new ModelAndView("redirect:/member/user_qnaDetail.do");
    	mav.addObject("qna",qna);
    	mav.addObject("re",re2);
    	mav.addObject("q_seq",re.getQ_seq());
    	return mav;
    }
    
    //qna 댓글 삭제
    @RequestMapping("/deleteReply.do")
    public ModelAndView deleteReply(ReplyCommand re) {
    	
    	QnaCommand qna=service.s_viewQna(re.getQ_seq());
	    service.s_deleteReply(re);
	    List<ReplyCommand> re2=service.s_viewReply(re.getQ_seq());
	    ModelAndView mav=new ModelAndView("redirect:/member/user_qnaDetail.do");
	    mav.addObject("qna",qna);
	    mav.addObject("re",re2);
	    mav.addObject("q_seq",re.getQ_seq());
	    return mav;
    }
    //공지사항 정보
    @RequestMapping("/user_noticeDetail.do")
    public ModelAndView noticeDetail(@RequestParam("n_seq") int n_seq) {
    	NoticeCommand notice=service.s_viewNotice(n_seq);
    	return new ModelAndView("member/user_not_Detail","no",notice);
    	
    }
    
    // 05. 로그아웃 처리
    @RequestMapping("/logout.do")
    public ModelAndView logout(HttpSession session){
        service.s_logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("form/main");
        mav.addObject("msg", "logout");
        System.out.println("로그아웃 완료");
        return mav;
    }
    
 // 회원수정폼
    @RequestMapping("/updateUser.do")
    public ModelAndView updateUserForm(@RequestParam("m_id") String m_id) {
    	
    	MemberCommand mem=service.s_viewUser(m_id);
    	Member_DetailCommand mem_de=service.s_viewUser2(m_id);
    	ModelAndView mav = new ModelAndView("member/updateUser");
    	mav.addObject("mem",mem);
    	mav.addObject("mem_de",mem_de);
    	return mav;
    }
    
    // 06. 회원수정
    @RequestMapping("/updateUser_confirm.do")
    public ModelAndView updateUser(MemberCommand mem,Member_DetailCommand mem_de,HttpSession session) {
    	service.s_updateUser(mem,mem_de,session);
    	System.out.println("회원수정 완료");
    	ModelAndView mav=new ModelAndView("form/main");
    	mav.addObject("msg","ok");
    	return mav;
    }
    
  //08. 회원 탈퇴
  	@RequestMapping("/deleteUser.do")
  	public String deleteUser(@RequestParam("m_id") String m_id,HttpSession session) {
  		
  		service.s_deleteUser(m_id, session);
  		System.out.println("회원탈퇴 완료");
  		return "member/loginForm";
  	}
  	
}

