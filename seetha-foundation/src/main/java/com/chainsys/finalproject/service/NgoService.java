package com.chainsys.finalproject.service;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.chainsys.finalproject.dao.Ngo;
import com.chainsys.finalproject.ngo.Consumer;
import com.chainsys.finalproject.ngo.Distributor;
import com.chainsys.finalproject.ngo.Donor;
import com.chainsys.finalproject.ngo.LoginDetails;
import com.chainsys.finalproject.ngo.Manager;
import com.fasterxml.jackson.core.JsonProcessingException;

@Service
public class NgoService {

	
	Ngo projectDao =new Ngo();

	// get service details
	public void getServiceDetailsService(HttpSession session, Model model) {
		projectDao.getServiceDetails(session, model);

	}

	// register manager into distributor table
	public void managerRegisterService(Manager manager, HttpSession session) {

		projectDao.managerRegister(manager, session); // register manager in data base

	}

	// register distributor into distributor table
	public void distributorRegisterService(Distributor distributor, HttpSession session) {

		projectDao.distributorRegister(distributor, session); // register distributor in data base

	}

	// register donor into donor table
	public void donorRegisterService(Donor donor, HttpSession session) {

		projectDao.donorRegister(donor, session); // register distributor in data base

	}

	// register distributor into distributor table
	public void civilianRegisterService(Consumer consumer, HttpSession session) {

		projectDao.civilianRegister(consumer, session); // register distributor in data base

	}

	// check credentials of admin
	public Boolean adminCheckService(LoginDetails login, HttpSession session, Model model) {

		return projectDao.adminLogCheck(session, login, model);

	}

	// check credentials of manager
	public Boolean managerCheckService(LoginDetails login, HttpSession session) {

		return projectDao.managerLogCheck(session, login);

	}

	// check credentials of staff
	public Boolean staffCheckService(LoginDetails login, HttpSession session) {

		return projectDao.staffLogCheck(session, login);

	}

	// get manager details
	public void managerDetailsService(HttpSession session, Model model) throws JsonProcessingException {

		projectDao.managerDetails(session, model);
	}

	// get distributor details
	public void distributorDetailsService(HttpSession session) {

		projectDao.distributorDetails(session);
	}

	// get donation history from donation history table
	public void donationHistoryService(HttpSession session) {

		projectDao.getDonationHistory(session);
	}

	public void donationService(Float foundAmount) throws NoSuchAlgorithmException {
		projectDao.donation(foundAmount);

	}

	public void approveDonationStatusService(String donationId, HttpSession session) {
		projectDao.approveDonationStatus(donationId, session);

	}

	public void rejectDonationStatusService(String donationId, HttpSession session) {
		projectDao.rejectDonationStatus(donationId, session);

	}

}
