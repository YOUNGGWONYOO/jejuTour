package jeju.member.command;

import java.sql.Date;

public class Member_DetailCommand {

	private String m_id; //회원아이디
	private String m_pw; //비밀번호
	private Date access_date; //접속날짜
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public Date getAccess_date() {
		return access_date;
	}
	public void setAccess_date(Date access_date) {
		this.access_date = access_date;
	}
	
	public boolean matchPassword(String m_pw) {
		return this.m_pw.equals(m_pw);
	}
	
}
