package com.chainsys.finalproject.dao;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.chainsys.finalproject.connection.ConnectionUtil;
import com.chainsys.finalproject.mapper.CheckExitingAadharNoMapper;
import com.chainsys.finalproject.mapper.CheckExitingAccountNoMapper;
import com.chainsys.finalproject.mapper.CheckExitingMailIdMapper;
import com.chainsys.finalproject.mapper.CheckExitingPhoneNoMapper;
import com.chainsys.finalproject.mapper.ConsumerMapper;
import com.chainsys.finalproject.mapper.DistributorMapper;
import com.chainsys.finalproject.mapper.DonationHistoryMapper;
import com.chainsys.finalproject.mapper.DonationInfoByDonationId;
import com.chainsys.finalproject.mapper.DonationStatusMapper;
import com.chainsys.finalproject.mapper.DonationYearMapper;
import com.chainsys.finalproject.mapper.DonorMapper;
import com.chainsys.finalproject.mapper.FundMapper;
import com.chainsys.finalproject.mapper.ManagerIdMapper;
import com.chainsys.finalproject.mapper.ManagerMapper;
import com.chainsys.finalproject.mapper.PasswordMapper;
import com.chainsys.finalproject.mapper.StockDetailsMapper;
import com.chainsys.finalproject.mapper.TransactionMapper;
import com.chainsys.finalproject.mapper.WarehouseMapper;
import com.chainsys.finalproject.mapper.ZoneIdMapper;
import com.chainsys.finalproject.ngo.Consumer;
import com.chainsys.finalproject.ngo.Distributor;
import com.chainsys.finalproject.ngo.DonationHistory;
import com.chainsys.finalproject.ngo.DonationStatus;
import com.chainsys.finalproject.ngo.Donor;
import com.chainsys.finalproject.ngo.Fund;
import com.chainsys.finalproject.ngo.LoginDetails;
import com.chainsys.finalproject.ngo.Manager;
import com.chainsys.finalproject.ngo.Password;
import com.chainsys.finalproject.ngo.StockDetails;
import com.chainsys.finalproject.ngo.Transaction;
import com.chainsys.finalproject.ngo.Warehouse;
import com.chainsys.finalproject.ngo.ZoneId;
import com.chainsys.finalproject.ngointerface.NgoInterface;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

public class Ngo implements NgoInterface {

	JdbcTemplate jdbc = ConnectionUtil.getJdbcTemplate();

	// get service details
	public void getServiceDetails(HttpSession session, Model model) {
		// get total fund amount from fund table
		String getFundBalanceQuery = "select balance from account where account_no=1227101051526";
		Float fundBalance = jdbc.queryForObject(getFundBalanceQuery, Float.class);

		// get total donation amount from donation history table
		String getDonationAmountQuery = "select sum(donation_expenses) from donation_history";
		Float donationAmount = jdbc.queryForObject(getDonationAmountQuery, Float.class);
		Float donationAmountServiceView = donationAmount;

		// get count from distributor
		String getStaffCountQuery = "select count(staff_name) from distributor";
		Integer staffCount = jdbc.queryForObject(getStaffCountQuery, Integer.class);

		// get count from management table
		String getManagerCountQuery = "select count(manager_name) from management";
		Integer managerCount = jdbc.queryForObject(getManagerCountQuery, Integer.class);

		// get count from donator table
		String getDonatorCountQuery = "select count(donor_name) from donator";
		Integer donatorCount = jdbc.queryForObject(getDonatorCountQuery, Integer.class);
		Integer donatorCountServiceView = donatorCount;

		// get civilians count from donation history table zone wise
		String getCiviliansCountQuery = "select sum(no_of_civilians) from donation_history";
		Integer civiliansCount = jdbc.queryForObject(getCiviliansCountQuery, Integer.class);
		Integer consumerCountServiceView = civiliansCount;

		Integer totalStaffCount = managerCount + staffCount;

		session.setAttribute("staffCountAdminView", staffCount);
		session.setAttribute("managerCountAdminView", managerCount);
		session.setAttribute("donatorCountAdminView", donatorCount);
		session.setAttribute("fundBalance", fundBalance);
		session.setAttribute("donationAmount", donationAmount);
		session.setAttribute("civiliansCount", civiliansCount);

		model.addAttribute("donationAmountServiceView", donationAmountServiceView);
		model.addAttribute("staffCountServiceView", totalStaffCount);
		model.addAttribute("donatorCountServiceView", donatorCountServiceView);
		model.addAttribute("consumerCountServiceView", consumerCountServiceView);

	}

