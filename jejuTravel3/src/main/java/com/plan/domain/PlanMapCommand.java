package com.plan.domain;

public class PlanMapCommand {
	
	String x;
	String y;
	String t_name;
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	@Override
	public String toString() {
		return "PlanMapCommand [x=" + x + ", y=" + y + ", t_name=" + t_name + "]";
	}
	
	
}
