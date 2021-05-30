package com.plan.domain;

public class PlanTourCommand {
	int t_id;
	String t_name;
	int region;
	int c_id;
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public int getRegion() {
		return region;
	}
	public void setRegion(int region) {
		this.region = region;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	@Override
	public String toString() {
		return "PlanTourCommand [t_id=" + t_id + ", t_name=" + t_name + ", region=" + region + ", c_id=" + c_id + "]";
	}
	
	
	
}
