package project.healingcamp.vo;

public class ReserveVO {
	
	private int residx;
	private String center;
	private String couns;
	private String resdate;
	private String rescount;
	private String resc;
	private int uidx;
	private int clidx;
	private int likecheck;
	private int phone;
	private String mail;
	private String restime;
	private String id;
	
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
	public String getCouns() {
		return couns;
	}
	public void setCouns(String couns) {
		this.couns = couns;
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
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}	
	public String getRestime() {
		return restime;
	}
	public void setRestime(String restime) {
		this.restime = restime;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ReserveVO [residx=" + residx + ", center=" + center + ", couns=" + couns + ", resdate=" + resdate
				+ ", rescount=" + rescount + ", resc=" + resc + ", uidx=" + uidx + ", clidx=" + clidx + ", likecheck="
				+ likecheck + ", phone=" + phone + ", mail=" + mail + ", restime=" + restime + ", id=" + id + "]";
	}
	
	
}