	public Boolean adminLogCheck(HttpSession session, LoginDetails login, Model model) {
		String userId = login.getUserId();
		String password = login.getPassword();

		String loginQuery = "SELECT password,admin_name FROM admin where admin_id=?";
		List<Password> adminPassword = jdbc.query(loginQuery, new PasswordMapper(), userId);

		for (Password userPassword : adminPassword) {

			String pass = userPassword.getPass();
			if (password.equals(pass)) {

				String adminName = userPassword.getName();

				// get service details
				getServiceDetails(session, model);

				// get stock details from stock table
				stockDetails(session);

				// get warehouse details from stock table
				warehouseDetails(session);

				// get donation details from donation table
				getDonationDetailsAdminView(session);

				// get fund details from fund table
				fundDetailsAdminView(session);

				// get donation history from donation history table
				getDonationHistory(session);

				// get consumer list from consumer table
				consumerList(session);

				// get transaction list from transaction table
				transactionDetails(session);

				// get volunteers list from donator table
				volunteersDetails(session);

				session.setAttribute("adminName", adminName);

				return true;

			} else {

				return false;
			}

		}

		return false;

	}

	public Boolean managerLogCheck(HttpSession session, LoginDetails login) {
		String userId = login.getUserId();
		String password = login.getPassword();
		String zoneId = null;

		String loginQuery1 = "SELECT  password, manager_name FROM management where concat(prefix,m_id) =?";
		List<Password> managerPassword = jdbc.query(loginQuery1, new PasswordMapper(), userId);

		for (Password userPassword1 : managerPassword) {

			String pass = userPassword1.getPass();
			if (password.equals(pass)) {

				String managerName = userPassword1.getName();

				String managerZoneIdquery = "select zone_id from management where concat(prefix,m_id)=?";
				List<ZoneId> zoneIdList = jdbc.query(managerZoneIdquery, new ZoneIdMapper(), userId);

				for (ZoneId getZoneId : zoneIdList) {
					zoneId = getZoneId.getLocationId();
					session.setAttribute("getManagerZoneId", zoneId); // set zoneId to session

				}

				// get count from donator table
				String getDonatorCountQuery = "select count(donor_name) from donator where zone_id=?";
				Integer donatorCount = jdbc.queryForObject(getDonatorCountQuery, Integer.class, zoneId);

				// get donation expenses from donation history table zone wise
				String getDonationExpensesZoneQuery = "select donation_expenses from donation_history where zone_id=?";
				Float donationExpenses = jdbc.queryForObject(getDonationExpensesZoneQuery, Float.class, zoneId);

				// get civilians count from donation history table zone wise
				String getCiviliansCountQuery = "select no_of_civilians from donation_history where zone_id=?";
				Integer civiliansCount = jdbc.queryForObject(getCiviliansCountQuery, Integer.class, zoneId);

				// get count from distributor
				String getStaffCountZoneQuery = "select count(staff_name) from distributor where zone_id=?";
				Integer staffZoneCount = jdbc.queryForObject(getStaffCountZoneQuery, Integer.class, zoneId);

				// get consumer list zone wise
				consumerListZoneWise(zoneId, session);

				// get donation details zone wise from donation table
				getDonationDetailsZoneWise(zoneId, session);

				// get donor details from donor table zone wise
				volunteersDetailsZoneWise(zoneId, session);

				// get stock details from stock table by zone wise
				stockDetailsZoneWise(zoneId, session);

				// get distributor details from distributor table by zone wise
				distributorDetailsZoneWise(zoneId, session);

				session.setAttribute("managerId", userId);
				session.setAttribute("managerName", managerName); // set userName to session
				session.setAttribute("donationExpenses", donationExpenses); // set donation expenses to session
				session.setAttribute("civiliansCountManagerView", civiliansCount); // set civilians count to session
				session.setAttribute("donatorCountManagerView", donatorCount);
				session.setAttribute("staffZoneCount", staffZoneCount);
				return true;

			} else {

				return false;
			}

		}

		return false;

	}

