package com.chainsys.finalproject.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.finalproject.dao.ManagerDao;
import com.chainsys.finalproject.ngo.ZoneId;

@Service
public class ManagerService {

	ZoneId zoneId = new ZoneId();

	ManagerDao managerDao = new ManagerDao();

	// get donation status for approve or reject
	public void donationStatusService(HttpSession session) {

		String staffZoneId = (String) session.getAttribute("getManagerZoneId");
		zoneId.setLocationId(staffZoneId);

		managerDao.getDonationSatus(zoneId, session);
	}
}
