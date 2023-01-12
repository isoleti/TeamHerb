package project.healingcamp.vo;

public class UserVo {
	private int uidx;
	private String id;
	private String pw;
	private String name;
	private String gender;
	private int birtheyar;
	private int birthmonth;
	private int birthday;
	private int phone;
	private String mail;
	private String edate;
	private String file;
	private String current;
	private String past;
	private int pastyear;
	private int pastmonth;

	public int getUidx() {
		return uidx;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getGender() {
		return gender;
	}

	public int getBirtheyar() {
		return birtheyar;
	}
	public int getBirthmonth() {
		return birthmonth;
	}
	public int getBirthday() {
		return birthday;
	}

	public void setBirtheyar(int birtheyar) {
		this.birtheyar = birtheyar;
	}
	public void setBirthmonth(int birthmonth) {
		this.birthmonth = birthmonth;
	}
	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}

	public int getPhone() {
		return phone;
	}
	public String getMail() {
		return mail;
	}
	public String getEdate() {
		return edate;
	}
	public String getFile() {
		return file;
	}
	public String getCurrent() {
		return current;
	}
	public String getPast() {
		return past;
	}
	public int getPastyear() {
		return pastyear;
	}
	public int getPastmonth() {
		return pastmonth;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public void setCurrent(String current) {
		this.current = current;
	}
	public void setPast(String past) {
		this.past = past;
	}
	public void setPastyear(int pastyear) {
		this.pastyear = pastyear;
	}
	public void setPastmonth(int pastmonth) {
		this.pastmonth = pastmonth;
	}
	@Override
	public String toString() {
		return "UserVo [uidx=" + uidx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender
				+ ", birtheyar=" + birtheyar + ", birthmonth=" + birthmonth + ", birthday=" + birthday + ", phone="
				+ phone + ", mail=" + mail + ", edate=" + edate + ", file=" + file + ", current=" + current + ", past="
				+ past + ", pastyear=" + pastyear + ", pastmonth=" + pastmonth + ", certification_number="
				 + "]";
	}


}
