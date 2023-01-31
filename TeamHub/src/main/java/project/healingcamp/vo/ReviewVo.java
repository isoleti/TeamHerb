package project.healingcamp.vo;

public class ReviewVo {

	private int ridx;
	private String rcontent;
	private String rdate;
	private String id;
	private int uidx;
	
	@Override
	public String toString() {
		return "ReviewVo [ridx=" + ridx + ", rcontent=" + rcontent + ", rdate=" + rdate + ", id=" + id + ", uidx="
				+ uidx + "]";
	}
	
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	
	
}
