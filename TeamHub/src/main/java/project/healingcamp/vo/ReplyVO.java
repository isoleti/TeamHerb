package project.healingcamp.vo;

public class ReplyVO {
	
	private int replyIdx;
	private String replyContent;
	private String id;
	private String replyWdate;
	private String replyIp;
	private int bidx;
	private int uidx;
	
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReplyWdate() {
		return replyWdate;
	}
	public void setReplyWdate(String replyWdate) {
		this.replyWdate = replyWdate;
	}
	public String getReplyIp() {
		return replyIp;
	}
	public void setReplyIp(String replyIp) {
		this.replyIp = replyIp;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replyIdx=" + replyIdx + ", replyContent=" + replyContent + ", id=" + id + ", replyWdate="
				+ replyWdate + ", replyIp=" + replyIp + ", bidx=" + bidx + ", uidx=" + uidx + "]";
	}
	
	
	
	

}
