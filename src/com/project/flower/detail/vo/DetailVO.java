package com.project.flower.detail.vo;

public class DetailVO {
	/* 상세화면에서 필요한 것
	 * 꽃 품번
	 * 꽃 이름
	 * 꽃 가격
	 * 꽃 이미지
	 * 꽃 카테고리
	 * 꽃 설명
	 * 재고 수량
	 * 꽃 구매수량
	 * 총 주문금액
	 */
	private String fId;
	private String fName;
	private int fPrice;
	private String fImg;
	private int fCategory;
	private String fInfo;
	private int fQuant;
	private int fOrderNum;
	private int fOrderprice;
	private String userId;
	private String fThumbnail;
	
	public String getfThumbnail() {
		return fThumbnail;
	}

	public void setfThumbnail(String fThumbnail) {
		this.fThumbnail = fThumbnail;
	}

	public DetailVO() {
		fOrderNum = 1;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getfImg() {
		return fImg;
	}
	public void setfImg(String fImg) {
		this.fImg = fImg;
	}
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
	public int getfCategory() {
		return fCategory;
	}
	public void setfCategory(int fCategory) {
		this.fCategory = fCategory;
	}
	public String getfInfo() {
		return fInfo;
	}
	public void setfInfo(String fInfo) {
		this.fInfo = fInfo;
	}
	public int getfQuant() {
		return fQuant;
	}
	public void setfQuant(int fQuant) {
		this.fQuant = fQuant;
		fOrderprice = fPrice * fOrderNum;
	}
	public int getfOrderNum() {
		return fOrderNum;
	}
	public void setfOrderNum(int fOrderNum) {
		this.fOrderNum = fOrderNum;
	}
	public int getfOrderprice() {
		return fOrderprice;
	}
	public void setfOrderprice(int fOrderprice) {
		this.fOrderprice = fOrderprice;
	}
	
	@Override
	public String toString() {
		return "DetailVO [fId=" + fId + ", fName=" + fName + ", fPrice=" + fPrice + ", fImg=" + fImg + ", fCategory="
				+ fCategory + ", fInfo=" + fInfo + ", fQuant=" + fQuant + ", fOrderNum=" + fOrderNum + ", fOrderprice="
				+ fOrderprice + "]";
	}
	
}
