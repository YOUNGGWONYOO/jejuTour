package com.plan.domain;

public class PlanDayDetailCommand {
	int t_id;
	int seq;
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	@Override
	public String toString() {
		return "PlanDayDetailCommand [t_id=" + t_id + ", seq=" + seq + "]";
	}
	
	
	
}
