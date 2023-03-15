package com.chainsys.finalproject.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.finalproject.connection.ConnectionUtil;
import com.chainsys.finalproject.mapper.CheckExitingAadharNoMapper;
import com.chainsys.finalproject.mapper.CheckExitingMailIdMapper;
import com.chainsys.finalproject.mapper.CheckExitingPhoneNoMapper;
import com.chainsys.finalproject.mapper.DonationStatusMapper;
import com.chainsys.finalproject.ngo.DonationStatus;
import com.chainsys.finalproject.ngo.Manager;
import com.chainsys.finalproject.ngo.ZoneId;
import com.chainsys.finalproject.ngointerface.ManagerInterface;


public class ManagerDao implements ManagerInterface {

	JdbcTemplate jdbc= ConnectionUtil.getJdbcTemplate();

	// check mail id whether already present or not in the records
	public Boolean mailCheck(String mailId, HttpSession session) {

		String query = "SELECT MAIL_ID FROM management where mail_id=?";
		List<Manager> mailIdList = jdbc.query(query, new CheckExitingMailIdMapper(), mailId);

		for (Manager checkMailId : mailIdList) {

			String mail = checkMailId.getManagerMailId();
			if (mail.equals(mailId)) {

				String errorMessage = "given mail Id is already exits try with different mail Id!";

				session.setAttribute("errorMessage9", errorMessage);
				return false;

			}
		}
		return true;

	}

	// check mail id whether already present or not in the records
	public Boolean phoneNumberCheck(Long phoneNo, HttpSession session) {

		String query = "SELECT PHONE_NO FROM management where PHONE_NO=?";
		List<Manager> phoneNoList = jdbc.query(query, new CheckExitingPhoneNoMapper(), phoneNo);

		for (Manager checkPhoneNo : phoneNoList) {

			Long phoneNumber = checkPhoneNo.getManagerPhoneNo();
			if (phoneNumber.equals(phoneNo)) {

				String errorMessage = "given Phone number is already exits try with different Phone number!";

				session.setAttribute("errorMessage10", errorMessage);
				return false;

			}
		}
		return true;

	}

	// check aadhar Number whether already present or not in the records
	public Boolean aadharNumberCheck(Long aadharNo, HttpSession session) {

		String query = "SELECT AADHAR_NO FROM management where AADHAR_NO=?";
		List<Manager> aadharNoList = jdbc.query(query, new CheckExitingAadharNoMapper(), aadharNo);

		for (Manager checkAadharNo : aadharNoList) {

			Long aadharNumber = checkAadharNo.getManagerAadharNo();
			if (aadharNumber.equals(aadharNo)) {

				String errorMessage = "given Aadhar number is already exits try with different Aadhar number!";

				session.setAttribute("errorMessage11", errorMessage);
				return false;

			}
		}
		return true;
	}

	// get donation details by zoneId pending status
	public void getDonationSatus(ZoneId zoneId, HttpSession session) {

		String locationId = zoneId.getLocationId();
		String getDonationDetailsQuery = "SELECT CONCAT(prefix,h_id) as donation_id, staff_id,consumer_id,stock_id,"
				+ "quantity,fund_amount,description,donation_date,approved_by,approval_status,zone_id FROM donation"
				+ " where zone_id=? and approval_status='Pending'";
		List<DonationStatus> donationStatusList = jdbc.query(getDonationDetailsQuery, new DonationStatusMapper(),
				locationId);

		session.setAttribute("donationStatusDetails", donationStatusList);

	}

	

}
