package project.healingcamp.vo;

public class PageVO {
   
   private int startPage; //첫 페이지 번호
   private int endPage;   //마지막 페이지 번호
   private boolean prev;  //이전버튼
   private boolean next;  //다음버튼
   
   private int total;     //총 게시글 수 
   private int pageNum;   //조회하는 페이지 번호
   private int amount;    //보여질 데이터개수
   
   private SearchVO searchVO;
   
   

public PageVO(SearchVO searchVO,int total) {
	//초기화
	this.pageNum = searchVO.getPageNum();
	this.amount = searchVO.getAmount();
	this.total = total;
	this.searchVO = searchVO;
	
	//끝번호
	this.endPage = (int)Math.ceil(this.pageNum/10.0)*10;
	
	//시작번호
	this.startPage = this.endPage-10+1;
	
	//마지막 끝번호
	int realEnd = (int)Math.ceil(this.total/(double)this.amount);
	
	if(this.endPage >realEnd) {
		this.endPage=realEnd;
	}
	
	this.prev = this.startPage >1;
	this.next = this.endPage<realEnd;
}

@Override
public String toString() {
	return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", total="
			+ total + ", pageNum=" + pageNum + ", amount=" + amount + ", searchVO=" + searchVO + "]";
}

public int getStartPage() {
	return startPage;
}

public void setStartPage(int startPage) {
	this.startPage = startPage;
}

public int getEndPage() {
	return endPage;
}

public void setEndPage(int endPage) {
	this.endPage = endPage;
}

public boolean isPrev() {
	return prev;
}

public void setPrev(boolean prev) {
	this.prev = prev;
}

public boolean isNext() {
	return next;
}

public void setNext(boolean next) {
	this.next = next;
}

public int getTotal() {
	return total;
}

public void setTotal(int total) {
	this.total = total;
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

public SearchVO getSearchVO() {
	return searchVO;
}

public void setSearchVO(SearchVO searchVO) {
	this.searchVO = searchVO;
}
   
   
   
   
  
   
   
   

}