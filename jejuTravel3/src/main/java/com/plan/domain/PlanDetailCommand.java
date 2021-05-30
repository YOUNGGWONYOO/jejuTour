package com.plan.domain;

public class PlanDetailCommand {
	int id;//day_detail일련번호
	int day_seq;//plan_day일련번호
	int seq;//시간순서
	int time;//시간(기간)
	int t_id;//여행지 일련번호
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDay_seq() {
		return day_seq;
	}
	public void setDay_seq(int day_seq) {
		this.day_seq = day_seq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	@Override
	public String toString() {
		return "PlanDetailCommand [id=" + id + ", day_seq=" + day_seq + ", seq=" + seq + ", time=" + time + ", t_id="
				+ t_id + "]";
	}
	
	
}
