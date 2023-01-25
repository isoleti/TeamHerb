package project.healingcamp.vo;

public class ReserveVO {
	
	private int residx;
	private String center;
	private String coun;
	private String resdate;
	private String rescount;
	private String resc;
	private int uidx;
	private int clidx;
	private int likecheck;
	
	
	public int getResidx() {
		return residx;
	}
	public void setResidx(int residx) {
		this.residx = residx;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	public String getCoun() {
		return coun;
	}
	public void setCoun(String coun) {
		this.coun = coun;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public String getRescount() {
		return rescount;
	}
	public void setRescount(String rescount) {
		this.rescount = rescount;
	}
	public String getResc() {
		return resc;
	}
	public void setResc(String resc) {
		this.resc = resc;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}	
		
	public int getClidx() {
		return clidx;
	}
	public void setClidx(int clidx) {
		this.clidx = clidx;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	@Override
	public String toString() {
		return "ReserveVO [residx=" + residx + ", center=" + center + ", coun=" + coun + ", resdate=" + resdate
				+ ", rescount=" + rescount + ", resc=" + resc + ", uidx=" + uidx + ", clidx=" + clidx + ", likecheck="
				+ likecheck + "]";
	}
	
	
}
