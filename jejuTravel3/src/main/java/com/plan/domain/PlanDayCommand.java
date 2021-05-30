package com.plan.domain;

public class PlanDayCommand {
	int day_seq;
	int day_id;
	int id;
	public int getDay_seq() {
		return day_seq;
	}
	public void setDay_seq(int day_seq) {
		this.day_seq = day_seq;
	}
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
	@Override
	public String toString() {
		return "PlanDayCommand [day_seq=" + day_seq + ", day_id=" + day_id + ", id=" + id + "]";
	}
	
	
}
