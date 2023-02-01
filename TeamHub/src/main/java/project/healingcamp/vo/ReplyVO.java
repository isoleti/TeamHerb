package project.healingcamp.vo;

public class ReplyVO {
	
	private int reply_Idx;
	private String reply_Content;
	private String id;
	private String reply_Wdate;
	private String reply_Ip;
	private int bidx;
	private int uidx;
	private int board_type;
	private int rdepth;
	private int rparent;
	
	
	
	
	@Override
	public String toString() {
		return "ReplyVO [reply_Idx=" + reply_Idx + ", reply_Content=" + reply_Content + ", id=" + id + ", reply_Wdate="
				+ reply_Wdate + ", reply_Ip=" + reply_Ip + ", bidx=" + bidx + ", uidx=" + uidx + ", board_type="
				+ board_type + ", rdepth=" + rdepth + ", rparent=" + rparent + ", getRdepth()=" + getRdepth()
				+ ", getRparent()=" + getRparent() + ", getBoard_type()=" + getBoard_type() + ", getReply_Idx()="
				+ getReply_Idx() + ", getReply_Content()=" + getReply_Content() + ", getReply_Wdate()="
				+ getReply_Wdate() + ", getReply_Ip()=" + getReply_Ip() + ", getUidx()=" + getUidx() + ", getId()="
				+ getId() + ", getBidx()=" + getBidx() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	public int getRdepth() {
		return rdepth;
	}
	public void setRdepth(int rdepth) {
		this.rdepth = rdepth;
	}
	public int getRparent() {
		return rparent;
	}
	public void setRparent(int rparent) {
		this.rparent = rparent;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public int getReply_Idx() {
		return reply_Idx;
	}
	public void setReply_Idx(int reply_Idx) {
		this.reply_Idx = reply_Idx;
	}
	public String getReply_Content() {
		return reply_Content;
	}
	public void setReply_Content(String reply_Content) {
		this.reply_Content = reply_Content;
	}
	public String getReply_Wdate() {
		return reply_Wdate;
	}
	public void setReply_Wdate(String reply_Wdate) {
		this.reply_Wdate = reply_Wdate;
	}
	public String getReply_Ip() {
		return reply_Ip;
	}
	public void setReply_Ip(String reply_Ip) {
		this.reply_Ip = reply_Ip;
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
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	
	
	
	
	
	

}
