package project.healingcamp.vo;

public class SearchVO {
	
	private String searchType;
	private String searchVal;
	
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
