package com.chainsys.finalproject.ngointerface;

import javax.servlet.http.HttpSession;

import com.chainsys.finalproject.ngo.DonationStatus;
import com.chainsys.finalproject.ngo.ZoneId;

public interface ManagerInterface {
	// check mail id whether already present or not in the records
	public Boolean mailCheck(String mailId, HttpSession session);

	// check mail id whether already present or not in the records
	public Boolean phoneNumberCheck(Long phoneNo, HttpSession session);

	// check aadhar Number whether already present or not in the records
	public Boolean aadharNumberCheck(Long aadharNo, HttpSession session);

	// get donation details by zoneId
	public void getDonationSatus(ZoneId zoneId, HttpSession session);

	
}
