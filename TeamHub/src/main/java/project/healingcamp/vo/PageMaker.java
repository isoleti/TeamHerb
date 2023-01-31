package project.healingcamp.vo;

public class PageMaker {

	 private Criteria cri; // page, perPageNum 을 가지고 있음
	 
	  
	   private int startPage; //첫 페이지 번호
	   private int endPage;   //마지막 페이지 번호
	   private boolean prev;  //이전버튼
	   private boolean next;  //다음버튼
	   
	   private int total;     //총 게시글 수 
	   private int page;   //조회하는 페이지 번호
	   private int perPageNum;    //보여질 데이터개수
	   
	public PageMaker(Criteria cri,int total) {
		
		this.page = cri.getPage();
		this.perPageNum = cri.getPerPageNum();
		this.total = total;
		this.cri = cri;
		
		//끝번호
		this.endPage = (int)Math.ceil(this.page/10.0)*10;
		
		//시작번호
		this.startPage = this.endPage-10+1;
		
		//마지막 끝번호
		int realEnd = (int)Math.ceil(this.total/(double)this.perPageNum);
		
		System.out.println("End값"+realEnd);
		System.out.println("EndPage"+endPage);
		if(this.endPage >realEnd) {
			this.endPage=realEnd;
		}
		
		this.prev = this.startPage >1;
		this.next = this.endPage<realEnd;
	} 
	  
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
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

	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev
				+ ", next=" + next + ", total=" + total + ", page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	   
	   
	
}
