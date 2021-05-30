package com.tour.domain;
//dto
public class TourCommand {
	private int t_id;
	private String t_name;
	private int region;
	private int t_img;
	private int c_id;
	private int like_cnt;
	private String t_keyword;
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
	public int getT_img() {
		return t_img;
	}
	public void setT_img(int t_img) {
		this.t_img = t_img;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getT_keyword() {
		return t_keyword;
	}
	public void setT_keyword(String t_keyword) {
		this.t_keyword = t_keyword;
	}
	@Override
	public String toString() {
		return "TourCommand [t_id=" + t_id + ", t_name=" + t_name + ", region=" + region + ", t_img=" + t_img
				+ ", c_id=" + c_id + ", like_cnt=" + like_cnt + ", t_keyword=" + t_keyword + "]";
	}

	
}