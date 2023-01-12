package project.healingcamp.vo;

public class PageVO {
   
   private int startPage;
   private int endPage;
   private boolean prev;
   private boolean next;
   private int totalCount;
   private int displayPageNum=10;
   private SearchVO searhVO;
   
   
   
   
   public SearchVO getSearhVO() {
      return searhVO;
   }
   public void setSearhVO(SearchVO searhVO) {
      this.searhVO = searhVO;
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
   public int getTotalCount() {
      return totalCount;
   }
   public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;
   }
   public int getDisplayPageNum() {
      return displayPageNum;
   }
   public void setDisplayPageNum(int displayPageNum) {
      this.displayPageNum = displayPageNum;
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
   
   
   public void calcData() {
      
      //����ȣ
      endPage = (int)(Math.ceil(searhVO.getPageNum()/(double)displayPageNum)*displayPageNum);
      System.out.println("endpage:"+endPage);
      
      //���۹�ȣ
      startPage = (endPage-displayPageNum)+1;
      
      //��ü ��������
      int tempEndPage = (int)Math.ceil(totalCount/(double)searhVO.getAmount());
      
      //������������
      if(endPage > tempEndPage) {
         endPage = tempEndPage;
      }
      
      //������ư ��������
      prev = (startPage == 1 ? false:true);
      
      //������ư ��������
      next = (endPage*searhVO.getAmount() >= totalCount ? false:true);
   }
   
   @Override
   public String toString() {
      return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", totalCount=" + totalCount
            + ", displayPageNum=" + displayPageNum + ", prev=" + prev + ", next=" + next + ", searhVO=" + searhVO
            + "]";
   }
   
   
   

}