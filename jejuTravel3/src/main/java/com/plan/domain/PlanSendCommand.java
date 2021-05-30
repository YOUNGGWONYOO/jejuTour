package com.plan.domain;

public class PlanSendCommand {
	private int day_id;//plan_day의 day_id(몇일쨰인지)
	private int id;//plan_day_detail의 id(일련번호)
	private int seq;//plan_day_detail의 seq(시간)
	private String t_name;//tour의 여행지이름
	private int t_id;//여행지 일련번호
	public int getDay_id() {
		return day_id;
	}
	public void setDay_id(int day_id) {
		this.day_id = day_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	@Override
	public String toString() {
		return "PlanSendCommand [day_id=" + day_id + ", id=" + id + ", seq=" + seq + ", t_name=" + t_name + ", t_id="
				+ t_id + ", getDay_id()=" + getDay_id() + ", getId()=" + getId() + ", getSeq()=" + getSeq()
				+ ", getT_name()=" + getT_name() + ", getT_id()=" + getT_id() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
