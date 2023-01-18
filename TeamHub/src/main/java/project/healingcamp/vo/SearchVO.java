package project.healingcamp.vo;

public class SearchVO extends Community_BoardVO{

	private String searchType;
	private String searchVal;
	private int pageNum;
	private int amount;
	private String sort;
	
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public SearchVO() {
		this(1,10);
	}
	public SearchVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	
	@Override
	public String toString() {
		return "SearchVO [searchType=" + searchType + ", searchVal=" + searchVal + "]";
	}
	
	
}
