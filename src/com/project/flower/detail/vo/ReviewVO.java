package com.project.flower.detail.vo;

public class ReviewVO {
	private int reviewNum; // 리뷰번호
	private String userId; // 유저아이디
	private String fId; //꽃품명
	private int complete; //배달,픽업 완료여부
	private String cComment; //리뷰
	private String commentDate;//리뷰작성일시
	private String adminComment;//관리자 댓글
	private String fStarpoint;//별점
	private String fname;//상품명
	
	
	public String getcComment() {
		return cComment;
	}
	public void setcComment(String cComment) {
		this.cComment = cComment;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getAdminComment() {
		return adminComment;
	}
	public void setAdminComment(String adminComment) {
		this.adminComment = adminComment;
	}
	public String getfStarpoint() {
		return fStarpoint;
	}
	public void setfStarpoint(String fStarpoint) {
		this.fStarpoint = fStarpoint;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNum=" + reviewNum + ", userId=" + userId + ", fId=" + fId + ", complete=" + complete
				+ ", cComment=" + cComment + ", commentDate=" + commentDate + ", adminComment=" + adminComment
				+ ", fStarpoint=" + fStarpoint + ", fname=" + fname + "]";
	}

	
	
}
