package jeju.search.command;

public class CategoryCommand {
 
	private int c_id; //카테고리 일련번호
	private int c_tourid; //카테고리
	private int c_subid; //세부카테고리
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getC_tourid() {
		return c_tourid;
	}
	public void setC_tourid(int c_tourid) {
		this.c_tourid = c_tourid;
	}
	public int getC_subid() {
		return c_subid;
	}
	public void setC_subid(int c_subid) {
		this.c_subid = c_subid;
	}
	
	
}
