package jeju.manager.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jeju.manager.command.NoticeCommand;
import jeju.manager.service.ManagerService;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;

@Controller
@RequestMapping("/manager/*")
public class ManagerController { 

	@Autowired
	public ManagerService service;
	
	// 관리자 로그인 화면 
    @RequestMapping("/login.do")
    public String login(){
        return "manager/man_Login";    
    }
    
	//01. 관리자 로그인 체크
	@RequestMapping("/loginCheck.do")
	public ModelAndView loginCheck(@RequestParam("mgr_id") String mgr_id,
			  									 	 @RequestParam("mgr_pw") String mgr_pw,				  
			  										HttpSession session){
	
			boolean result=service.s_loginCheck(mgr_id, mgr_pw, session);
			ModelAndView mav = new ModelAndView();
				if (result == true) { // 로그인 성공
					//managerLoginSuccess.jsp로 이동
					mav.setViewName("manager/man_LoginSuccess");
					mav.addObject("msg", "success");
				} else {    // 로그인 실패
					// login.jsp로 이동
					mav.setViewName("manager/man_Login");
					mav.addObject("msg", "failure");
				}
			System.out.println("로그인 완료");
			return mav;
	}
	
	//02. 로그아웃 처리
    @RequestMapping("/logout.do")
    public ModelAndView logout(HttpSession session){
        service.s_logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("manager/man_Login");
        mav.addObject("msg", "logout");
        System.out.println("로그아웃 완료");
        return mav;
    }
    
    // 회원목록 보기
    @RequestMapping("/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1")int currentPage){


    	ModelAndView mav=service.s_getMemberList(currentPage);
		return mav;
	}
    
    //Qna,공지목록 보기
    @RequestMapping("/notice.do")
    public ModelAndView notice(@RequestParam(value="pageNum",defaultValue="1")int currentPage) {
    	ModelAndView mav=service.s_getQnaList(currentPage);
    	return mav;
    }
    
    //공지사항 작성폼 이동
    @RequestMapping("/noticeForm.do")
    public String NoticeForm(){
        return "manager/man_not_Write";    
    }
    
    //공지사항 작성
    @RequestMapping("/noticeWrite.do")
    public ModelAndView noticeWrite(NoticeCommand not) {
    	service.s_insertNotice(not);
    	return new ModelAndView("redirect:/manager/notice.do");
    }
    //공지사항 수정폼
    @RequestMapping("/noticeUpdate.do")
    public ModelAndView noticeUpdateForm(@RequestParam("n_seq") int n_seq) {
    	NoticeCommand notice=service.s_viewNotice(n_seq);
    	return new ModelAndView("manager/man_not_Update","no",notice);
    }
    //공지사항 수정
    @RequestMapping("/noticeUpdate_confirm.do")
    public ModelAndView noticeUpdate(NoticeCommand not) {
    	service.s_updateNotice(not);
    	int n_seq=not.getN_seq();
    	return new ModelAndView("redirect:/manager/noticeDetail.do","n_seq",n_seq);
    }
    
    //공지사항 삭제
    @RequestMapping("/noticeDelete.do")
    public ModelAndView noticeDelete(@RequestParam("n_seq") int n_seq) {
    	service.s_deleteNotice(n_seq);
    	return new ModelAndView("redirect:/manager/notice.do");
    }
    //공지사항 정보
    @RequestMapping("/noticeDetail.do")
    public ModelAndView noticeDetail(@RequestParam("n_seq") int n_seq) {
    	NoticeCommand notice=service.s_viewNotice(n_seq);
    	return new ModelAndView("manager/man_not_Detail","no",notice);
    }
    
    //qna 정보
    @RequestMapping("/qnaDetail.do")
    public ModelAndView qnaDetail(@RequestParam("q_seq") int q_seq) {
    	QnaCommand qna=service.s_viewQna(q_seq);
    	List<ReplyCommand> re=service.s_viewReply(q_seq);
    	ModelAndView mav=new ModelAndView("manager/man_qna_Detail");
    	mav.addObject("qna",qna);
    	mav.addObject("re",re);
    	return mav;
    }
    
    //qna 삭제
    @RequestMapping("/qnaDelete.do")
    public ModelAndView qnaDelete(int q_seq) {
    	service.deleteQna(q_seq);
    	return new ModelAndView("redirect:/manager/notice.do");
    }
    //qna 댓글 작성
    @RequestMapping("/insertReply.do")
    public ModelAndView insertReply(ReplyCommand re) {
    	
    	service.s_insertReply(re);
    	QnaCommand qna=service.s_viewQna(re.getQ_seq());
    	List<ReplyCommand> re2=service.s_viewReply(re.getQ_seq());
    	ModelAndView mav=new ModelAndView("redirect:/manager/qnaDetail.do");
    	mav.addObject("qna",qna);
    	mav.addObject("re",re2);
    	mav.addObject("q_seq",re.getQ_seq());
    	return mav;
    }
    
    //qna 댓글 삭제
    @RequestMapping("/deleteReply.do")
    public ModelAndView deleteReply(ReplyCommand re) {
    
	    	service.s_deleteReply(re);
	    	QnaCommand qna=service.s_viewQna(re.getQ_seq());
	    	List<ReplyCommand> re2=service.s_viewReply(re.getQ_seq());
	    	ModelAndView mav=new ModelAndView("redirect:/manager/qnaDetail.do");
	    	mav.addObject("qna",qna);
	    	mav.addObject("re",re2);
	    	mav.addObject("q_seq",re.getQ_seq());
	    	return mav;
    }
    
    //회원 상세보기
	@RequestMapping("/detail.do")
	public ModelAndView process(@RequestParam("m_id")String m_id){
		
		MemberCommand mem=service.s_viewUser(m_id);
		Member_DetailCommand mem_de=service.s_viewUser2(m_id);
		ModelAndView mav = new ModelAndView("manager/man_Detail");
		mav.addObject("mem",mem);
		mav.addObject("mem_de",mem_de);
		return mav;
	}
	
	// 회원수정폼
    @RequestMapping("/update.do")
    public ModelAndView updateUserForm(@RequestParam("m_id") String m_id) {
    	
    	MemberCommand mem=service.s_viewUser(m_id);
    	Member_DetailCommand mem_de=service.s_viewUser2(m_id);
    	ModelAndView mav=new ModelAndView("manager/man_update");
    	mav.addObject("mem",mem);
    	mav.addObject("mem_de",mem_de);
    	return mav;
    }
    
 // 06. 회원수정
    @RequestMapping("/updateUser_confirm.do")
    public ModelAndView updateUser(MemberCommand mem,Member_DetailCommand mem_de) {
    	service.s_updateUser(mem,mem_de);

    	ModelAndView mav=new ModelAndView("manager/man_LoginSuccess");
    	mav.addObject("msg","ok");
    	return mav;
    }
    
	//08. 회원 탈퇴
	@RequestMapping("/delete.do")
	public String deleteUser(@RequestParam("m_id") String m_id) {
		service.s_delete(m_id);
		System.out.println("회원삭제 완료");
		return "manager/man_LoginSuccess";
	}
}
