package com.project.flower.admin.vo;

public class SalesInfoVO {
	
	private String year;
	private String month;
	private String day;
	private String fId;
	private String fName;
	private int fPrice;
	private int cnt;
	private int totalPrice;
	private int yearTot;
	private int monthTot;
	private int dayTot;
	
	public int getYearTot() {
		return yearTot;
	}
	public void setYearTot(int yearTot) {
		this.yearTot = yearTot;
	}
	public int getMonthTot() {
		return monthTot;
	}
	public void setMonthTot(int monthTot) {
		this.monthTot = monthTot;
	}
	public int getDayTot() {
		return dayTot;
	}
	public void setDayTot(int dayTot) {
		this.dayTot = dayTot;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "SalesInfoVO [year=" + year + ", month=" + month + ", day=" + day + ", fId=" + fId + ", fName=" + fName
				+ ", fPrice=" + fPrice + ", cnt=" + cnt + ", totalPrice=" + totalPrice + "]";
	}
	
	
}
