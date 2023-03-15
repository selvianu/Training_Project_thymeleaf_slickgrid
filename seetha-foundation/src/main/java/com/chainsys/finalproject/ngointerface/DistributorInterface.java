package com.chainsys.finalproject.ngointerface;

import javax.servlet.http.HttpSession;

import com.chainsys.finalproject.ngo.DonationStatus;

public interface DistributorInterface {

	// check aadhar Number whether already present or not in the records
	public Boolean aadharNumberCheckStaff(Long aadharNo, HttpSession session);

	// check mail id whether already present or not in the records
	public Boolean phoneNumberCheckStaff(Long phoneNo, HttpSession session);

	// check mail id whether already present or not in the records
	public Boolean mailCheckStaff(String mailId, HttpSession session);

	// get donation Info by zoneId
	public void getDonationInfoZonewise(String zoneId, HttpSession session);

	// insert donation request into donation table
	public void applyDonation(DonationStatus donationApply, HttpSession session);

	// insert stock into stock table
	public void addStock(DonationStatus donationApply, HttpSession session);
}
