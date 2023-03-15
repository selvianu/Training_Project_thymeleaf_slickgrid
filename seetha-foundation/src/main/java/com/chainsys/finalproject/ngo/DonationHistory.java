package com.chainsys.finalproject.ngo;

import org.springframework.stereotype.Repository;

public class DonationHistory {

	String historyId;
	String donationYear;
	String zoneId;
	Integer noOfCivilians;
	String donationCause;
	Float donationExpenses;
	
	//constructor
	public DonationHistory() {
		
	}
	
	public DonationHistory(String historyId,String donationYear, String zoneId, Integer noOfCivilians, String donationCause,
			Float donationExpenses) {
		super();
		this.historyId = historyId;
		this.donationYear=donationYear;
		this.zoneId = zoneId;
		this.noOfCivilians = noOfCivilians;
		this.donationCause = donationCause;
		this.donationExpenses = donationExpenses;
	}
	
	//setter getters
	public String getHistoryId() {
		return historyId;
	}
	public void setHistoryId(String historyId) {
		this.historyId = historyId;
	}
	public String getDonationYear() {
		return donationYear;
	}
	public void setDonationYear(String donationYear) {
		this.donationYear = donationYear;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	public Integer getNoOfCivilians() {
		return noOfCivilians;
	}
	public void setNoOfCivilians(Integer noOfCivilians) {
		this.noOfCivilians = noOfCivilians;
	}
	public String getDonationCause() {
		return donationCause;
	}
	public void setDonationCause(String donationCause) {
		this.donationCause = donationCause;
	}
	public Float getDonationExpenses() {
		return donationExpenses;
	}
	public void setDonationExpenses(Float donationExpenses) {
		this.donationExpenses = donationExpenses;
	}
	
	//toString
	@Override
	public String toString() {
		return "DonationHistory [historyId=" + historyId + ", donationYear=" + donationYear + ", zoneId=" + zoneId
				+ ", noOfCivilians=" + noOfCivilians + ", donationCause=" + donationCause + ", donationExpenses="
				+ donationExpenses + "]";
	}
	
	
	
	
	
}
