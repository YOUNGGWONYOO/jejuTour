package com.tour.domain;

import java.sql.Date;

public class ReviewCommand {
	private int r_id;//리뷰일련번호
	private Date write_date;//작성날짜
	private String r_content;//내용
	private int t_id;//여행지일련번호
	private String m_id;//글쓴이 아이디
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "ReviewCommand [r_id=" + r_id + ", write_date=" + write_date + ", r_content=" + r_content + ", t_id="
				+ t_id + ", m_id=" + m_id + "]";
	}
	
	
	
	

}
