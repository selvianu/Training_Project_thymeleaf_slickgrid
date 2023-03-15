<%@page import="com.chainsys.finalproject.ngo.Distributor"%>
<%@page import="com.chainsys.finalproject.ngo.Manager"%>
<%@page import="com.chainsys.finalproject.ngo.Donor"%>
<%@page import="com.chainsys.finalproject.ngo.Transaction"%>
<%@page import="com.chainsys.finalproject.ngo.Consumer"%>
<%@page import="com.chainsys.finalproject.ngo.DonationHistory"%>
<%@page import="com.chainsys.finalproject.ngo.Fund"%>
<%@page import="com.chainsys.finalproject.ngo.DonationStatus"%>
<%@page import="com.chainsys.finalproject.ngo.Warehouse"%>
<%@page import="java.util.List"%>
<%@page import="com.chainsys.finalproject.ngo.StockDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/AdminPageStyle.css">
<link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<script src="https://kit.fontawesome.com/df7f8b914d.js"
	crossorigin="anonymous"></script>
<script src="https://momentjs.com/downloads/moment.min.js"></script>

<script type="text/javascript">
	
	</script>
</head>
<body>
	<%
	/* String sessionName = (String) session.getAttribute("adminName"); // Get the session attribute value
	if (sessionName == null) { // Check if the session attribute is null
		response.sendRedirect("/JSP files/Login.jsp"); // Redirect to login page if null
	} */
	%>
	<%@ include file="/JSP files/HeaderAdmin.jsp"%>
	<%
	HttpSession session3 = request.getSession();
	Float fund = (float) session3.getAttribute("fundBalance");
	Integer staff = (Integer) session3.getAttribute("staffCountAdminView");
	Integer manager = (Integer) session3.getAttribute("managerCountAdminView");
	Integer donor = (Integer) session3.getAttribute("donatorCountAdminView");
	List<StockDetails> stock = (List<StockDetails>) session3.getAttribute("stockDetails");
	List<Warehouse> warehouse = (List<Warehouse>) session3.getAttribute("warehouseDetails");
	List<DonationStatus> donationStatus = (List<DonationStatus>) session3.getAttribute("donationDetailsAdminView");
	List<Fund> fundDetails = (List<Fund>) session3.getAttribute("fundDetails");
	List<DonationHistory> donationHistoryList = (List<DonationHistory>) session3.getAttribute("donationHistoryList");
	List<Consumer> consumerList = (List<Consumer>) session3.getAttribute("consumerList");
	List<Transaction> transactionList = (List<Transaction>) session3.getAttribute("transactionList");
	List<Donor> volunteersList = (List<Donor>) session3.getAttribute("volunteersList");
	%>


	<section class="section2">
		<div class="admin-background">
			<div class="dash-board">
				<div class="admin-feature">
					<div class="management-button">
						<button id="features" onclick="#">
							<span> Management </span>
						</button>
						<div class="management-drop-down">
							<button id="features" onclick="location.href='/ManagerDetails'">
								<span> Management Details </span>
							</button>
							<button id="features"
								onclick="location.href='/JSP files/ManagerRegister.jsp'">
								<span>Add Manager </span>
							</button>
							<button id="features"
								onclick="location.href='/DistributorDetails'">
								<span>Employee Details </span>
							</button>

						</div>
					</div>
					<button id="features" onclick="openFund()">
						<span>Fund </span>
					</button>
					<button id="features" onclick="openVolunteersTable()">
						<span>Volunteers Details</span>
					</button>

					<button id="features" onclick="openTransactionTable()">
						<span> Account Details </span>
					</button>

					<button id="features" onclick="openCivilianTable()">
						<span> Consumer Details </span>
					</button>
					<div class="donation-button">
						<button id="features" onclick="#">
							<span>Donation </span>
						</button>
						<div class="donation-drop-down">
							<button id="features" onclick="openDonationStatus()">
								<span>Donation Details</span>
							</button>
							<button id="features" onclick="openDonationHistory()">
								<span>Donation History </span>
							</button>
						</div>
					</div>
					<button id="features" onclick="openStock()">
						<span>Stock Details</span>
					</button>
					<button id="features" onclick="openWarehouse()">
						<span>Warehouse Details</span>
					</button>
				</div>
			</div>

			<!-- box for fund and staff list -->
			<div class="view-content">
				<div class="box-row">
					<a href="#" onclick="openTransactionTable()">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Bank Balance</h4>
								<span id="money-icon" class="fa-solid fa-coins"></span>
							</div>
							<h5 id="balance">
								Rs.<%=fund%></h5>
						</div>
					</a> <a href="#" onclick="location.href='/ManagerDetails'">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Managers</h4>
								<span id="manager-icon" class="fa-solid fa-user-group"></span>

							</div>
							<h5 id="balance"><%=manager%></h5>
						</div>
					</a> <a href="#" onclick="location.href='/DistributorDetails'">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Distributors</h4>
								<span id="staff-icon" class="fa-solid fa-user-group"></span>
							</div>
							<h5 id="balance"><%=staff%></h5>
						</div>
					</a> <a href="#" onclick="openVolunteersTable()">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Volunteers</h4>
								<span id="people-icon" class="fa-solid fa-people-group"></span>
							</div>
							<h5 id="balance"><%=donor%></h5>
						</div>
					</a>
				</div>
			</div>
			<!-- stock details table start  -->
			<div class="table-content">
				<div class="table-first-row">
					<div class="stock-table" id="stock-table-id">
						<input type="text" id="myInput" onkeyup="filterTable()"
							placeholder="Search for stock ...">
						<div id="stock-status-part">
							<table id="stock-table-content">
								<caption id="stock-caption">Stock Details</caption>
								<thead>
									<tr id="stock-table-head">
										<th class="cell100 column2">Name</th>
										<th class="cell100 column3">Quantity</th>
										<th class="cell100 column4">Staff Code</th>
										<th class="cell100 column5">Warehouse Code</th>
									</tr>
								</thead>

								<%
								for (StockDetails stockDetails : stock) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column2"><%=stockDetails.getStockName()%></td>
										<td class="cell100 column2"><%=stockDetails.getQuantity()%></td>
										<td class="cell100 column2"><%=stockDetails.getStaffId()%></td>
										<td class="cell100 column2"><%=stockDetails.getWareHouseId()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>

					</div>
				</div>
				<div class="warehouse-table" id="warehouse-table-id">
					<div class="table100 table1">
						<div class="table100-head">
							<table>
								<caption id="stock-caption">Warehouse Details</caption>
								<thead>
									<tr class="table-head ">
										<th class="cell100 column1">Location</th>
										<th class="cell100 column2">Warehouse Code</th>
										<th class="cell100 column3">Location Code</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll">
							<table>
								<caption></caption>
								<th></th>
								<%
								for (Warehouse warehouseList : warehouse) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column2"><%=warehouseList.getLocation()%></td>
										<td class="cell100 column2"><%=warehouseList.getWarehouseId()%></td>
										<td class="cell100 column2"><%=warehouseList.getZoneId()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!--  donation table start -->
				<div class="table-second-row">
					<div class="donation-status-table" id="donation-status-table">
						<input type="text" id="myInput1" onkeyup="filterTable1()"
							placeholder="Search for staff code...">
						<p style="display: none; color: red;" id="not-found">
							No similar field with "<span id="srch"></span>"
						</p>
						<div id="donation-status-part">

							<table id="tablexyz">
								<caption id="donation-status-caption">Donation Status</caption>
								<thead>
									<tr id="donation-table-head">


										<th class="cell100 column12">Staff Code</th>
										<th class="cell100 column13">Civilian Code</th>
										<th class="cell100 column14">Stock Code</th>
										<th class="cell100 column15">Quantity</th>
										<th class="cell100 column16">Fund</th>
										<th class="cell100 column17">Description</th>
										<th class="cell100 column18">Donation Date</th>
										<th class="cell100 column19">Approved By</th>
										<th class="cell100 column20">Status</th>
										<th class="cell100 column21">Location Code</th>

									</tr>
								</thead>

								<%
								for (DonationStatus donationList : donationStatus) {
								%>
								<tbody>
									<tr class="row100 body">

										<td class="cell100 column02"><%=donationList.getStaffId()%></td>
										<td class="cell100 column03"><%=donationList.getConsumerId()%></td>
										<td class="cell100 column04"><%=donationList.getStockId()%></td>
										<td class="cell100 column05"><%=donationList.getQuantity()%></td>
										<td class="cell100 column06"><%=donationList.getFundAmount()%></td>
										<td class="cell100 column07" id="description"><%=donationList.getDescription()%></td>
										<td class="cell100 column08" id="date"><%=donationList.getDonationDate()%></td>

										<td class="cell100 column09" id="approvedBy"><%=donationList.getApprovedBy()%></td>

										<td class="cell100 column010" id="status"><%=donationList.getApprovalStatus()%></td>
										<td class="cell100 column011" id="location-code"><%=donationList.getZoneId()%></td>

									</tr>

									<%
									}
									%>

								</tbody>
							</table>
						</div>
					</div>

				</div>



				<!--  donation table end -->
				<div id="fund-table">
					<div class="table100 table1" id="donation-status">
						<div class="table100-head">

							<table>
								<caption id="stock-caption">Fund Details</caption>
								<thead>
									<tr class="table-head ">


										<th class="cell100 column12">Fund Amount</th>
										<th class="cell100 column13">Donor Account No.</th>
										<th class="cell100 column14">Donation Date</th>


									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll" id="fund-status-body">
							<table>
								<caption></caption>
								<th></th>
								<%
								for (Fund fundList : fundDetails) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column02"><%=fundList.getFundAmount()%></td>
										<td class="cell100 column03"><%=fundList.getAccountNo()%></td>
										<td class="cell100 column04" id="date"><%=fundList.getDonateDate()%></td>

									</tr>

									<%
									}
									%>
								</tbody>
							</table>

						</div>

					</div>
				</div>

				<div id="donation-history-table">
					<div class="table100 table1">
						<div class="table100-head">
							<table>
								<caption id="stock-caption">Donation History</caption>

								<thead>
									<tr class="table-head ">
										<th class="cell100 column112">Zone Code</th>
										<th class="cell100 column113">Donation Year</th>
										<th class="cell100 column114">Total Civilians</th>
										<th class="cell100 column115">Donation Cause</th>
										<th class="cell100 column116">Donation Expenses</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll" id="donation-history-body">
							<table>
								<caption></caption>
								<th></th>

								<%
								for (DonationHistory donationHistory : donationHistoryList) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column122" id="zoneId"><%=donationHistory.getZoneId()%></td>
										<td class="cell100 column123" id="year"><%=donationHistory.getDonationYear()%></td>
										<td class="cell100 column124" id="total-civilian"><%=donationHistory.getNoOfCivilians()%></td>
										<td class="cell100 column125"><%=donationHistory.getDonationCause()%></td>
										<td class="cell100 column126">Rs. <%=donationHistory.getDonationExpenses()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- civilians table -->
				<div id="civilians-table">
					<div class="table100 table1" id="civilians-details-table">
						<div class="table100-head">
							<table>
								<caption id="stock-caption">Civilian Details</caption>

								<thead>
									<tr class="table-head ">
										<th class="cell100 column112">Name</th>
										<th class="cell100 column113">Phone Number</th>
										<th class="cell100 column114">Aadhar Number</th>
										<th class="cell100 column115">Address</th>
										<th class="cell100 column116">Zone Code</th>
										<th class="cell100 column117">Account Number</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll" id="civilians-table-body">
							<table>
								<caption></caption>
								<th></th>

								<%
								for (Consumer consumerDetails : consumerList) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column122"><%=consumerDetails.getConsumerName()%></td>
										<td class="cell100 column123"><%=consumerDetails.getConsumerPhoneNo()%></td>
										<td class="cell100 column124"><%=consumerDetails.getConsumerAadharNo()%></td>
										<td class="cell100 column125"><%=consumerDetails.getConsumerAddress()%></td>
										<td class="cell100 column126"><%=consumerDetails.getConsumerZoneId()%></td>
										<td class="cell100 column126"><%=consumerDetails.getConsumerAccountNo()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- transacion table -->
				<div id="transacion-table">
					<div class="account-details">
						<div id="acc-name">
							<h5 id="account-name">Account Holder Name &nbsp; : Seetha
								Foundation</h5>
							<h5 id="account-no">Account Number &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; : 1227101051526</h5>
						</div>
						<div id="bank-name">
							<h5 id="account-ifc">IFC Code &nbsp; &nbsp; &nbsp; &nbsp; :
								CNRB0001227</h5>
							<h5 id="account-branch">Branch Name : Karur</h5>
						</div>


					</div>
					<div class="table100 table1" id="transaction-details-table">
						<div class="table100-head">
							<table>
								<caption id="stock-caption">Transaction Details</caption>

								<thead>
									<tr class="table-head ">
										<th class="cell100 transaction-id">Transaction Code</th>
										<th class="cell100 transaction-date">Transaction Date</th>
										<th class="cell100 transaction-account">Account Number</th>
										<th class="cell100 transaction-type">Transaction Type</th>
										<th class="cell100 transaction-amount">Amount</th>
										<th class="cell100 transaction-description">Description</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll" id="transaction-table-body">
							<table>
								<caption></caption>
								<th></th>

								<%
								for (Transaction transaction : transactionList) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column1121"><%=transaction.getTransactionNo()%></td>
										<td class="cell100 column1122" id="date"><%=transaction.getTransactionDate()%></td>
										<td class="cell100 column1123"><%=transaction.getAccountNo()%></td>
										<td class="cell100 column1124"><%=transaction.getTransactionType()%></td>
										<td class="cell100 column1125"><%=transaction.getAmount()%></td>
										<td class="cell100 column1126" id="transaction-description"><%=transaction.getDescription()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- volunteers table -->
				<div id="volunteers-table">
					<input type="text" id="myInput" onkeyup="filterTable()"
						placeholder="Search for name ...">
					<div class="table100 table1" id="volunteers-details-table">
						<div class="table100-head">
							<table>
								<caption id="stock-caption">Volunteer Details</caption>

								<thead>
									<tr class="table-head ">
										<th class="cell100 column112">Name</th>
										<th class="cell100 column113">Phone Number</th>
										<th class="cell100 column114">Aadhar Number</th>
										<th class="cell100 column115">Mail Id</th>
										<th class="cell100 column116">Address</th>
										<th class="cell100 column117">Zone Id</th>
										<th class="cell100 column118">Account Number</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll" id="volunteers-table-body">
							<table id="tablexyz">
								<caption></caption>
								<th></th>

								<%
								for (Donor volunteer : volunteersList) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column122"><%=volunteer.getVolunteerName()%></td>
										<td class="cell100 column123"><%=volunteer.getVolunteerPhoneNo()%></td>
										<td class="cell100 column124"><%=volunteer.getVolunteerAadharNo()%></td>
										<td class="cell100 column125"><%=volunteer.getVolunteerMailId()%></td>
										<td class="cell100 column126"><%=volunteer.getVolunteerAddress()%></td>
										<td class="cell100 column127"><%=volunteer.getVolunteerZoneId()%></td>
										<td class="cell100 column128"><%=volunteer.getVolunteerAccountNo()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>


				<!--table end  -->
			</div>
		</div>
	</section>
	<%-- <%@ include file="/JSP files/CopyRights.jsp" %> --%>
	<script src="/JS files/AdminScript.js"></script>
</body>
</html>