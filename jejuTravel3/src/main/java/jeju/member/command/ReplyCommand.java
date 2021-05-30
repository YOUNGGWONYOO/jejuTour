package jeju.member.command;

public class ReplyCommand {

	private int re_seq; //댓글 번호
	private String re_write_date; //댓글 작성시간
	private String re_content; //댓글 내용
	private String m_id; //댓글 쓴 아이디
	private int q_seq; //qna 번호
	private String mgr_id; // 관리자 아이디
	
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public String getRe_write_date() {
		return re_write_date;
	}
	public void setRe_write_date(String re_write_date) {
		this.re_write_date = re_write_date;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getQ_seq() {
		return q_seq;
	}
	public void setQ_seq(int q_seq) {
		this.q_seq = q_seq;
	}
	public String getMgr_id() {
		return mgr_id;
	}
	public void setMgr_id(String mgr_id) {
		this.mgr_id = mgr_id;
	}
	
	
}