	public Boolean staffLogCheck(HttpSession session, LoginDetails login) {
		String userId = login.getUserId();
		String password = login.getPassword();
		String staffZoneId = null;

		String loginQuery1 = "SELECT  password, staff_name  FROM distributor where CONCAT(prefix,s_id) =? ";
		List<Password> staffPassword = jdbc.query(loginQuery1, new PasswordMapper(), userId);

		for (Password userPassword2 : staffPassword) {

			String pass = userPassword2.getPass();
			if (password.equals(pass)) {

				String staffName = userPassword2.getName();

				String staffZoneIdquery = "select zone_id from distributor where concat(prefix,s_id)=?";
				List<ZoneId> zoneIdList = jdbc.query(staffZoneIdquery, new ZoneIdMapper(), userId);

				for (ZoneId getZoneId : zoneIdList) {
					staffZoneId = getZoneId.getLocationId();
					session.setAttribute("getManagerZoneId", staffZoneId); // set zoneId to session
					session.setAttribute("staffId", userId); // set staff to session

				}

				// get count from donator table
				String getDonatorCountQuery = "select count(donor_name) from donator where zone_id=?";
				Integer donatorCount = jdbc.queryForObject(getDonatorCountQuery, Integer.class, staffZoneId);

				// get civilians count from donation history table zone wise
				String getCiviliansCountQuery = "select no_of_civilians from donation_history where zone_id=?";
				Integer civiliansCount = jdbc.queryForObject(getCiviliansCountQuery, Integer.class, staffZoneId);

				// get donation details zone wise from donation table
				getDonationDetailsZoneWise(staffZoneId, session);

				// get stock details from stock table by zone wise
				stockDetailsZoneWise(staffZoneId, session);

				// get consumer list zone wise
				consumerListZoneWise(staffZoneId, session);

				// get donor details from donor table zone wise
				volunteersDetailsZoneWise(staffZoneId, session);

				session.setAttribute("civiliansCount", civiliansCount); // set civilians count to session
				session.setAttribute("donatorCount", donatorCount);
				session.setAttribute("staffName", staffName);
				session.setAttribute("staffZoneId", staffZoneId);

				return true;

			} else {

				return false;
			}

		}

		return false;

	}

	// insert account details into account table
	public void accountRegister(Long accountNo, String holderName) {
		// insert account number in account table before register
		String addAccount = "INSERT INTO account (account_no, a_holder_name, balance) VALUES (?, ?, 299999)";
		Object[] newAccount = { accountNo, holderName };
		jdbc.update(addAccount, newAccount);
	}

	// Register manager
	public void managerRegister(Manager manager, HttpSession session) {

		String managerName = manager.getManagerName();
		Long managerAccountNo = manager.getManagerAccountNo();
		// insert account number in account table before register
		accountRegister(managerAccountNo, managerName);

		// insert manager details into management table
		String registerManager = "INSERT INTO management(manager_name, phone_no, aadhar_no,  mail_id,address,password, "
				+ "zone_id, account_no) VALUES(?,?,?,?,?,?,?,?)";
		Object[] managerDetails = { manager.getManagerName(), manager.getManagerPhoneNo(), manager.getManagerAadharNo(),
				manager.getManagerAadharNo(), manager.getManagerAddress(), manager.getManagerPassword(),
				manager.getManagerZoneId(), manager.getManagerAccountNo() };
		jdbc.update(registerManager, managerDetails);

		String getManagerId = "select concat(prefix,m_id) as manager_id from management where phone_no=?";
		List<Manager> managerIdList = jdbc.query(getManagerId, new ManagerIdMapper(), manager.getManagerPhoneNo());
		for (Manager managerId : managerIdList) {
			session.setAttribute("manager_id", managerId.getManagerId());

		}

	}

	// Distributor manager
	public void distributorRegister(Distributor distributor, HttpSession session) {

		String staffName = distributor.getDistributorName();
		Long staffAccountNo = distributor.getAccountNo();

		// insert account number in account table before staff register
		accountRegister(staffAccountNo, staffName);

		// insert distributor details into management table
		String registerDistributor = "INSERT INTO distributor(staff_name, phone_no, aadhar_no, mail_id, address,"
				+ " password, zone_id, account_no) VALUES(?,?,?,?,?,?,?,?)";
		Object[] distributorDetails = { distributor.getDistributorName(), distributor.getPhoneNo(),
				distributor.getAadharNo(), distributor.getMailId(), distributor.getAddress(), distributor.getPassword(),
				distributor.getZoneId(), distributor.getAccountNo() };
		jdbc.update(registerDistributor, distributorDetails);

		String getDistributorId = "select concat(prefix,s_id) as distributor_id from distributor where phone_no=?";
		String distributorId = jdbc.queryForObject(getDistributorId, String.class, distributor.getPhoneNo());

		session.setAttribute("distributorId", distributorId);

	}

