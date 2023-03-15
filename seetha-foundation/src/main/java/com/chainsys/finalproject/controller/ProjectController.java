package com.chainsys.finalproject.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.finalproject.dao.Ngo;

import com.chainsys.finalproject.mapper.DonationHistoryMapper;
import com.chainsys.finalproject.ngo.Consumer;
import com.chainsys.finalproject.ngo.Distributor;
import com.chainsys.finalproject.ngo.DonationHistory;
import com.chainsys.finalproject.ngo.DonationStatus;
import com.chainsys.finalproject.ngo.Donor;
import com.chainsys.finalproject.ngo.LoginDetails;
import com.chainsys.finalproject.ngo.Manager;
import com.chainsys.finalproject.service.NgoService;
import com.chainsys.finalproject.validation.Validation;

@Controller
public class ProjectController {

	Ngo projectDao = new Ngo();

	NgoService ngoService = new NgoService();

	LoginDetails login = new LoginDetails();

	@RequestMapping("/")
	public String landingPage() {

		return "LandingPage.html";
	}
	

	@RequestMapping("/AboutUs")
	public String aboutUs(HttpServletRequest request) {
		request.setAttribute("scrollTo", "about-content");
		return "LandingPage";
	}

	@RequestMapping("/ContactUs")
	public String contactUs(HttpServletRequest request) {
		request.setAttribute("scrollTo", "contactUs");
		return "LandingPage";
	}
	
	@RequestMapping("/Service")
	public String servicePage(HttpSession session, Model model) {

		ngoService.getServiceDetailsService(session, model);
		return "Service";
	}

	@PostMapping("/Login")
	public String login(@RequestParam("loginType") String loginType, @RequestParam("userId") String userId,
			@RequestParam("password") String password, Model model, HttpSession session) {

		login.setLoginType(loginType);
		login.setUserId(userId);
		login.setPassword(password);

		switch (loginType) {
		case "admin":

			if (Boolean.TRUE.equals(ngoService.adminCheckService(login, session, model))) {

				return "AdminPage";
			}
			break;

		case "management":
			if (Boolean.TRUE.equals(ngoService.managerCheckService(login, session))) {

				return "ManagerPage";
			}
			break;
		case "distributor":
			if (Boolean.TRUE.equals(ngoService.staffCheckService(login, session))) {

				return "StaffPage";
			}
			break;
		default:

			return "PopupLoginStatus";

		}
		return "PopupLoginStatus";
	}

	@RequestMapping("/Logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "Login";
	}

	@PostMapping("/Donation")
	public String donation(@RequestParam("amount") Float foundAmount) throws NoSuchAlgorithmException {
		ngoService.donationService(foundAmount);

		return "PopupDonation";
	}

	// distributor register by manager controller
	@PostMapping("/DonorRegister")
	public String donorRegister(@RequestParam("donorName") String managerName,
			@RequestParam("phoneNumber") Long phoneNumber, @RequestParam("aadharNumber") Long aadharNumber,
			@RequestParam("mail") String mailId, @RequestParam("pass") String password,
			@RequestParam("zone") String zoneId, @RequestParam("address") String address,
			@RequestParam("accountNumber") Long accountNumber, HttpSession session) {
		Donor donor = new Donor();
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
				|| Boolean.FALSE.equals(projectDao.mailCheckDonor(mailId, session))
				|| Boolean.FALSE.equals(projectDao.aadharNumberCheckDonor(aadharNumber, session))
				|| Boolean.FALSE.equals(projectDao.accountNumberCheck(accountNumber, session))
				|| Boolean.FALSE.equals(projectDao.phoneNumberCheckDonor(phoneNumber, session))) {

			return "PopupRegisterStatus";
		}

		donor.setVolunteerName(managerName);
		donor.setVolunteerPhoneNo(phoneNumber);
		donor.setVolunteerAadharNo(aadharNumber);
		donor.setVolunteerMailId(mailId);
		donor.setVolunteerPassword(password);
		donor.setVolunteerZoneId(zoneId);
		donor.setVolunteerAddress(address);
		donor.setVolunteerAccountNo(accountNumber);

		ngoService.donorRegisterService(donor, session);

		return "PopupDonorSucess";

	}

}
