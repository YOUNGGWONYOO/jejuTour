package com.tour.domain;

public class TourDetailCommand {
	private int t_id;
	private String t_name;
	private String t_addr;
	private String x;
	private String y;
	private String t_content;
	private int t_img;
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
	public String getT_addr() {
		return t_addr;
	}
	public void setT_addr(String t_addr) {
		this.t_addr = t_addr;
	}
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
	public String getT_content() {
		return t_content;
	}
	public void setT_content(String t_content) {
		this.t_content = t_content;
	}
	public int getT_img() {
		return t_img;
	}
	public void setT_img(int t_img) {
		this.t_img = t_img;
	}
	@Override
	public String toString() {
		return "TourDetailCommand [t_id=" + t_id + ", t_name=" + t_name + ", t_addr=" + t_addr + ", x=" + x + ", y=" + y
				+ ", t_content=" + t_content + ", t_img=" + t_img + "]";
	}
	
	

}
