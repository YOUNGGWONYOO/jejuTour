package com.plan.domain;

import java.sql.Date;

public class PlanInsertCommand {
	 int id;
	 String m_id;
	 String title;
	 String dprt_date;
	 String arrive_date;
	 String memo;
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDprt_date() {
		return dprt_date;
	}
	public void setDprt_date(String dprt_date) {
		this.dprt_date = dprt_date;
	}
	public String getArrive_date() {
		return arrive_date;
	}
	public void setArrive_date(String arrive_date) {
		this.arrive_date = arrive_date;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "PlanInsertCommand [id=" + id + ", m_id=" + m_id + ", title=" + title + ", dprt_date=" + dprt_date
				+ ", arrive_date=" + arrive_date + ", memo=" + memo + "]";
	}
	
	
	
}
