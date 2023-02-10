package project.healingcamp.vo;

//���������� ���� �۾��� criteria 
public class MyRCriteria extends ReserveVO{
	
	  

	private int page; // ������ ������
	   private int perPageNum; // �������� ������ �Խñۼ�
	   private int rowStart; // ������ ������̼� ó�� ��ȣ
	   private int rowEnd; // ������ ������̼� ������ ��ȣ 
	   
	    // limit �������� ���� �κп� �ʿ��� ���� ��ȯ(mybatis���� ���)
	    public int getPageStart(){
	        return (this.page -1) * this.perPageNum;
	    }
	     
	    public MyRCriteria() {
	    	this(1,7);
	    }
	    public MyRCriteria(int page, int perPageNum) { // ���� default �����ڷ� �⺻ ��ü ������ �ʱⰪ�� �����Ѵ�. (1������, 4����)
	        this.page = 1;  // ����ڰ� �������� ������ �⺻ 1
	        this.perPageNum = 7; // �������� �⺻ 4���� ����ϵ��� ����
	    }

		public int getPage() {
			return page;
		}

		public void setPage(int page) {
			if(page <=0) {
				this.page=1;
			}else {
				this.page = page;				
			}
		}

		public int getPerPageNum() {
			return perPageNum;
		}

		public void setPerPageNum(int PageCount) {
			int count = this.perPageNum;
			if(PageCount != count) {
				this.perPageNum = count;				
			}else {
				this.perPageNum = PageCount;
			}
		}
		
		public int getRowStart() {
			rowStart = ((page-1)*perPageNum);
			return rowStart;
		}
		public int getRowEnd() {
			rowEnd=rowStart + perPageNum-1;
			return rowEnd;
		}
		
		@Override
		public String toString() {
			return "MyRCriteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd="
					+ rowEnd + "]";
		}

	
		
		
	     
}
