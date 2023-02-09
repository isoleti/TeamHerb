package project.healingcamp.vo;

import java.util.Date;

public class MypageMaker {

	 private MyCriteria cri; // page, perPageNum �� ������ ����
	 private MyRCriteria rcri;
	 

	private int startPage; //ù ������ ��ȣ
	   private int endPage;   //������ ������ ��ȣ
	   private boolean prev;  //������ư
	   private boolean next;  //������ư
	   
	   private int total;     //�� �Խñ� �� 
	   private int page;   //��ȸ�ϴ� ������ ��ȣ
	   private int perPageNum;    //������ �����Ͱ���
	   private Date fromdate;
	   private Date todate;
	   

	public MypageMaker(MyCriteria cri, int total) {
		
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
	
		public MypageMaker(MyRCriteria rcri, int total) {
		
		this.page = rcri.getPage();
		this.perPageNum = rcri.getPerPageNum();
		this.fromdate = rcri.getFromdate();
		this.todate = rcri.getTodate();
		
		this.total = total;
		this.rcri = rcri;
		
	
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
	
	
	
	
   public Date getFromdate() {
			return fromdate;
		}

		public void setFromdate(Date fromdate) {
			this.fromdate = fromdate;
		}

		public Date getTodate() {
			return todate;
		}

		public void setTodate(Date todate) {
			this.todate = todate;
		}

public MyRCriteria getRcri() {
		return rcri;
	}
	public void setRcri(MyRCriteria rcri) {
		this.rcri = rcri;
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
		return "MypageMaker [cri=" + cri + ", rcri=" + rcri + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", total=" + total + ", page=" + page + ", perPageNum="
				+ perPageNum + ", fromdate=" + fromdate + ", todate=" + todate + "]";
	}

	
	
	
	   
	   
	
}
