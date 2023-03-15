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
import com.chainsys.finalproject.ngointerface.DistributorInterface;


public class DistributorDao implements DistributorInterface {
	
	JdbcTemplate jdbc = ConnectionUtil.getJdbcTemplate();

	// check aadhar Number whether already present or not in the records
	public Boolean aadharNumberCheckStaff(Long aadharNo, HttpSession session) {

		String query = "SELECT AADHAR_NO FROM distributor where AADHAR_NO=?";
		List<Manager> aadharNoList = jdbc.query(query, new CheckExitingAadharNoMapper(), aadharNo);

		for (Manager checkAadharNo : aadharNoList) {

			Long aadharNumber = checkAadharNo.getManagerAadharNo();
			if (aadharNumber.equals(aadharNo)) {

				String errorMessage = "given Aadhar number is already exits!";

				session.setAttribute("errorMessage11", errorMessage);
				return false;

			}
		}
		return true;
	}

	// check mail id whether already present or not in the records
	public Boolean phoneNumberCheckStaff(Long phoneNo, HttpSession session) {

		String query = "SELECT PHONE_NO FROM distributor where PHONE_NO=?";
		List<Manager> phoneNoList = jdbc.query(query, new CheckExitingPhoneNoMapper(), phoneNo);

		for (Manager checkPhoneNo : phoneNoList) {

			Long phoneNumber = checkPhoneNo.getManagerPhoneNo();
			if (phoneNumber.equals(phoneNo)) {

				String errorMessage = "Try with different Phone number given Phone number is already exits!";

				session.setAttribute("errorMessage10", errorMessage);
				return false;

			}
		}
		return true;

	}

	// check mail id whether already present or not in the records
	public Boolean mailCheckStaff(String mailId, HttpSession session) {

		String query = "SELECT MAIL_ID FROM distributor where mail_id=?";
		List<Manager> mailIdList = jdbc.query(query, new CheckExitingMailIdMapper(), mailId);

		for (Manager checkMailId : mailIdList) {

			String mail = checkMailId.getManagerMailId();
			if (mail.equals(mailId)) {

				String errorMessage = "try with different mail Id given mail Id is already exits!";

				session.setAttribute("errorMessage9", errorMessage);
				return false;

			}
		}
		return true;

	}

	// get donation Info by zoneId
	public void getDonationInfoZonewise(String zoneId, HttpSession session) {
		String getDonationInfoQuery = "SELECT CONCAT(prefix,h_id) as donation_id, staff_id,consumer_id,stock_id,"
				+ "quantity,fund_amount,description,donation_date,approved_by,approval_status,zone_id FROM donation"
				+ " where zone_id=?";
		List<DonationStatus> donationInfoList = jdbc.query(getDonationInfoQuery, new DonationStatusMapper(), zoneId);
		session.setAttribute("donationInfoDetails", donationInfoList);

	}

	// insert donation request into donation table
	public void applyDonation(DonationStatus donationApply, HttpSession session) {
		String staffZoneId = (String) session.getAttribute("staffZoneId");
		String consumerId = (String) session.getAttribute("consumerId");
		String managerId = (String) session.getAttribute("staffId");
		String stockId = donationApply.getStockId();
		Integer quantity = donationApply.getQuantity();
		Float fundAmount = donationApply.getFundAmount();
		String description = donationApply.getDescription();
		String approvalStatus = "Pending";

		Object[] applyDonationValues = { managerId, consumerId, stockId, quantity, fundAmount, description,
				approvalStatus, staffZoneId };

		String applyDonationQuery = "INSERT INTO donation (staff_id,consumer_id,stock_id,quantity,fund_amount,description,donation_date,approval_status,zone_id) \r\n"
				+ "VALUES(?,?,?,?,?,?,LOCALTIMESTAMP,?,?)";
		jdbc.update(applyDonationQuery, applyDonationValues);

	}

	// insert stock into stock table
	public void addStock(DonationStatus donationApply, HttpSession session) {

		String employeeId = (String) session.getAttribute("staffId");
		String warehouseId = (String) session.getAttribute("warehouseId");
		Integer quantity = donationApply.getQuantity();
		String stockName = donationApply.getDescription();

		Object[] addStockValues = { stockName, quantity, employeeId, warehouseId };

		String addStockQuery = "INSERT INTO stock(stock_name, quantity, staff_id, warehouse_id ) VALUES (?,?,?,?)";
		jdbc.update(addStockQuery, addStockValues);

	}

}
