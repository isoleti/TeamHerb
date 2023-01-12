package project.healingcamp.vo;

public class CriteriaVO {
	
	private int page;
	private int perPageNum;
	
	
	public CriteriaVO() {
		this(1,10);
	}
	
	
	public CriteriaVO(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}


	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	
	
	
	

}
