package project.healingcamp.vo;

public class SearchVO extends Community_BoardVO{

	private String searchType;
	private String searchVal;
	private int pageNum;
	private int amount;
	private String sort;
	private int startNum;
	private String resposition;
	
	
	
	public SearchVO() {
		this(1,10);
	}
	public SearchVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	public String getResposition() {
		return resposition;
	}
	public void setResposition(String resposition) {
		this.resposition = resposition;
	}
	public int getStartNum() {
		return (this.pageNum-1)*amount;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
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
		return "SearchVO [searchType=" + searchType + ", searchVal=" + searchVal + ", pageNum=" + pageNum + ", amount="
				+ amount + ", sort=" + sort + ", startNum=" + startNum + "]";
	}
	
	
	
}
