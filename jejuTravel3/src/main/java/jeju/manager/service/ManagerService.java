package jeju.manager.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import jeju.manager.command.NoticeCommand;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;
 
public interface ManagerService {

		//1. 관리자 로그인 체크
		public boolean s_loginCheck(String mgr_id,String mgr_pw,HttpSession session);
		
		//2. 관리자 로그아웃
		public void s_logout(HttpSession session);
		
		//3. 회원목록 페이징
		public ModelAndView s_getMemberList(int currentPage);
		
		//3-1. Qna목록 페이징
		public ModelAndView s_getQnaList(int currentPage);
		
		//공지사항 작성
		public void s_insertNotice(NoticeCommand not);
		
		// 공지사항 수정
	    public void s_updateNotice(NoticeCommand not);
	    
	    //공지사항 삭제
	    public void s_deleteNotice(int n_seq);
	    
		//공지사항 정보
		public NoticeCommand s_viewNotice(int n_seq);
		
		//qna 정보
		public QnaCommand s_viewQna(int q_seq);
		
		//qna 삭제
		public void deleteQna(int q_seq);
		
		//qna 댓글 정보
		public List<ReplyCommand> s_viewReply(int q_seq);
			
		//qna 댓글 작성
		public void s_insertReply(ReplyCommand re);
			
		//qna 댓글 삭제
		public void s_deleteReply(ReplyCommand re);
		
	    //4. 회원 정보
	    public MemberCommand s_viewUser(String m_id);
	    
	    public Member_DetailCommand s_viewUser2(String m_id);
	    
	    //6. 회원 수정
	    public void s_updateUser(MemberCommand mem,Member_DetailCommand mem_de);
	    
		//5. 회원 삭제
		public void s_delete(String m_id);
}
