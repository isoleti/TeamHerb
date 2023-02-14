package project.healingcamp.vo;

public class FileVo {
	private int FILE_NO;
	private int uidx;
	private String ORG_FILE_NAME;
	private String STORED_FILE_NAME;
	private int FILE_SIZE;
	private String REGDATE;
	private String DEL_GB;
	
	@Override
	public String toString() {
		return "FileVo [FILE_NO=" + FILE_NO + ", uidx=" + uidx + ", ORG_FILE_NAME=" + ORG_FILE_NAME
				+ ", STORED_FILE_NAME=" + STORED_FILE_NAME + ", FILE_SIZE=" + FILE_SIZE + ", REGDATE=" + REGDATE
				+ ", DEL_GB=" + DEL_GB + "]";
	}
	
	public int getFILE_NO() {
		return FILE_NO;
	}
	public void setFILE_NO(int fILE_NO) {
		FILE_NO = fILE_NO;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public String getORG_FILE_NAME() {
		return ORG_FILE_NAME;
	}
	public void setORG_FILE_NAME(String oRG_FILE_NAME) {
		ORG_FILE_NAME = oRG_FILE_NAME;
	}
	public String getSTORED_FILE_NAME() {
		return STORED_FILE_NAME;
	}
	public void setSTORED_FILE_NAME(String sTORED_FILE_NAME) {
		STORED_FILE_NAME = sTORED_FILE_NAME;
	}
	public int getFILE_SIZE() {
		return FILE_SIZE;
	}
	public void setFILE_SIZE(int fILE_SIZE) {
		FILE_SIZE = fILE_SIZE;
	}
	public String getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}
	public String getDEL_GB() {
		return DEL_GB;
	}
	public void setDEL_GB(String dEL_GB) {
		DEL_GB = dEL_GB;
	}
	
}
