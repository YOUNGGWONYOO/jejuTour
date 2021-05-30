package jeju.member.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import jeju.manager.command.NoticeCommand;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;
 

public interface MemberService {

	//1. 회원가입
	public void s_insertUser(MemberCommand mem,Member_DetailCommand mem_de);
	
	//2. 로그인 체크
	public boolean s_loginCheck(String m_id,String m_pw,HttpSession session);
	
	// 아이디 중복체크
	public boolean idCheck(String m_id); 
		
    //3. 회원 정보
    public MemberCommand s_viewUser(String m_id);
    
    public Member_DetailCommand s_viewUser2(String m_id);
    
    //비밀번호 확인
    public boolean passwordConfirm(Member_DetailCommand mem_de);
    
    // Qna목록 페이징
  	public ModelAndView s_getQnaList(int currentPage);
  	
  	//qna 작성
  	public void s_insertQna(QnaCommand qna);
  		
  	//qna 수정
  	public void s_updateQna(QnaCommand qna);
  	    
  	//qna 삭제
  	public void s_deleteQna(QnaCommand qna);
    
	//qna 댓글 정보
	public List<ReplyCommand> s_viewReply(int q_seq);
	
	//qna 댓글 작성
	public void s_insertReply(ReplyCommand re);
	
	//qna 댓글 삭제
	public void s_deleteReply(ReplyCommand re);
	
  	//공지사항 정보
  	public NoticeCommand s_viewNotice(int n_seq);
  	
  	//qna 정보
  	public QnaCommand s_viewQna(int q_seq);
  		
    //4. 로그아웃
    public void s_logout(HttpSession session);
    
    //5. 회원 수정
    public void s_updateUser(MemberCommand mem,Member_DetailCommand mem_de,HttpSession session);
    
    //6. 회원 삭제
    public void s_deleteUser(String m_id,HttpSession session);
}
