package com.project.flower.member.vo;

public class FlowerVO {
	
	private String fId; //꽃품명 : 관리자
	private String fName; //꽃이름 : 고객
	private int fPrice; //꽃가격
	private int fQuant; //꽃재고
	private int fCategory; //꽃 카테고리 0:송이,1:다발,2:화분,3:바구니
	private String fImg; //꽃 상세이미지
	private String fThumbnail;//꽃 썸네일
	private String fInfo;//꽃 정보
	private String fStarpoint;//꽃 평균별점
	
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public int getfPrice() {
		return fPrice;
	}
	public void setfPrice(int fPrice) {
		this.fPrice = fPrice;
	}
	public int getfQuant() {
		return fQuant;
	}
	public void setfQuant(int fQuant) {
		this.fQuant = fQuant;
	}
	public int getfCategory() {
		return fCategory;
	}
	public void setfCategory(int fCategory) {
		this.fCategory = fCategory;
	}
	public String getfImg() {
		return fImg;
	}
	public void setfImg(String fImg) {
		this.fImg = fImg;
	}
	public String getfThumbnail() {
		return fThumbnail;
	}
	public void setfThumbnail(String fThumbnail) {
		this.fThumbnail = fThumbnail;
	}
	public String getfInfo() {
		return fInfo;
	}
	public void setfInfo(String fInfo) {
		this.fInfo = fInfo;
	}
	public String getfStarpoint() {
		return fStarpoint;
	}
	public void setfStarpoint(String fStarpoint) {
		this.fStarpoint = fStarpoint;
	}
	@Override
	public String toString() {
		return "FlowerVO [fId=" + fId + ", fName=" + fName + ", fPrice=" + fPrice + ", fQuant=" + fQuant
				+ ", fCategory=" + fCategory + ", fImg=" + fImg + ", fThumbnail=" + fThumbnail + ", fInfo=" + fInfo
				+ ", fStarpoint=" + fStarpoint + "]";
	}
	
	
}
