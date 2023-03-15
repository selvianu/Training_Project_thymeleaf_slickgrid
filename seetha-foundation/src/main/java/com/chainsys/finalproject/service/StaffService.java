package com.chainsys.finalproject.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.finalproject.dao.DistributorDao;
import com.chainsys.finalproject.ngo.DonationStatus;

@Service
public class StaffService {

	DistributorDao staffDao = new DistributorDao();

	// apply donation into donation table
	public void applyDonationService(DonationStatus donation, HttpSession session) {

		staffDao.applyDonation(donation, session);
	}

	// get donation info zone wise
	public void getDonationInfoZonewiseService(String staffZoneId, HttpSession session) {
		staffDao.getDonationInfoZonewise(staffZoneId, session);
	}

	// add stock into stock table
	public void addStockService(DonationStatus donation, HttpSession session) {

		staffDao.addStock(donation, session);
	}
}
