package project.healingcamp.vo;

public class PageVO {
   
   private int startPage; //ù ������ ��ȣ
   private int endPage;   //������ ������ ��ȣ
   private boolean prev;  //������ư
   private boolean next;  //������ư
   
   private int total;     //�� �Խñ� �� 
   private int pageNum;   //��ȸ�ϴ� ������ ��ȣ
   private int amount;    //������ �����Ͱ���
   
   private SearchVO searchVO;
   
   

public PageVO(SearchVO searchVO,int total) {
	//�ʱ�ȭ
	this.pageNum = searchVO.getPageNum();
	this.amount = searchVO.getAmount();
	this.total = total;
	this.searchVO = searchVO;
	
	//����ȣ
	this.endPage = (int)Math.ceil(this.pageNum/10.0)*10;
	
	//���۹�ȣ
	this.startPage = this.endPage-10+1;
	
	//������ ����ȣ
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