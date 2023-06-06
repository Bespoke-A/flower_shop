package com.project.flower.member.vo;

public class PaymentVO {
	private int paymentId; //주문번호
	private String userId; //유저아이디
	private String paymentDate; //결제일시 
	private int paymentSudan; //결제수단 0:카드 1:만나서결제
	private int pickDel; // 1:픽업 or 0:배달
	private String fId; // 꽃 품명
	private int fPrice; // 꽃 가격
	private int cnt; //결제 수량
	private int totPrice; // 총결제 금액
	private String pickDay; //픽업예정일자
	private String delDay; //배달예정일자
	private String fname; //상품이름
	private int complete;
	
	
	public String getPickDay() {
		return pickDay;
	}
	public void setPickDay(String pickDay) {
		this.pickDay = pickDay;
	}
	public String getDelDay() {
		return delDay;
	}
	public void setDelDay(String delDay) {
		this.delDay = delDay;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public int getPaymentId() {
		return paymentId;
	}
	public String getfname() {
		return fname;
	}
	public void setF_name(String fname) {
		this.fname = fname;
	}
	
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getPaymentSudan() {
		return paymentSudan;
	}
	public void setPaymentSudan(int paymentSudan) {
		this.paymentSudan = paymentSudan;
	}
	public int getPickDel() {
		return pickDel;
	}
	public void setPickDel(int pickDel) {
		this.pickDel = pickDel;
	}
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public int getfPrice() {
		return fPrice;
	}
	public void setfPrice(int fPrice) {
		this.fPrice = fPrice;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotPrice() {
		totPrice = fPrice * cnt;
		return totPrice;
	}
	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}
	@Override
	public String toString() {
		return "PaymentVO [paymentId=" + paymentId + ", userId=" + userId + ", paymentDate=" + paymentDate
				+ ", paymentSudan=" + paymentSudan + ", pickDel=" + pickDel + ", fId=" + fId + ", fPrice=" + fPrice
				+ ", cnt=" + cnt + ", totPrice=" + totPrice + ", pickDay=" + pickDay + ", delDay=" + delDay + ", fname="
				+ fname + ", complete=" + complete + "]";
	}
	
	
	
}
