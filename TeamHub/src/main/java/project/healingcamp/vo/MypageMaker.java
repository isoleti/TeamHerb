package project.healingcamp.vo;

public class MypageMaker {

	 private MyCriteria cri; // page, perPageNum �� ������ ����
	
	   private int startPage; //ù ������ ��ȣ
	   private int endPage;   //������ ������ ��ȣ
	   private boolean prev;  //������ư
	   private boolean next;  //������ư
	   
	   private int total;     //�� �Խñ� �� 
	   private int page;   //��ȸ�ϴ� ������ ��ȣ
	   private int perPageNum;    //������ �����Ͱ���
	   
	public MypageMaker(MyCriteria cri,int total) {
		
		this.page = cri.getPage();
		this.perPageNum = cri.getPerPageNum();
		this.total = total;
		this.cri = cri;
		
	
		//����ȣ
		this.endPage = (int)Math.ceil(this.page/10.0)*10;
		
		//���۹�ȣ
		this.startPage = this.endPage-10+1;
		
		//������ ����ȣ
		int realEnd = (int)Math.ceil(this.total/(double)this.perPageNum);
		
		System.out.println("End��"+realEnd);
		System.out.println("EndPage"+endPage);
		if(this.endPage >realEnd) {
			this.endPage=realEnd;
		}
		
		this.prev = this.startPage >1;
		this.next = this.endPage<realEnd;
	} 
	  
	public MyCriteria getCri() {
		return cri;
	}
	public void setCri(MyCriteria cri) {
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
