package jeju.search.command;

public class TourCommand {

	private int t_id; //여행지일련번호
	private String t_name; //여행지이름
	private int region; //지역번호1~8
	private int c_id; //카테고리일련번호
	private int like_cnt; //좋아요개수
	private String t_keyword; //키워드
	
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
	
	
	
}
