package project.healingcamp.vo;

public class CenterQnaVO {
	
	private int cqidx;
	private String center;
	private String qna;
	private int uidx;
	
	public int getCqidx() {
		return cqidx;
	}
	public void setCqidx(int cqidx) {
		this.cqidx = cqidx;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	public String getQna() {
		return qna;
	}
	public void setQna(String qna) {
		this.qna = qna;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	
	@Override
	public String toString() {
		return "CenterQnaVO [cqidx=" + cqidx + ", center=" + center + ", qna=" + qna + ", uidx=" + uidx + "]";
	}
	
	
}
