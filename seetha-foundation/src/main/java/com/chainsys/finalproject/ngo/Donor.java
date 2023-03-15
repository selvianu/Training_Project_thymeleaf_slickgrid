package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class Donor {
	private String volunteerId;
	private String volunteerName;
	private Long volunteerPhoneNo;
	private Long volunteerAadharNo;
	private String volunteerPassword;
	private String volunteerMailId;
	private String volunteerAddress;
	private String volunteerZoneId;
	private Long volunteerAccountNo;

	// constructor
	public Donor() {

	}

	public Donor(String volunteerId, String volunteerName, Long volunteerPhoneNo, Long volunteerAadharNo,
			String volunteerPassword) {
		super();
		this.volunteerId = volunteerId;
		this.volunteerName = volunteerName;
		this.volunteerPhoneNo = volunteerPhoneNo;
		this.volunteerAadharNo = volunteerAadharNo;
		this.volunteerPassword = volunteerPassword;
	}

	public Donor(String volunteerMailId, String volunteerAddress, String volunteerZoneId, Long volunteerAccountNo) {
		super();
		this.volunteerMailId = volunteerMailId;
		this.volunteerAddress = volunteerAddress;
		this.volunteerZoneId = volunteerZoneId;
		this.volunteerAccountNo = volunteerAccountNo;
	}

	// getter setter
	public String getVolunteerId() {
		return volunteerId;
	}

	public void setVolunteerId(String volunteerId) {
		this.volunteerId = volunteerId;
	}

	public String getVolunteerName() {
		return volunteerName;
	}

	public void setVolunteerName(String volunteerName) {
		this.volunteerName = volunteerName;
	}

	public Long getVolunteerPhoneNo() {
		return volunteerPhoneNo;
	}

	public void setVolunteerPhoneNo(Long volunteerPhoneNo) {
		this.volunteerPhoneNo = volunteerPhoneNo;
	}

	public Long getVolunteerAadharNo() {
		return volunteerAadharNo;
	}

	public void setVolunteerAadharNo(Long volunteerAadharNo) {
		this.volunteerAadharNo = volunteerAadharNo;
	}

	public String getVolunteerPassword() {
		return volunteerPassword;
	}

	public void setVolunteerPassword(String volunteerPassword) {
		this.volunteerPassword = volunteerPassword;
	}

	public String getVolunteerMailId() {
		return volunteerMailId;
	}

	public void setVolunteerMailId(String volunteerMailId) {
		this.volunteerMailId = volunteerMailId;
	}

	public String getVolunteerAddress() {
		return volunteerAddress;
	}

	public void setVolunteerAddress(String volunteerAddress) {
		this.volunteerAddress = volunteerAddress;
	}

	public String getVolunteerZoneId() {
		return volunteerZoneId;
	}

	public void setVolunteerZoneId(String volunteerZoneId) {
		this.volunteerZoneId = volunteerZoneId;
	}

	public Long getVolunteerAccountNo() {
		return volunteerAccountNo;
	}

	public void setVolunteerAccountNo(Long volunteerAccountNo) {
		this.volunteerAccountNo = volunteerAccountNo;
	}

	// toString
	@Override
	public String toString() {
		return "Donor [volunteerId=" + volunteerId + ", volunteerName=" + volunteerName + ", volunteerPhoneNo="
				+ volunteerPhoneNo + ", volunteerAadharNo=" + volunteerAadharNo + ", volunteerPassword="
				+ volunteerPassword + ", volunteerMailId=" + volunteerMailId + ", volunteerAddress=" + volunteerAddress
				+ ", volunteerZoneId=" + volunteerZoneId + ", volunteerAccountNo=" + volunteerAccountNo + "]";
	}

}
