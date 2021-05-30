package jeju.manager.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import jeju.manager.command.NoticeCommand;
import jeju.manager.dao.ManagerDAO;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;
import util.PagingUtil;
 
@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerDAO dao;
	
	@Override
	public boolean s_loginCheck(String mgr_id,String mgr_pw, HttpSession session) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<String,Object>();
    	map.put("mgr_id",mgr_id);
    	map.put("mgr_pw",mgr_pw);
		boolean result=dao.loginCheck(map, session);
		if (result) { // true일 경우 세션에 등록
            // 세션 변수 등록
            session.setAttribute("mgr_id",map.get("mgr_id"));
            session.setAttribute("mgr_pw",map.get("mgr_pw"));
        } 
		return result;
	}

	@Override
	public void s_logout(HttpSession session) {
		// TODO Auto-generated method stub
		dao.logout(session);
	}

	@Override
	public ModelAndView s_getMemberList(int currentPage) {
		// TODO Auto-generated method stub
		int count=dao.getMemberCount();
		System.out.println("count="+count);
		PagingUtil page=new PagingUtil(currentPage,count,10,5,"list.do");
		List<MemberCommand> list=null;
		Map<String,Object>map=new HashMap<String,Object>();
		//레코드가 한개이상이라면
		if(count > 0){ //페이지당 시작게시물번호->start, 마지막게시물번호 end
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			list=dao.getMemberList(map);
		}else{//아무것도 없는경우
			list=Collections.emptyList();//정적상수
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("manager/man_List");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		return mav;
	}
	
	@Override
	public ModelAndView s_getQnaList(int currentPage) {
		// TODO Auto-generated method stub
		int count=dao.getQnaCount();
		System.out.println("count="+count);
		PagingUtil page=new PagingUtil(currentPage,count,10,5,"notice.do");
		List<QnaCommand> list=null;
		//레코드가 한개이상이라면
		if(count > 0){ //페이지당 시작게시물번호->start, 마지막게시물번호 end
			Map<String,Object>map=new HashMap<String,Object>();
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			list=dao.getQnaList(map);
		}else{//아무것도 없는경우
			list=Collections.emptyList();//정적상수
		}
		int count_n=dao.getNoticeCount();
		List<NoticeCommand> list_n=null;
		if(count_n>0) {
			list_n=dao.getNoticeList();
		}else {
			list_n=Collections.emptyList();
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("manager/man_not_List");
		mav.addObject("count",count);
		mav.addObject("count_n",count_n);
		mav.addObject("list",list);
		mav.addObject("list_n",list_n);
		mav.addObject("pagingHtml",page.getPagingHtml());
		return mav;
	}
	
	@Override
	public void s_insertNotice(NoticeCommand not) {
		// TODO Auto-generated method stub
		dao.insertNotice(not);
	}
	
	@Override
	public void s_updateNotice(NoticeCommand not) {
		// TODO Auto-generated method stub
		dao.updateNotice(not);
	}
	
	@Override
	public void s_deleteNotice(int n_seq) {
		// TODO Auto-generated method stub
		dao.deleteNotice(n_seq);
	}
	
	@Override
	public NoticeCommand s_viewNotice(int n_seq) {
		// TODO Auto-generated method stub
		NoticeCommand notice=dao.viewNotice(n_seq);
		return notice;
	}
	
	@Override
	public QnaCommand s_viewQna(int q_seq) {
		// TODO Auto-generated method stub
		QnaCommand qna=dao.viewQna(q_seq);
		return qna;
	}
	
	@Override
	public List<ReplyCommand> s_viewReply(int q_seq) {
		// TODO Auto-generated method stub
		List<ReplyCommand> re=dao.viewReply(q_seq);
		return re;
	}
	
	@Override
	public void s_insertReply(ReplyCommand re) {
		// TODO Auto-generated method stub
		dao.insertReply(re);
	}
	
	@Override
	public void s_deleteReply(ReplyCommand re) {
		// TODO Auto-generated method stub
		dao.deleteReply(re);
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
		Member_DetailCommand mem_de=dao.viewUser2(m_id);
		return mem_de;
	}
	
	@Override
	public void s_updateUser(MemberCommand mem,Member_DetailCommand mem_de) {
		// TODO Auto-generated method stub
		dao.updateUser(mem);
		dao.updateUser2(mem_de);
	}
	
	@Override
	public void s_delete(String m_id) {
		// TODO Auto-generated method stub
		dao.delete(m_id);
	}

	@Override
	public void deleteQna(int q_seq) {
		// TODO Auto-generated method stub
		dao.deleteQna(q_seq);
	}

}