	// Donor manager
	public void donorRegister(Donor donor, HttpSession session) {

		String donorName = donor.getVolunteerName();
		Long donorAccountNo = donor.getVolunteerAccountNo();

		// insert account number in account table before donor register
		accountRegister(donorAccountNo, donorName);

		// insert donor details into donor table
		String registerDonor = "INSERT INTO donator(donor_name, phone_no, aadhar_no, mail_id, address,"
				+ " password, zone_id, account_no) VALUES(?,?,?,?,?,?,?,?)";
		Object[] donorDetails = { donor.getVolunteerName(), donor.getVolunteerPhoneNo(), donor.getVolunteerAadharNo(),
				donor.getVolunteerMailId(), donor.getVolunteerAddress(), donor.getVolunteerPassword(),
				donor.getVolunteerZoneId(), donor.getVolunteerAccountNo() };
		jdbc.update(registerDonor, donorDetails);

		String getDonorId = "select concat(prefix,d_id) as donor_id from donator where phone_no=?";
		String donorId = jdbc.queryForObject(getDonorId, String.class, donor.getVolunteerPhoneNo());

		session.setAttribute("donorId", donorId);

	}

	// Distributor manager
	public void civilianRegister(Consumer consumer, HttpSession session) {
		String consumerName = consumer.getConsumerName();
		Long consumerAccountNo = consumer.getConsumerAccountNo();
		// insert account number in account table before consumer register
		accountRegister(consumerAccountNo, consumerName);

		// insert consumer details into consumer table
		String registerConsumer = "INSERT INTO consumer(consumer_name,phone_no,aadhar_no,address,zone_id,"
				+ "account_no) VALUES(?,?,?,?,?,?)";
		Object[] consumerDetails = { consumer.getConsumerName(), consumer.getConsumerPhoneNo(),
				consumer.getConsumerAadharNo(), consumer.getConsumerAddress(), consumer.getConsumerZoneId(),
				consumer.getConsumerAccountNo() };
		jdbc.update(registerConsumer, consumerDetails);

		String getConsumerId = "select concat(prefix,c_id) as consumer_id from consumer where phone_no=?";
		String consumerId = jdbc.queryForObject(getConsumerId, String.class, consumer.getConsumerPhoneNo());

		session.setAttribute("consumerId", consumerId);

	}

	// check mail id whether already present or not in the records
	public Boolean mailCheckDonor(String mailId, HttpSession session) {

		String query = "SELECT MAIL_ID FROM donator where mail_id=?";
		List<Manager> mailIdList = jdbc.query(query, new CheckExitingMailIdMapper(), mailId);

		for (Manager checkMailId : mailIdList) {

			String mail = checkMailId.getManagerMailId();
			if (mail.equals(mailId)) {

				String errorMessage = "given mail Id is already exits!";

				session.setAttribute("errorMessage9", errorMessage);
				return false;

			}
		}
		return true;

	}

