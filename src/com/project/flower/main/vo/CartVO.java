package com.project.flower.main.vo;

public class CartVO {
	private int cartNum; // 장바구니번호
	private String userId; //유저아이디
	private String fId; //꽃품명
	private int cntCart; //장바구니에 담은 꽃 수량
	private int fPrice; //꽃 가격
	private int totPrice; //합계
	private String fThumbnail; //꽃 썸네일 이미지
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
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
	public int getCntCart() {
		return cntCart;
	}
	public void setCntCart(int cntCart) {
		this.cntCart = cntCart;
	}
	public int getfPrice() {
		return fPrice;
	}
	public void setfPrice(int fPrice) {
		this.fPrice = fPrice;
	}
	public int getTotPrice() {
		totPrice = fPrice * cntCart;
		return totPrice;
	}
	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}
	public String getfThumbnail() {
		return fThumbnail;
	}
	public void setfThumbnail(String fThumbnail) {
		this.fThumbnail = fThumbnail;
	}
	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", userId=" + userId + ", fId=" + fId + ", cntCart=" + cntCart
				+ ", fPrice=" + fPrice + ", totPrice=" + totPrice + ", fThumbnail=" + fThumbnail + "]";
	}
	
	
}
