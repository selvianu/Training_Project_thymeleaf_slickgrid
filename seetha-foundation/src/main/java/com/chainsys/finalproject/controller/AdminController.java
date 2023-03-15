package com.chainsys.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.finalproject.dao.ManagerDao;
import com.chainsys.finalproject.dao.Ngo;

import com.chainsys.finalproject.ngo.LoginDetails;
import com.chainsys.finalproject.ngo.Manager;
import com.chainsys.finalproject.service.NgoService;
import com.chainsys.finalproject.validation.Validation;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class AdminController {
	
	Ngo projectDao = new Ngo();

	ManagerDao managerDao = new ManagerDao();

	NgoService ngoService = new NgoService();

	LoginDetails login = new LoginDetails();

	// manager register controller

	@PostMapping("/ManagerRegister")
	public String managerRegistor(@RequestParam("managerName") String managerName,
			@RequestParam("managerPhoneNumber") Long phoneNumber,
			@RequestParam("managerAadharNumber") Long aadharNumber, @RequestParam("managerMailId") String mailId,
			@RequestParam("managerPass") String password, @RequestParam("managerZone") String zoneId,
			@RequestParam("managerAddress") String address, @RequestParam("managerAccountNumber") Long accountNumber,
			HttpSession session) {
		Manager manager = new Manager();
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
				|| Boolean.FALSE.equals(managerDao.mailCheck(mailId, session))
				|| Boolean.FALSE.equals(managerDao.aadharNumberCheck(aadharNumber, session))
				|| Boolean.FALSE.equals(projectDao.accountNumberCheck(accountNumber, session))
				|| Boolean.FALSE.equals(managerDao.phoneNumberCheck(phoneNumber, session))) {

			return "PopupRegisterStatus";
		}

		manager.setManagerName(managerName);
		manager.setManagerPhoneNo(phoneNumber);
		manager.setManagerAadharNo(aadharNumber);
		manager.setManagerMailId(mailId);
		manager.setManagerPassword(password);
		manager.setManagerZoneId(zoneId);
		manager.setManagerAddress(address);
		manager.setManagerAccountNo(accountNumber);

		ngoService.managerRegisterService(manager, session);

		return "PopupRegisterSucess";

	}

	@RequestMapping("/ManagerDetails")
	public String managerDetails(HttpSession session,Model model) throws JsonProcessingException {

		ngoService.managerDetailsService(session,model);

		return "ManagerInfoPage";
	}
	
	@RequestMapping("/sample")
	public String samplePage(HttpSession session, Model model) throws JsonProcessingException {
		ngoService.managerDetailsService(session, model);
		
		return "ManagerInfoGrid";
	}

	@RequestMapping("/DistributorDetails")
	public String distributorDetails(HttpSession session) {

		ngoService.distributorDetailsService(session);

		return "DistributorInfoPage";
	}

	@RequestMapping("/DonationHistory")
	public String donationHistory(HttpSession session) {

		ngoService.donationHistoryService(session);

		return "DonationHistory";

	}

}
