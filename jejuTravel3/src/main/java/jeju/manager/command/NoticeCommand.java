package jeju.manager.command;

public class NoticeCommand {

	private int n_seq;  //공지 번호
	private String mgr_id; //관리자 아이디
	private String n_subject; //공지 제목
	private String n_content; //공지 내용
	private String n_write_date; //공지 작성일
	
	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}
	public String getMgr_id() {
		return mgr_id;
	}
	public void setMgr_id(String mgr_id) {
		this.mgr_id = mgr_id;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_write_date() {
		return n_write_date;
	}
	public void setN_write_date(String n_write_date) {
		this.n_write_date = n_write_date;
	}
	
	
}
