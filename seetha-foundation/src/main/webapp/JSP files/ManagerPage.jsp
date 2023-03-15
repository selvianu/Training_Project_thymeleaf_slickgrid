<%@page import="com.chainsys.finalproject.ngo.Distributor"%>
<%@page import="com.chainsys.finalproject.ngo.Warehouse"%>
<%@page import="com.chainsys.finalproject.ngo.StockDetails"%>
<%@page import="com.chainsys.finalproject.ngo.Donor"%>
<%@page import="com.chainsys.finalproject.ngo.DonationStatus"%>
<%@page import="com.chainsys.finalproject.ngo.Consumer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Manager page</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/ManagerStyle.css">
	  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">

<script src="https://kit.fontawesome.com/df7f8b914d.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<%
	/* String sessionName = (String) session.getAttribute("managerName"); // Get the session attribute value
	if (sessionName == null) { // Check if the session attribute is null
		response.sendRedirect("/JSP files/Login.jsp"); // Redirect to login page if null
	} */
	HttpSession session3 = request.getSession();
	Integer donor = (Integer) session3.getAttribute("donatorCountManagerView");
	Integer civilians = (Integer) session3.getAttribute("civiliansCountManagerView");
	Integer staffZoneCount = (Integer) session3.getAttribute("staffZoneCount");
	Float expenses = (Float) session3.getAttribute("donationExpenses");
	List<Consumer> consumerListZoneWise = (List<Consumer>) session3.getAttribute("consumerListZoneWise");
	List<DonationStatus> donationStatus = (List<DonationStatus>) session3.getAttribute("donationDetailsZoneWiseList");
	List<Donor> volunteersListZoneWise = (List<Donor>) session3.getAttribute("volunteersListZoneWise");
	List<StockDetails> stockDetailsZoneWise = (List<StockDetails>) session3.getAttribute("stockDetailsZoneWise");
	List<Distributor> distributorListZoneWise = (List<Distributor>) session3.getAttribute("distributorListZoneWise");
	%>
	<%@ include file="/JSP files/HeaderManager.jsp"%>

	<section class="section2">
		<div class="staff-background">
			<div class="dash-board">
				<div class="admin-feature">
					<div class="management-button">
						<button id="features" onclick="#">
							<span> Donation Details </span>
						</button>
						<div class="management-drop-down">
							<button id="features" onclick="location.href='/DonationStatus'">
								<span> Donation Approval </span>
							</button>

							<button id="features" onclick="openDonationStatus()">
								<span>Donation Records </span>
							</button>

						</div>
					</div>
					<button id="features" onclick="openVolunteersTable()">
						<span>Volunteers Details</span>
					</button>



					<button id="features" onclick="openCivilianTable()">
						<span> Civilians Details </span>
					</button>
					<div class="donation-button">
						<button id="features" onclick="#">
							<span>Management </span>
						</button>
						<div class="donation-drop-down">
							<button id="features"
								onclick="openDistributorTable()">
								<span>Staff Details</span>
							</button>
							<button id="features"
								onclick="location.href='/JSP files/DistributorRegisterByManager.jsp'">
								<span>Add Staff</span>
							</button>
						</div>
					</div>
					<button id="features" onclick="openStock()">
						<span>Stock Details</span>
					</button>

				</div>
			</div>
			<!-- box for fund and staff list -->
			<div class="view-content">
				<div class="box-row">
					<a href="#" onclick="#">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Expenses</h4>
								<span id="money-icon" class="fa-solid fa-coins"></span>
							</div>
							<h5 id="balance">
								Rs.
								<%=expenses%>
							</h5>
						</div>
					</a> <a href="#" onclick="openDonationStatus()">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Donation Done</h4>
								<span id="manager-icon" class="fa-solid fa-handshake-angle"></span>

							</div>
							<h5 id="balance"><%=civilians%></h5>
						</div>
					</a> <a href="#" onclick="openDistributorTable()">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Distributors</h4>
								<span id="staff-icon" class="fa-solid fa-user-group"></span>
							</div>
							<h5 id="balance">
								<%=staffZoneCount%>
							</h5>
						</div>
					</a> <a href="#" onclick="openVolunteersTable()">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Volunteers</h4>
								<span id="people-icon" class="fa-solid fa-people-group"></span>
							</div>
							<h5 id="balance"><%=donor%>
							</h5>
						</div>
					</a>
				</div>
			</div>
			<!-- table start -->
			<div class="table-content">
				<!-- civilians table -->
				<div id="civilians-table">
					<div class="table100 table1" id="civilians-details-table">
						<div class="table100-head">
							<table>
								<caption id="stock-caption">Civilian Details</caption>

								<thead>
									<tr class="table-head ">
										<th class="cell100 column111">Civilian Id</th>
										<th class="cell100 column112">Name</th>
										<th class="cell100 column113">Phone Number</th>
										<th class="cell100 column114">Aadhar Number</th>
										<th class="cell100 column115">Address</th>
										<th class="cell100 column116">Zone Id</th>
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
								for (Consumer consumerDetails : consumerListZoneWise) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column121"><%=consumerDetails.getConsumerId()%></td>
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

				<!--  donation table start -->
				<div class="table-second-row" id="show-donation-table">
					<div class="donation-status-table" id="donation-status-table">
						<div class="table100 table1" id="donation-status">
							<div class="table100-head" id="show-donation-table-head">

								<table>
									<caption id="stock-caption" class="donation-table-caption">Donation Status</caption>
									<thead>
										<tr class="table-head " id="donation-table-head">


											<th class="cell100 column11" id="donation-table-h1">H.Id</th>
											<th class="cell100 column12" id="donation-table-h2">Staff Id</th>
											<th class="cell100 column13" id="donation-table-h3">Civilian Id</th>
											<th class="cell100 column14" id="donation-table-h4">Stock Id</th>
											<th class="cell100 column15" id="donation-table-h5">Quantity</th>
											<th class="cell100 column16" id="donation-table-h6">Fund</th>
											<th class="cell100 column17" id="donation-table-h7">Description</th>
											<th class="cell100 column18" id="donation-table-h8">Donation Date</th>
											<th class="cell100 column19" id="donation-table-h9">Approved By</th>
											<th class="cell100 column20" id="donation-table-h10">Status</th>
											<th class="cell100 column21" id="donation-table-h11">Zone Id</th>

										</tr>
									</thead>
								</table>
							</div>
							<div class="table100-body js-pscroll" id="donation-status-body">
								<table>
									<caption></caption>
									<th></th>
									<%
									for (DonationStatus donationList : donationStatus) {
									%>
									<tbody>
										<tr class="row100 body" id="donation-table-body">
											<td class="cell100 column01" id="donation-table-r1"><%=donationList.getDonationId()%></td>
											<td class="cell100 column02" id="donation-table-r2"><%=donationList.getStaffId()%></td>
											<td class="cell100 column03" id="donation-table-r3"><%=donationList.getConsumerId()%></td>
											<td class="cell100 column04" id="donation-table-r4"><%=donationList.getStockId()%></td>
											<td class="cell100 column05" id="donation-table-r5"><%=donationList.getQuantity()%></td>
											<td class="cell100 column06" id="donation-table-r6"><%=donationList.getFundAmount()%></td>
											<td class="cell100 column07" id="donation-table-r7"><%=donationList.getDescription()%></td>
											<td class="cell100 column08" id="donation-table-r8"><%=donationList.getDonationDate()%></td>
											<td class="cell100 column09" id="donation-table-r9"><%=donationList.getApprovedBy()%></td>
											<td class="cell100 column010" id="donation-table-r10"><%=donationList.getApprovalStatus()%></td>
											<td class="cell100 column011" id="donation-table-r11"><%=donationList.getZoneId()%></td>

										</tr>

										<%
										}
										%>
									</tbody>
								</table>

							</div>

						</div>
					</div>

				</div>
				<!--  donation table end -->
				<!-- volunteers table -->
				<div id="volunteers-table" class="valunteer-table-view">
					<div class="table100 table1" id="volunteers-details-table">
						<div class="table100-head" id="volunteer-table-head">
							<table>
								<caption id="stock-caption" class="volunteer-table-caption">Volunteer Details</caption>

								<thead>
									<tr class="table-head " id="volunteer-table-head">
										<th class="cell100 column111" id="volunteer-id">Id</th>
										<th class="cell100 column112" id="volunteer-table-h2">Name</th>
										<th class="cell100 column113" id="volunteer-table-h3">Phone Number</th>
										<th class="cell100 column114" id="volunteer-table-h4">Aadhar Number</th>
										<th class="cell100 column115" id="volunteer-table-h5">Mail Id</th>
										<th class="cell100 column116" id="volunteer-table-h6">Address</th>
										<th class="cell100 column117" id="volunteer-table-h7">Zone Id</th>
										<th class="cell100 column118" id="volunteer-table-h8">Account Number</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll" id="volunteers-table-body">
							<table>
								<caption></caption>
								<th></th>

								<%
								for (Donor volunteer : volunteersListZoneWise) {
								%>
								<tbody>
									<tr class="row100 body" id="volunteer-table-row">
										<td class="cell100 column121" id="volunteer-table-r1"><%=volunteer.getVolunteerId()%></td>
										<td class="cell100 column122" id="volunteer-table-r2"><%=volunteer.getVolunteerName()%></td>
										<td class="cell100 column123" id="volunteer-table-r3"><%=volunteer.getVolunteerPhoneNo()%></td>
										<td class="cell100 column124" id="volunteer-table-r4"><%=volunteer.getVolunteerAadharNo()%></td>
										<td class="cell100 column125" id="volunteer-table-r5"><%=volunteer.getVolunteerMailId()%></td>
										<td class="cell100 column126" id="volunteer-table-r6"><%=volunteer.getVolunteerAddress()%></td>
										<td class="cell100 column127" id="volunteer-table-r7"><%=volunteer.getVolunteerZoneId()%></td>
										<td class="cell100 column128" id="volunteer-table-r8"><%=volunteer.getVolunteerAccountNo()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- volunteers table end -->
				<!-- stock details table start  -->
				<div class="table-content">
					<div class="table-first-row">
						<div class="stock-table" id="stock-table-id">
							<div class="table100 table1">
								<div class="table100-head">
									<table>
										<caption id="stock-caption">Stock Details</caption>
										<thead>
											<tr class="table-head ">
												<th class="cell100 column1">Stock Id</th>
												<th class="cell100 column2">Name</th>
												<th class="cell100 column3">Quantity</th>
												<th class="cell100 column4">Staff Id</th>
												<th class="cell100 column5">Warehouse Id</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table100-body js-pscroll">
									<table>
										<caption></caption>
										<th></th>
										<%
										for (StockDetails stockDetails : stockDetailsZoneWise) {
										%>
										<tbody>
											<tr class="row100 body">
												<td class="cell100 column2"><%=stockDetails.getStockId()%></td>
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
					</div>
				</div>
				<!-- stock table end  -->
				<!-- staff table -->
				<div id="distributor-table">
					<div class="table100 table1" id="distributor-details-table">
						<div class="table100-head">
							<table>
								<caption id="distributor-caption">Distributor Details</caption>

								<thead>
									<tr class="table-head ">
										<th class="cell100 column111" id="volunteer-id">Id</th>
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
						<div class="table100-body js-pscroll" id="distributor-table-body">
							<table>
								<caption></caption>
								<th></th>

								<%
								for (Distributor distributorInfo : distributorListZoneWise) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column121"><%=distributorInfo.getDistributorId()%></td>
										<td class="cell100 column122"><%=distributorInfo.getDistributorName()%></td>
										<td class="cell100 column123"><%=distributorInfo.getPhoneNo()%></td>
										<td class="cell100 column124"><%=distributorInfo.getAadharNo()%></td>
										<td class="cell100 column125"><%=distributorInfo.getMailId()%></td>
										<td class="cell100 column126"><%=distributorInfo.getAddress()%></td>
										<td class="cell100 column127"><%=distributorInfo.getZoneId()%></td>
										<td class="cell100 column128"><%=distributorInfo.getAccountNo()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--staff table end  -->
			</div>
			<!-- table content end -->
		</div>
	</section>

	<script src="/JS files/ManagerScript.js"></script>
</body>
</html>