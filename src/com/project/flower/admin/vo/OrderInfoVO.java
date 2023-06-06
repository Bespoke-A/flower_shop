package com.project.flower.admin.vo;

public class OrderInfoVO {
	private int paymentId;
	private int pickDel;
	private String userName;
	private String userPhone;
	private String userAddr;
	private String fId;
	private int cnt; 
	private int totPrice;
	private int paymentSudan;
	private String paymentDate;
	private String pickDay;
	private String delDay;
	private int complete;
	
	
	
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public int getPaymentSudan() {
		return paymentSudan;
	}
	public void setPaymentSudan(int paymentSudan) {
		this.paymentSudan = paymentSudan;
	}
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public int getPickDel() {
		return pickDel;
	}
	public void setPickDel(int pickDel) {
		this.pickDel = pickDel;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotPrice() {
		return totPrice;
	}
	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
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
	@Override
	public String toString() {
		return "OrderInfoVO [paymentId=" + paymentId + ", pickDel=" + pickDel + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userAddr=" + userAddr + ", fId=" + fId + ", cnt=" + cnt
				+ ", totPrice=" + totPrice + ", paymentSudan=" + paymentSudan + ", paymentDate=" + paymentDate
				+ ", pickDay=" + pickDay + ", delDay=" + delDay + ", complete=" + complete + "]";
	}


	
}
