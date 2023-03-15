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

import com.chainsys.finalproject.dao.Ngo;

import com.chainsys.finalproject.mapper.DonationHistoryMapper;
import com.chainsys.finalproject.ngo.Consumer;
import com.chainsys.finalproject.ngo.Distributor;
import com.chainsys.finalproject.ngo.DonationHistory;
import com.chainsys.finalproject.ngo.DonationStatus;
import com.chainsys.finalproject.ngo.LoginDetails;
import com.chainsys.finalproject.ngo.Manager;
import com.chainsys.finalproject.service.NgoService;
import com.chainsys.finalproject.service.StaffService;
import com.chainsys.finalproject.validation.Validation;

@Controller
public class StaffController {
	Ngo projectDao = new Ngo();

	NgoService ngoService = new NgoService();

	StaffService staffService = new StaffService();

	LoginDetails login = new LoginDetails();

	// civilian register by staff controller

	@PostMapping("/CivilianRegister")
	public String civilianRegister(@RequestParam("donorName") String consumerName,
			@RequestParam("phoneNumber") Long phoneNumber, @RequestParam("aadharNumber") Long aadharNumber,
			@RequestParam("zone") String zoneId, @RequestParam("address") String address,
			@RequestParam("accountNumber") Long accountNumber, HttpSession session) {
		Consumer consumer = new Consumer();
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
				|| Boolean.FALSE.equals(validate.aadharNo(aadharNumber, session))
				|| Boolean.FALSE.equals(validate.phoneNoLength(phoneNumber, session))
				|| Boolean.FALSE.equals(validate.nameCheck(consumerName, session))
				|| Boolean.FALSE.equals(projectDao.aadharNumberCheckCivilian(aadharNumber, session))
				|| Boolean.FALSE.equals(projectDao.accountNumberCheck(accountNumber, session))
				|| Boolean.FALSE.equals(projectDao.phoneNumberCheckCivilian(phoneNumber, session))) {

			return "PopupRegisterStatus";
		}

		consumer.setConsumerName(consumerName);
		consumer.setConsumerPhoneNo(phoneNumber);
		consumer.setConsumerAadharNo(aadharNumber);
		consumer.setConsumerZoneId(zoneId);
		consumer.setConsumerAddress(address);
		consumer.setConsumerAccountNo(accountNumber);

		ngoService.civilianRegisterService(consumer, session);

		return "ApplyDonation";

	}

	@PostMapping("/ApplyDonation")
	public String applyDonation(@RequestParam("checkBox") String stockId, @RequestParam("quantity") Integer quanity,
			@RequestParam("amount") Float amount, @RequestParam("description") String description,
			HttpSession session) {
		DonationStatus applyDonation = new DonationStatus();
		applyDonation.setStockId(stockId);
		applyDonation.setQuantity(quanity);
		applyDonation.setFundAmount(amount);
		applyDonation.setDescription(description);
		staffService.applyDonationService(applyDonation, session);

		return "PopupDonationApplied";

	}

	@PostMapping("/AddStock")
	public String addStock(@RequestParam("stockName") String stockName, @RequestParam("quantity") Integer quanity,
			HttpSession session) {
		DonationStatus applyDonation = new DonationStatus();

		applyDonation.setQuantity(quanity);
		applyDonation.setDescription(stockName);

		staffService.addStockService(applyDonation, session);

		return "PopupStockAdded";

	}

}
