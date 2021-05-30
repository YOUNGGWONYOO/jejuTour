package jeju.member.command;

public class QnaCommand {

	private int q_seq; //게시물번호
	private String m_id; //작성자아이디
	private String q_subject; //게시물제목
	private String q_content; //게시물내용
	private String q_write_date; //게시물 작성일
	
	public int getQ_seq() {
		return q_seq;
	}
	public void setQ_seq(int q_seq) {
		this.q_seq = q_seq;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_write_date() {
		return q_write_date;
	}
	public void setQ_write_date(String q_write_date) {
		this.q_write_date = q_write_date;
	}
	
	
}
