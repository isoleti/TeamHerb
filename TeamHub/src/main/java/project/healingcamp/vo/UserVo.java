package project.healingcamp.vo;

public class UserVo {
	private int uidx;
	private String id;
	private String pw;
	private String name;
	private int phone;
	private String mail;
	private String edate;
	private String picture;
	private String center;
	private String usertype;
	
	
	
	@Override
	public String toString() {
		return "UserVo [uidx=" + uidx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", mail="
				+ mail + ", edate=" + edate + ", picture=" + picture + ", center=" + center + ", usertype=" + usertype
				+ "]";
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	


}
