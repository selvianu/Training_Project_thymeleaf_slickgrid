package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class Manager {
	private String managerId;
	private String managerName;
	private Long managerPhoneNo;
	private Long managerAadharNo;
	private String managerMailId;
	private String managerAddress;
	private String managerPassword;
	private String managerZoneId;
	private Long managerAccountNo;

	// constructor

	public Manager() {

	}

	public Manager(String managerId, String managerName, Long managerPhoneNo, Long managerAadharNo,
			String managerMailId) {
		super();
		this.managerId = managerId;
		this.managerName = managerName;
		this.managerPhoneNo = managerPhoneNo;
		this.managerAadharNo = managerAadharNo;
		this.managerMailId = managerMailId;
	}

	// getter setter
	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public Long getManagerPhoneNo() {
		return managerPhoneNo;
	}

	public void setManagerPhoneNo(Long managerPhoneNo) {
		this.managerPhoneNo = managerPhoneNo;
	}

	public Long getManagerAadharNo() {
		return managerAadharNo;
	}

	public void setManagerAadharNo(Long managerAadharNo) {
		this.managerAadharNo = managerAadharNo;
	}

	public String getManagerMailId() {
		return managerMailId;
	}

	public void setManagerMailId(String managerMailId) {
		this.managerMailId = managerMailId;
	}

	public String getManagerAddress() {
		return managerAddress;
	}

	public void setManagerAddress(String managerAddress) {
		this.managerAddress = managerAddress;
	}

	public String getManagerPassword() {
		return managerPassword;
	}

	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}

	public String getManagerZoneId() {
		return managerZoneId;
	}

	public void setManagerZoneId(String managerZoneId) {
		this.managerZoneId = managerZoneId;
	}

	public Long getManagerAccountNo() {
		return managerAccountNo;
	}

	public void setManagerAccountNo(Long managerAccountNo) {
		this.managerAccountNo = managerAccountNo;
	}

	// toString
	@Override
	public String toString() {
		return "Manager [managerId=" + managerId + ", managerName=" + managerName + ", managerPhoneNo=" + managerPhoneNo
				+ ", managerAadharNo=" + managerAadharNo + ", managerMailId=" + managerMailId + ", managerAddress="
				+ managerAddress + ", managerPassword=" + managerPassword + ", managerZoneId=" + managerZoneId
				+ ", managerAccountNo=" + managerAccountNo + "]";
	}

}
