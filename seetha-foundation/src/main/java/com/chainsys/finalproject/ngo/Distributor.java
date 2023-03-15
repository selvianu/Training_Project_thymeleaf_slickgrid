package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class Distributor {
	private String distributorId;
	private String distributorName;
	private Long phoneNo;
	private Long aadharNo;
	private String mailId;
	private String address;
	private String password;
	private String zoneId;
	private Long accountNo;
	
	//constructor
	public Distributor() {
		
	}

	public Distributor(String distributorId, String distributorName, Long phoneNo, Long aadharNo, String mailId) {
		super();
		this.distributorId = distributorId;
		this.distributorName = distributorName;
		this.phoneNo = phoneNo;
		this.aadharNo = aadharNo;
		this.mailId = mailId;
	}

	public Distributor(String address, String password, String zoneId, Long accountNo) {
		super();
		this.address = address;
		this.password = password;
		this.zoneId = zoneId;
		this.accountNo = accountNo;
	}
	
	//getter setter

	public String getDistributorId() {
		return distributorId;
	}

	public void setDistributorId(String distributorId) {
		this.distributorId = distributorId;
	}

	public String getDistributorName() {
		return distributorName;
	}

	public void setDistributorName(String distributorName) {
		this.distributorName = distributorName;
	}

	public Long getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(Long phoneNo) {
		this.phoneNo = phoneNo;
	}

	public Long getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(Long aadharNo) {
		this.aadharNo = aadharNo;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public Long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}

	//toString
	@Override
	public String toString() {
		return "Distributor [distributorId=" + distributorId + ", distributorName=" + distributorName + ", phoneNo="
				+ phoneNo + ", aadharNo=" + aadharNo + ", mailId=" + mailId + ", address=" + address + ", password="
				+ password + ", zoneId=" + zoneId + ", accountNo=" + accountNo + "]";
	}

	
	
}