	// check mail id whether already present or not in the records
	public Boolean phoneNumberCheckDonor(Long phoneNo, HttpSession session) {

		String query = "SELECT PHONE_NO FROM donator where PHONE_NO=?";
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
	public Boolean phoneNumberCheckCivilian(Long phoneNo, HttpSession session) {

		String query = "SELECT PHONE_NO FROM consumer where PHONE_NO=?";
		List<Manager> phoneNoList = jdbc.query(query, new CheckExitingPhoneNoMapper(), phoneNo);

		for (Manager checkPhoneNo : phoneNoList) {

			Long phoneNumber = checkPhoneNo.getManagerPhoneNo();
			if (phoneNumber.equals(phoneNo)) {

				String errorMessage = "Given Phone number is already exitsr!";

				session.setAttribute("errorMessage10", errorMessage);
				return false;

			}
		}
		return true;

	}

	// check aadhar Number whether already present or not in the records
	public Boolean aadharNumberCheckCivilian(Long aadharNo, HttpSession session) {

		String query = "SELECT AADHAR_NO FROM consumer where AADHAR_NO=?";
		List<Manager> aadharNoList = jdbc.query(query, new CheckExitingAadharNoMapper(), aadharNo);

		for (Manager checkAadharNo : aadharNoList) {

			Long aadharNumber = checkAadharNo.getManagerAadharNo();
			if (aadharNumber.equals(aadharNo)) {

				String errorMessage = "Try with different Aadhar numbergiven Aadhar number is already exits!";

				session.setAttribute("errorMessage11", errorMessage);
				return false;

			}
		}
		return true;
	}

	// check aadhar Number whether already present or not in the records
	public Boolean aadharNumberCheckDonor(Long aadharNo, HttpSession session) {

		String query = "SELECT AADHAR_NO FROM donator where AADHAR_NO=?";
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
	public Boolean accountNumberCheck(Long accountNo, HttpSession session) {

		String query = "SELECT account_no FROM account where ACCOUNT_NO=?";
		List<Manager> accountNoList = jdbc.query(query, new CheckExitingAccountNoMapper(), accountNo);

		for (Manager checkAccountNo : accountNoList) {

			Long accountNumber = checkAccountNo.getManagerAccountNo();
			if (accountNumber.equals(accountNo)) {
				String errorMessage = "given Account number is already exits try with different Account number!";
				session.setAttribute("errorMessage12", errorMessage);
				return false;

			}
		}
		return true;

	}

	// get consumer details
	public void consumerList(HttpSession session) {

		String getConsumerListQuery = "SELECT CONCAT(prefix,c_id) AS consumer_id, consumer_name,phone_no,"
				+ "aadhar_no,address,zone_id,account_no FROM consumer";
		List<Consumer> consumerList = jdbc.query(getConsumerListQuery, new ConsumerMapper());

		session.setAttribute("consumerList", consumerList);

	}

	// get consumer details zone wise
	public void consumerListZoneWise(String zoneId, HttpSession session) {

		String getConsumerListZoneWiseQuery = "SELECT CONCAT(prefix,c_id) AS consumer_id, consumer_name,phone_no,"
				+ "aadhar_no,address,zone_id,account_no FROM consumer where zone_id=?";
		List<Consumer> consumerListZoneWise = jdbc.query(getConsumerListZoneWiseQuery, new ConsumerMapper(), zoneId);

		session.setAttribute("consumerListZoneWise", consumerListZoneWise);

	}

	// get transaction details
	public void transactionDetails(HttpSession session) {

		String getTransactionQuery = "SELECT TRANSACTION_NO,transaction_date, account_no, transaction_type,"
				+ " amount, description FROM transaction";
		List<Transaction> transactionList = jdbc.query(getTransactionQuery, new TransactionMapper());

		session.setAttribute("transactionList", transactionList);

	}

	// get volunteers details
	public void volunteersDetails(HttpSession session) {

		String getVolunteersQuery = "SELECT concat (prefix,d_id) as donor_id,donor_name,phone_no,aadhar_no,"
				+ "mail_id,address,zone_id,account_no FROM donator";
		List<Donor> volunteersList = jdbc.query(getVolunteersQuery, new DonorMapper());

		session.setAttribute("volunteersList", volunteersList);

	}

	// get volunteers details zone wise
	public void volunteersDetailsZoneWise(String zoneId, HttpSession session) {

		String getVolunteersZoneWiseQuery = "SELECT concat (prefix,d_id) as donor_id,donor_name,phone_no,aadhar_no,"
				+ "mail_id,address,zone_id,account_no FROM donator where zone_id=?";
		List<Donor> volunteersListZoneWise = jdbc.query(getVolunteersZoneWiseQuery, new DonorMapper(), zoneId);

		session.setAttribute("volunteersListZoneWise", volunteersListZoneWise);

	}

	// get manager details
	public void managerDetails(HttpSession session, Model model) throws JsonProcessingException {

		String getManagerQuery = "SELECT concat(prefix,m_id) as manager_id,manager_name, phone_no, aadhar_no,"
				+ "MAIL_ID, address, zone_id, account_no FROM management";
		List<Manager> managerList = jdbc.query(getManagerQuery, new ManagerMapper());

		session.setAttribute("managerList", managerList);
		// for slick grid to add list in model through hash map
		List<Map<String, Object>> managerInfo = new ArrayList<>();
		for (Manager manager : managerList) {
			Map<String, Object> managerMap = new HashMap<>();
			managerMap.put("managerCode", manager.getManagerId());
			managerMap.put("managerName", manager.getManagerName());
			managerMap.put("managerPhoneNo", manager.getManagerPhoneNo());
			managerMap.put("managerAadhar", manager.getManagerAadharNo());
			managerMap.put("managerMailId", manager.getManagerMailId());
			managerMap.put("managerAddress", manager.getManagerAddress());
			managerMap.put("managerZone", manager.getManagerZoneId());
			managerMap.put("managerAccount", manager.getManagerAccountNo());

			managerInfo.add(managerMap);
		}

		model.addAttribute("managerInfo", managerInfo);

	}

	// get distributor details
	public void distributorDetails(HttpSession session) {

		String getDistributorQuery = "SELECT CONCAT(prefix,s_id) as staff_id, staff_name, phone_no, aadhar_no,"
				+ " mail_id, address, zone_id, account_no FROM distributor ";
		List<Distributor> distributorList = jdbc.query(getDistributorQuery, new DistributorMapper());

		session.setAttribute("distributorList", distributorList);

	}

	// get distributor details zone wise
	public void distributorDetailsZoneWise(String zoneId, HttpSession session) {

		String getDistributorZoneWiseQuery = "SELECT CONCAT(prefix,s_id) as staff_id, staff_name, phone_no, aadhar_no,"
				+ " mail_id, address, zone_id, account_no FROM distributor where zone_id=?";
		List<Distributor> distributorListZoneWise = jdbc.query(getDistributorZoneWiseQuery, new DistributorMapper(),
				zoneId);

		session.setAttribute("distributorListZoneWise", distributorListZoneWise);

	}

	// get donation details for admin view
	public void getDonationDetailsAdminView(HttpSession session) {
		String getDonationDetailsAdminViewQuery = "SELECT CONCAT(prefix,h_id) as donation_id, staff_id,consumer_id,stock_id,"
				+ "quantity,fund_amount,description,donation_date,approved_by,approval_status,zone_id FROM donation";

		List<DonationStatus> donationDetailsAdminViewList = jdbc.query(getDonationDetailsAdminViewQuery,
				new DonationStatusMapper());
		session.setAttribute("donationDetailsAdminView", donationDetailsAdminViewList);

	}

	// get donation details zone wise for manager view
	public void getDonationDetailsZoneWise(String zoneId, HttpSession session) {
		String getDonationDetailsZoneWiseQuery = "SELECT CONCAT(prefix,h_id) as donation_id, staff_id,consumer_id,stock_id,"
				+ "quantity,fund_amount,description,donation_date,approved_by,approval_status,zone_id FROM donation where zone_id=?";

		List<DonationStatus> donationDetailsZoneWiseList = jdbc.query(getDonationDetailsZoneWiseQuery,
				new DonationStatusMapper(), zoneId);
		session.setAttribute("donationDetailsZoneWiseList", donationDetailsZoneWiseList);

	}

	// get fund details for admin view
	public void fundDetailsAdminView(HttpSession session) {
		String fundDetailsQuery = "SELECT CONCAT(prefix,f_id) AS fund_id, fund_amount, donor_account_no, "
				+ "donation_date FROM fund";
		List<Fund> fundDetailsList = jdbc.query(fundDetailsQuery, new FundMapper());
		session.setAttribute("fundDetails", fundDetailsList);

	}

	// update approval in donation status table
	public void approveDonationStatus(String donationId, HttpSession session) {
		String seperateDonationId = null;
		String seperateStockId = null;
		String userId = (String) session.getAttribute("managerId");
		String[] id = donationId.split("[,]", 0); // split donation Id from multiple checkbox
		for (String myId : id) {
			seperateDonationId = myId;

			// update donation details by manager approval by donation id
			String approval = "UPDATE donation SET approved_by=? , approval_status='Approved', donation_date=LOCALTIMESTAMP "
					+ "where CONCAT(prefix,h_id)=? ";
			Object[] approveDonation = { userId, seperateDonationId };
			jdbc.update(approval, approveDonation);

			// get donation details to update stock list and transaction details
			String getDonationInfoByDonationId = "SELECT stock_id,quantity,fund_amount,description,zone_id FROM donation"
					+ " where CONCAT(prefix,h_id)=?";
			List<DonationStatus> donationInfoByIdList = jdbc.query(getDonationInfoByDonationId,
					new DonationInfoByDonationId(), seperateDonationId);

			for (DonationStatus donationStatusInfo : donationInfoByIdList) // donation list by donation id
			{
				String stockId = donationStatusInfo.getStockId();
				Integer quatity = donationStatusInfo.getQuantity();
				Float fundAmount = donationStatusInfo.getFundAmount();
				String description = donationStatusInfo.getDescription();
				String zoneId = donationStatusInfo.getZoneId();

				// get warehouse id by zone id to update stock list in particular warehouse
				String getWarehouseId = "SELECT CONCAT(prefix,w_id)as warehouse_id FROM warehouse where zone_id=?";
				String warehouseId = jdbc.queryForObject(getWarehouseId, String.class, zoneId);

				String[] stockIdObject = stockId.split("[,. ']+");
				for (String mystockIdObject : stockIdObject) // stock id
				{
					seperateStockId = mystockIdObject;

					// update stock list by stock id and warehouse id
					String updateStock = "update stock set quantity=quantity-? where warehouse_id=? and CONCAT (prefix,s_id)=?";
					Object[] updateStockDetails = { quatity, warehouseId, seperateStockId };
					jdbc.update(updateStock, updateStockDetails);
				}

				// update account balance by donation amount
				String updateAccountBalance = "UPDATE  account set balance=balance-? WHERE account_no=1227101051526";
				jdbc.update(updateAccountBalance, fundAmount);

				// get consumer Id by donation Id
				String getConsumerId = "select consumer_id from donation where CONCAT(prefix,h_id)=?";
				String consumerId = jdbc.queryForObject(getConsumerId, String.class, seperateDonationId);

				// get account number by consumer ID
				String getAccountNumber = "select account_no from consumer where CONCAT(prefix,c_id)=?";
				String accountNumber = jdbc.queryForObject(getAccountNumber, String.class, consumerId);

				// insert transaction details in transaction table
				String insertTransactionQuery = "INSERT INTO transaction (transaction_date, account_no, transaction_type, "
						+ "amount, description) VALUES (LOCALTIMESTAMP, ?, ?, ?, ?)";
				String transactionType = "Debited";
				Object[] transactionDetials = { accountNumber, transactionType, fundAmount, description };
				jdbc.update(insertTransactionQuery, transactionDetials);

			}

		}

	}

	// update reject in donation status table
	public void rejectDonationStatus(String donationId, HttpSession session) {
		String seperateDonationId = null;
		String userId = (String) session.getAttribute("userId");
		String[] id = donationId.split("[,]", 0);
		for (String myId : id) {
			seperateDonationId = myId;

			String approval = "UPDATE donation SET approved_by=? , approval_status='Rejected' "
					+ "where CONCAT(prefix,h_id)=? ";
			Object[] approveDonation = { userId, seperateDonationId };
			jdbc.update(approval, approveDonation);

		}

	}

	// get stock details from warehouse table by zoneId
	public void stockDetailsZoneWise(String zoneId, HttpSession session) {

		// get warehouse id by zone id to update stock list in particular warehouse
		String getWarehouseId = "SELECT CONCAT(prefix,w_id)as warehouse_id FROM warehouse where zone_id=?";
		String warehouseId = jdbc.queryForObject(getWarehouseId, String.class, zoneId);

		String stockDetails = "SELECT CONCAT (prefix,s_id) as stock_id, stock_name, quantity,staff_id,"
				+ "warehouse_id FROM stock where warehouse_id=?"; // query to get stock details

		List<StockDetails> stockDetailsList = jdbc.query(stockDetails, new StockDetailsMapper(), warehouseId);
		session.setAttribute("stockDetailsZoneWise", stockDetailsList);
		session.setAttribute("warehouseId", warehouseId);
	}

	// get stock details from stock table
	public void stockDetails(HttpSession session) {

		String stockDetails = "SELECT CONCAT (prefix,s_id) as stock_id, stock_name, quantity,staff_id,"
				+ "warehouse_id FROM stock"; // query to get stock details

		List<StockDetails> stockDetailsList = jdbc.query(stockDetails, new StockDetailsMapper());
		session.setAttribute("stockDetails", stockDetailsList);

	}

	// get warehouse details from warehouse table
	public void warehouseDetails(HttpSession session) {

		String warehouseDetails = "select CONCAT(prefix,w_id)as warehouse_id,location, zone_id from warehouse"; // query
																												// to
																												// get
																												// stock
																												// details

		List<Warehouse> warehouseDetailsList = jdbc.query(warehouseDetails, new WarehouseMapper());
		session.setAttribute("warehouseDetails", warehouseDetailsList);

	}

	// update donation history details by donation details
	public void updateDonationHistory() {

		// get common zone Id from donation
		String zoneIdFromDonationQuery = "select distinct zone_id from donation where approval_status='Approved'";
		List<ZoneId> zoneIdFromDonationList = jdbc.query(zoneIdFromDonationQuery, new ZoneIdMapper());

		String zoneIdFromDonationQueryaa = "select distinct zone_id from donation where approval_status='Approved'";
		List<Map<String, Object>> zoneIdFromDonationListaa = jdbc.queryForList(zoneIdFromDonationQueryaa);

		String yearFromDonationHistoryQuery23aa = "select distinct zone_id from donation_history";
		List<Map<String, Object>> yearFromDonationHistoryList23aa = jdbc.queryForList(yearFromDonationHistoryQuery23aa);

		for (ZoneId zoneId : zoneIdFromDonationList) {

			String eachZoneId = zoneId.getLocationId(); // get each zone id

			// get total donation expenses by zone Id
			String donationAmountQuery = "select sum(fund_amount) from donation where zone_id=? and approval_status='Approved'";
			Float totalDonationAmount = jdbc.queryForObject(donationAmountQuery, Float.class, eachZoneId);

			// get total civilians from donation table by zone Id
			String totalCiviliansQuery = "select count(consumer_id) as total_people from donation where zone_id=? and approval_status='Approved'";
			Integer totalCivilians = jdbc.queryForObject(totalCiviliansQuery, Integer.class, eachZoneId);

			if (zoneIdFromDonationListaa.containsAll(yearFromDonationHistoryList23aa)
					&& yearFromDonationHistoryList23aa.containsAll(zoneIdFromDonationListaa)) {

				// update donation history table by zone Id when donation year are same
				String updateDonationHistoryQuery2 = "update donation_history set "
						+ "no_of_civilians=? , donation_expenses=? " + "where zone_id=?";
				Object[] updateDonationHistoryValues2 = { totalCivilians, totalDonationAmount, eachZoneId };
				jdbc.update(updateDonationHistoryQuery2, updateDonationHistoryValues2);
			} else {

				// insert donation history details by donation details if zone Id not same
				String insertDonationHistoryQuery2 = "insert into donation_history (zone_id,donation_year,"
						+ "no_of_civilians,donation_cause,donation_expenses) values (?,localtimestamp,?,'Welfare Donation',?)";
				Object[] insertDonationHistoryValues2 = { eachZoneId, totalCivilians, totalDonationAmount };
				jdbc.update(insertDonationHistoryQuery2, insertDonationHistoryValues2);
			}

		}

	}

	// insert fund amount to fund table and update transaction table
	public void donation(Float fund) throws NoSuchAlgorithmException {
		Random random = SecureRandom.getInstanceStrong();

		// generate 13 digits account number

		long accountNumber = (long) (random.nextDouble() * 9999999999999L) + 1111111111111L;

		// insert fund details into fund table
		String donationQuery = "INSERT INTO fund (fund_amount,donor_account_no,donation_date) VALUES (?,?,LOCALTIMESTAMP)";
		Object[] fundDetails = { fund, accountNumber };
		jdbc.update(donationQuery, fundDetails);

		// get admin balance from account using getAdminBalance method

		String balanceQuery = "SELECT balance FROM account WHERE account_no=1227101051526";
		Float availableBalance = jdbc.queryForObject(balanceQuery, Float.class);

		Float currentBalance = availableBalance + fund; // adding fund amount to balance

		// update admin balance
		String updateAdminBalance = "UPDATE account SET balance=? WHERE account_no=1227101051526";
		jdbc.update(updateAdminBalance, currentBalance);

		// update TRANSACTION TABLE
		String updateTransaction = "INSERT INTO transaction (transaction_date, account_no, transaction_type, amount, description) VALUES (LOCALTIMESTAMP, ?,?,?,?)";
		String transactionType = "Credited";
		String description = "Fund";
		Object[] transactionDetails = { accountNumber, transactionType, fund, description };
		jdbc.update(updateTransaction, transactionDetails);

	}

	// get updated donation history details
	public void getDonationHistory(HttpSession session) {
		updateDonationHistory();
		String donationHistoryListQuery = "select concat(prefix,h_id) as history_id,zone_id,extract(year from "
				+ "donation_year)as donation_year,no_of_civilians,donation_cause,donation_expenses from "
				+ "donation_history";
		List<DonationHistory> donationHistoryList = jdbc.query(donationHistoryListQuery, new DonationHistoryMapper());
		session.setAttribute("donationHistoryList", donationHistoryList);
	}

}
