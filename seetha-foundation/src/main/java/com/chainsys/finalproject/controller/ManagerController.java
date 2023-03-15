package com.chainsys.finalproject.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.finalproject.dao.DistributorDao;
import com.chainsys.finalproject.dao.ManagerDao;
import com.chainsys.finalproject.dao.Ngo;

import com.chainsys.finalproject.mapper.DonationHistoryMapper;
import com.chainsys.finalproject.ngo.Consumer;
import com.chainsys.finalproject.ngo.Distributor;
import com.chainsys.finalproject.ngo.DonationHistory;
import com.chainsys.finalproject.ngo.DonationStatus;
import com.chainsys.finalproject.ngo.LoginDetails;
import com.chainsys.finalproject.ngo.Manager;
import com.chainsys.finalproject.service.ManagerService;
import com.chainsys.finalproject.service.NgoService;
import com.chainsys.finalproject.service.StaffService;
import com.chainsys.finalproject.validation.Validation;

@Controller
public class ManagerController {
	Ngo projectDao = new Ngo();

	ManagerDao managerDao = new ManagerDao();

	DistributorDao staffDao = new DistributorDao();

	NgoService ngoService = new NgoService();

	StaffService staffService = new StaffService();

	ManagerService managerService = new ManagerService();

	LoginDetails login = new LoginDetails();

	// distributor register by manager controller

	@PostMapping("/DistributorRegisterByManager")
	public String distributorRegisterByManager(@RequestParam("donorName") String managerName,
			@RequestParam("phoneNumber") Long phoneNumber, @RequestParam("aadharNumber") Long aadharNumber,
			@RequestParam("mail") String mailId, @RequestParam("pass") String password,
			@RequestParam("zone") String zoneId, @RequestParam("address") String address,
			@RequestParam("accountNumber") Long accountNumber, HttpSession session) {
		Distributor distributor = new Distributor();
		Validation validate = new Validation();

		for (int i = 1; i < 13; i++) {

			session.removeAttribute("errorMessage" + i);

		}

		// checking duplicate mail id from database
		// checking duplicate aadharNumber from database
		// checking duplicate accountNumber from database
		// checking duplicate phoneNumber from database

		if (Boolean.FALSE.equals(validate.accountNo(accountNumber, session))
				|| Boolean.FALSE.equals(validate.addressLength(address, session))
				|| Boolean.FALSE.equals(validate.passwordLength(password, session))
				|| Boolean.FALSE.equals(validate.email(mailId, session))
				|| Boolean.FALSE.equals(validate.aadharNo(aadharNumber, session))
				|| Boolean.FALSE.equals(validate.phoneNoLength(phoneNumber, session))
				|| Boolean.FALSE.equals(validate.nameCheck(managerName, session))
				|| Boolean.FALSE.equals(staffDao.mailCheckStaff(mailId, session))
				|| Boolean.FALSE.equals(staffDao.aadharNumberCheckStaff(aadharNumber, session))
				|| Boolean.FALSE.equals(projectDao.accountNumberCheck(accountNumber, session))
				|| Boolean.FALSE.equals(staffDao.phoneNumberCheckStaff(phoneNumber, session))) {

			return "PopupRegisterStatus";
		}

		distributor.setDistributorName(managerName);
		distributor.setPhoneNo(phoneNumber);
		distributor.setAadharNo(aadharNumber);
		distributor.setMailId(mailId);
		distributor.setPassword(password);
		distributor.setZoneId(zoneId);
		distributor.setAddress(address);
		distributor.setAccountNo(accountNumber);

		ngoService.distributorRegisterService(distributor, session);

		return "PopupStaffRegisterByManagerSucess";

	}

	@RequestMapping("/DonationStatus")
	public String donationStatus(HttpSession session) {

		managerService.donationStatusService(session);

		return "DonationStatus";
	}

	@RequestMapping("/DonationInfo")
	public String donationInfo(HttpSession session) {

		String staffZoneId = (String) session.getAttribute("getManagerZoneId");
		staffService.getDonationInfoZonewiseService(staffZoneId, session);

		return "DonationInfoPage";
	}

	@PostMapping("/Approve")
	public String approval(@RequestParam("checkBox") String donationId, HttpSession session) {

		ngoService.approveDonationStatusService(donationId, session);

		return "PopupDonationApprove";
	}

	@PostMapping("/Reject")
	public String rejection(@RequestParam("checkBox") String donationId, HttpSession session) {

		ngoService.rejectDonationStatusService(donationId, session);
		return "PopupDonationReject";
	}

}
