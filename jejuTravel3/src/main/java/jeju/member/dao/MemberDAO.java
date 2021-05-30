package jeju.member.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import jeju.manager.command.NoticeCommand;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;
 
public interface MemberDAO {

	//1. 회원가입1
	public void insertUser(MemberCommand mem);
		
	//2. 회원가입2
	public void insertUser_Detail(Member_DetailCommand mem_de); 
	
	// 아이디 중복체크
	public boolean idCheck(String m_id);
	
	//3. 로그인 체크
	public boolean loginCheck(Map<String,Object> map,HttpSession session);
	
	// Qna목록 페이징
	public List<QnaCommand> u_getQnaList(Map<String,Object> map);
	
	// 공지목록 페이징
	public List<NoticeCommand> u_getNoticeList();
		
	//공지사항 정보
	public NoticeCommand u_viewNotice(int n_seq);
		
	//qna 정보
	public QnaCommand u_viewQna(int q_seq);
	
	//qna 작성
	public void u_insertQna(QnaCommand qna);
		
	//qna 수정
	public void u_updateQna(QnaCommand qna);
	    
	//qna 삭제
	public void u_deleteQna(QnaCommand qna);
		
	//qna 댓글 정보
	public List<ReplyCommand> u_viewReply(int q_seq);
	
	//qna 댓글 작성
	public void u_insertReply(ReplyCommand re);
	
	//qna 댓글 삭제
	public void u_deleteReply(ReplyCommand re);
	
	//총 qna 게시물 수
	public int u_getQnaCount();
		
	//총 공지 게시물 수
	public int u_getNoticeCount();
	
    //4. 회원 정보
    public MemberCommand viewUser(String m_id);
    
    public Member_DetailCommand viewUser2(String m_id);
    
    // 비밀번호 확인
    public Member_DetailCommand passwordConfirm(Member_DetailCommand mem_de);
    
    //5. 로그아웃
    public void logout(HttpSession session);
    
    //6. 회원 수정
    public void updateUser(MemberCommand mem);
  
    //회원 수정2
    public void updateUser2(Member_DetailCommand mem_de);
    
    //7. 회원 삭제
    public void deleteUser(String m_id,HttpSession session);
}
