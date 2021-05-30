package jeju.member.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jeju.manager.command.NoticeCommand;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;
import jeju.member.dao.MemberDAO;
import util.PagingUtil;
 
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO dao;
	
	@Override
	public void s_insertUser(MemberCommand mem,Member_DetailCommand mem_de) {
		// TODO Auto-generated method stub

		dao.insertUser(mem);
		dao.insertUser_Detail(mem_de);
	}

	@Override
	public boolean idCheck(String m_id) {
		// TODO Auto-generated method stub
		boolean id_check=dao.idCheck(m_id);
		
		return id_check;
	}
	
	@Override
	public boolean s_loginCheck(String m_id,String m_pw, HttpSession session) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<String,Object>();
    	map.put("m_id",m_id);
    	map.put("m_pw",m_pw);
        boolean result = dao.loginCheck(map,session);
       
		if (result) { // true일 경우 세션에 등록
            // 세션 변수 등록
            session.setAttribute("m_id",map.get("m_id"));
            session.setAttribute("m_pw",map.get("m_pw"));
        } 
        return result;
	}

	@Override
	public MemberCommand s_viewUser(String m_id) {
		// TODO Auto-generated method stub
		MemberCommand mem=dao.viewUser(m_id);
		return mem;
	}

	@Override
	public Member_DetailCommand s_viewUser2(String m_id) {
		// TODO Auto-generated method stub
		Member_DetailCommand mem=dao.viewUser2(m_id);
		return mem;
	}
	
	@Override
	public boolean passwordConfirm(Member_DetailCommand mem_de) {
		// TODO Auto-generated method stub
		Member_DetailCommand mem=dao.passwordConfirm(mem_de);
		if(mem==null) {
			return false;
		}else {
			return true;
		}
	}
	
	@Override
	public ModelAndView s_getQnaList(int currentPage) {
		// TODO Auto-generated method stub
		int count=dao.u_getQnaCount();
		System.out.println("count="+count);
		PagingUtil page=new PagingUtil(currentPage,count,10,5,"qna.do");
		List<QnaCommand> list=null;
		//레코드가 한개이상이라면
		if(count > 0){ //페이지당 시작게시물번호->start, 마지막게시물번호 end
			Map<String,Object>map=new HashMap<String,Object>();
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			list=dao.u_getQnaList(map);
		}else{//아무것도 없는경우
			list=Collections.emptyList();//정적상수
		}
		int count_n=dao.u_getNoticeCount();
		List<NoticeCommand> list_n=null;
		if(count_n>0) {
			list_n=dao.u_getNoticeList();
		}else {
			list_n=Collections.emptyList();
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/user_not_List");
		mav.addObject("count",count);
		mav.addObject("count_n",count_n);
		mav.addObject("list",list);
		mav.addObject("list_n",list_n);
		mav.addObject("pagingHtml",page.getPagingHtml());
		return mav;
	}
	
	@Override
	public void s_insertQna(QnaCommand qna) {
		// TODO Auto-generated method stub
		dao.u_insertQna(qna);
	}
	
	@Override
	public void s_updateQna(QnaCommand qna) {
		// TODO Auto-generated method stub
		dao.u_updateQna(qna);
	}
	
	@Override
	public void s_deleteQna(QnaCommand qna) {
		// TODO Auto-generated method stub
		dao.u_deleteQna(qna);
	}
	
	@Override
	public List<ReplyCommand> s_viewReply(int q_seq) {
		// TODO Auto-generated method stub
		List<ReplyCommand> re=dao.u_viewReply(q_seq);
		return re;
	}
	
	@Override
	public void s_insertReply(ReplyCommand re) {
		// TODO Auto-generated method stub
		dao.u_insertReply(re);
	}
	
	@Override
	public void s_deleteReply(ReplyCommand re) {
		// TODO Auto-generated method stub
		dao.u_deleteReply(re);
	}
	
	@Override
	public NoticeCommand s_viewNotice(int n_seq) {
		// TODO Auto-generated method stub
		NoticeCommand notice=dao.u_viewNotice(n_seq);
		return notice;
	}
	
	@Override
	public QnaCommand s_viewQna(int q_seq) {
		// TODO Auto-generated method stub
		QnaCommand qna=dao.u_viewQna(q_seq);
		return qna;
	}
	
	@Override
	public void s_logout(HttpSession session) {
		// TODO Auto-generated method stub
		dao.logout(session);
	}

	@Override
	public void s_updateUser(MemberCommand mem,Member_DetailCommand mem_de,HttpSession session) {
		// TODO Auto-generated method stub
		dao.updateUser(mem);
		dao.updateUser2(mem_de);
		session.setAttribute("m_id",mem.getM_id());
        session.setAttribute("m_pw",mem_de.getM_pw());
	}

	@Override
	public void s_deleteUser(String m_id, HttpSession session) {
		// TODO Auto-generated method stub
		dao.logout(session);
		dao.deleteUser(m_id,session);
	}

}
