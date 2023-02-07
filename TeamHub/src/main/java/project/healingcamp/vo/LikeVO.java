package project.healingcamp.vo;

public class LikeVO {

	private int like_no;
	private int likeNum; //좋아요 체크 유무 - 좋아요 체크  :1 , 좋아요 미체크 :0
	private int bidx;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	
	@Override
	public String toString() {
		return "LikeVO [like_no=" + like_no + ", likeNum=" + likeNum + ", bidx=" + bidx + ", id=" + id + "]";
	}
	
}
