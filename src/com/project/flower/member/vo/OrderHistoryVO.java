package com.project.flower.member.vo;

public class OrderHistoryVO {
	private int orderNum; //주문순서번호
	private int paymentId; //주문번호
	private int complete; //0:미완료, 1:완료
	private String completeDate; //완료일시
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public String getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}
	@Override
	public String toString() {
		return "OrderHistoryVO [orderNum=" + orderNum + ", paymentId=" + paymentId + ", complete=" + complete
				+ ", completeDate=" + completeDate + "]";
	}
	
	
}
