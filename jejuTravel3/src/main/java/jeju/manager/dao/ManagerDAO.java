package jeju.manager.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import jeju.manager.command.NoticeCommand;
import jeju.member.command.MemberCommand;
import jeju.member.command.Member_DetailCommand;
import jeju.member.command.QnaCommand;
import jeju.member.command.ReplyCommand;
 
public interface ManagerDAO {

	//1. 관리자 로그인 체크
	public boolean loginCheck(Map<String,Object> map,HttpSession session);
	
	//2. 관리자 로그아웃
	public void logout(HttpSession session);
	
	//3. 회원목록 페이징
	public List<MemberCommand> getMemberList(Map<String,Object> map);
	
	//3-1. Qna목록 페이징
	public List<QnaCommand> getQnaList(Map<String,Object> map);
	
	//3-1. 공지목록 페이징
	public List<NoticeCommand> getNoticeList();
	
	// 공지사항 작성
	public void insertNotice(NoticeCommand not);
	
	// 공지사항 수정
    public void updateNotice(NoticeCommand not);
    
    //공지사항 삭제
    public void deleteNotice(int n_seq);
    
	//공지사항 정보
	public NoticeCommand viewNotice(int n_seq);
	
	//qna 정보
	public QnaCommand viewQna(int q_seq);
	
	//qna삭제
	public void deleteQna(int q_seq);
	
	//qna 댓글 정보
	public List<ReplyCommand> viewReply(int q_seq);
		
	//qna 댓글 작성
	public void insertReply(ReplyCommand re);
		
	//qna 댓글 삭제
	public void deleteReply(ReplyCommand re);
	
    //4. 회원 정보
    public MemberCommand viewUser(String m_id);
    
    public Member_DetailCommand viewUser2(String m_id);
    //4-1. 회원 수정
    public void updateUser(MemberCommand mem);
	
    public void updateUser2(Member_DetailCommand mem_de);
	//5. 총 회원 레코드 구하기
	public int getMemberCount();
	
	//5-1.총 qna 게시물 수
	public int getQnaCount();
	
	//5-2 총 공지 게시물 수
	public int getNoticeCount();
	
	//6. 회원 삭제
	public void delete(String m_id);
}
