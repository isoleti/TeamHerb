package project.healingcamp.vo;

public class Criteria extends ReviewVo{
	
	   private int page; // 보여줄 페이지
	   private int perPageNum; // 페이지당 보여줄 게시글수
	   private int rowStart; // 페이지 내비게이션 처음 번호
	   private int rowEnd; // 페이지 내비게이션 마지막 번호 
	   
	    // limit 구문에서 시작 부분에 필요한 값을 반환(mybatis에서 사용)
	    public int getPageStart(){
	        return (this.page -1) * this.perPageNum;
	    }
	     
	    public Criteria() {
	    	this(1,4);
	    }
	    public Criteria(int page, int perPageNum) { // 최초 default 생성자로 기본 객체 생성시 초기값을 지정한다. (1페이지, 4개씩)
	        this.page = 1;  // 사용자가 세팅하지 않으면 기본 1
	        this.perPageNum = 4; // 페이지당 기본 4개씩 출력하도록 세팅
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
			rowStart = ((page-1)*perPageNum)+1;
			return rowStart;
		}
		public int getRowEnd() {
			rowEnd=rowStart + perPageNum-1;
			return rowEnd;
		}

		@Override
		public String toString() {
			return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd="
					+ rowEnd + "]";
		}
		
		
	     
}
