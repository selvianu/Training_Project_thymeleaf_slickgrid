package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class LoginDetails {

	private String loginType;
	private String userId;
	private String password;

	public LoginDetails() {

	}

	// constructor
	public LoginDetails(String loginType, String userId, String password) {
		super();
		this.loginType = loginType;
		this.userId = userId;
		this.password = password;
	}

	// setter and getter
	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// toString
	@Override
	public String toString() {
		return "LoginDetails [loginType=" + loginType + ", userId=" + userId + ", password=" + password + "]";
	}

}
