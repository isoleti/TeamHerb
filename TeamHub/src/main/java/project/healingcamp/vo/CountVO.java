package project.healingcamp.vo;

public class CountVO {
	
	private int cidx;
	private String cmenu;
	private String cdate;
	private String cmoney;
	private String cyn;
	private String cc;
	private int residx;
	private int uidx;
	
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public String getCmenu() {
		return cmenu;
	}
	public void setCmenu(String cmenu) {
		this.cmenu = cmenu;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCmoney() {
		return cmoney;
	}
	public void setCmoney(String cmoney) {
		this.cmoney = cmoney;
	}
	public String getCyn() {
		return cyn;
	}
	public void setCyn(String cyn) {
		this.cyn = cyn;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public int getResidx() {
		return residx;
	}
	public void setResidx(int residx) {
		this.residx = residx;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	
	@Override
	public String toString() {
		return "CountVO [cidx=" + cidx + ", cmenu=" + cmenu + ", cdate=" + cdate + ", cmoney=" + cmoney + ", cyn=" + cyn
				+ ", cc=" + cc + ", residx=" + residx + ", uidx=" + uidx + "]";
	}
	
	
}
