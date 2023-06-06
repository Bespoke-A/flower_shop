package com.project.flower.admin.vo;

public class MemberVO {
	private String userId; 
	private String userPwd;
	private String userName;
	private String userPhone;
	private String userBirth;
	private String userAddr;
	private String userEmail;
	private String userRegdate; 
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
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
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userPhone="
				+ userPhone + ", userBirth=" + userBirth + ", userAddr=" + userAddr + ", userEmail=" + userEmail
				+ ", userRegdate=" + userRegdate + "]";
	}
	
	
}
