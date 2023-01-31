package project.healingcamp.vo;

public class Community_BoardVO {
	
	private int bidx;
	private String title;
	private String content;
	private String wdate;
	private String id;
	private int hit;
	private int likes;
	private String delyn;
	private String category;
	private String filename;
	private String report;
	private String ip;
	private int board_type;
	private int uidx;
	private String hide_id;
	private int replyCnt;
	
	
	
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public String getHide_id() {
		return hide_id;
	}
	public void setHide_id(String hide_id) {
		this.hide_id = hide_id;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	
	@Override
	public String toString() {
		return "Community_BoardVO [bidx=" + bidx + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", id=" + id + ", hit=" + hit + ", likes=" + likes + ", delyn=" + delyn + ", category=" + category
				+ ", filename=" + filename + ", report=" + report + ", ip=" + ip + ", board_type=" + board_type + "]";
	}
	
	
	
}
