package com.chainsys.finalproject.ngointerface;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.chainsys.finalproject.ngo.Donor;
import com.chainsys.finalproject.ngo.LoginDetails;
import com.chainsys.finalproject.ngo.Manager;

public interface NgoInterface {
	public Boolean adminLogCheck(HttpSession session, LoginDetails login,Model model);

	public Boolean managerLogCheck(HttpSession session, LoginDetails login);

	public Boolean staffLogCheck(HttpSession session, LoginDetails login);

	// Register manager
	public void managerRegister(Manager manager, HttpSession session);

	// check mail id whether already present or not in the records
	public Boolean accountNumberCheck(Long accountNo, HttpSession session);

	// update approval in donation status table
	public void approveDonationStatus(String donationId, HttpSession session);

	// update reject in donation status table
	public void rejectDonationStatus(String donationId, HttpSession session);

	// get stock details from warehouse table by zoneId
	public void stockDetailsZoneWise(String zoneId, HttpSession session);

	// get stock details from warehouse
	public void stockDetails(HttpSession session);

	// update donation history details by donation details
	public void updateDonationHistory();

	// insert fund amount to fund table and update transaction table
	public void donation(Float fund) throws NoSuchAlgorithmException;

	// Donor manager
	public void donorRegister(Donor donor, HttpSession session);
}
