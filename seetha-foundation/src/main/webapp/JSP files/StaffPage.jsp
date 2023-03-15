<%@page import="com.chainsys.finalproject.ngo.Donor"%>
<%@page import="com.chainsys.finalproject.ngo.Consumer"%>
<%@page import="com.chainsys.finalproject.ngo.StockDetails"%>
<%@page import="com.chainsys.finalproject.ngo.DonationStatus"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Staff page</title>
<link rel="stylesheet" type="text/css" href="/CSS files/StaffStyle.css">
  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">

</head>
<body>
	<%@ include file="/JSP files/HeaderStaff.jsp"%>
	<%
	HttpSession session3 = request.getSession();
	Integer donor = (Integer) session3.getAttribute("donatorCount");
	Integer civilians = (Integer) session3.getAttribute("civiliansCount");
	List<DonationStatus> donationStatus = (List<DonationStatus>) session3.getAttribute("donationDetailsZoneWiseList");
	List<StockDetails> stockDetailsZoneWise = (List<StockDetails>) session3.getAttribute("stockDetailsZoneWise");
	List<Consumer> consumerListZoneWise = (List<Consumer>) session3.getAttribute("consumerListZoneWise");
	List<Donor> volunteersListZoneWise = (List<Donor>) session3.getAttribute("volunteersListZoneWise");
	%>
	<section class="section2">
		<div class="staff-background">
			<div class="dash-board">
				<div class="admin-feature">

					<button id="features"
						onclick="location.href='/JSP files/CivilianRegister.jsp'">
						<span>Make Donation </span>
					</button>
					<button id="features" onclick="openDonationStatus()">
						<span>Donation Status </span>
					</button>
					<button id="features" onclick="openVolunteersTable()">
						<span>Volunteers Details</span>
					</button>
					<button id="features" onclick="openCivilianTable()">
						<span> Civilians Details </span>
					</button>
					<div class="donation-button">

						<button id="features" onclick="openStock()">
							<span>Stock Details</span>
						</button>
						<button id="features"
							onclick="location.href='/JSP files/AddStock.jsp'">
							<span>Add Stock</span>
						</button>
						<div class="donation-drop-down"></div>
					</div>
				</div>
			</div>
			<!-- box for fund and staff list -->
			<div class="view-content">
				<div class="box-row">
					<a href="#" onclick="openDonationStatus()">
						<div class="fund-box">
							<div id="fund-content">
								<h4>Donation Done</h4>
								<span id="manager-icon" class="fa-solid fa-handshake-angle"></span>

							</div>
							<h5 id="balance"><%=civilians%></h5>
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
			<!-- table start -->
			<!--  donation table start -->
			<div class="table-second-row" id="donation-table-staff">
				<div class="donation-status-table" id="donation-status-table">
					<div class="table100 table1" id="donation-status">
						<div class="table100-head" id="donation-table-staff-head">

							<table>
								<caption id="stock-caption" class="donation-table-staff-caption">Donation Status</caption>
								<thead>
									<tr class="table-head" id="donation-table-staff-head">


										<th class="cell100 column11" id="donation-table-staff-h1">H.Id</th>
										<th class="cell100 column12" id="donation-table-staff-h2">Staff Id</th>
										<th class="cell100 column13" id="donation-table-staff-h3">Civilian Id</th>
										<th class="cell100 column14" id="donation-table-staff-h4">Stock Id</th>
										<th class="cell100 column15" id="donation-table-staff-h5">Quantity</th>
										<th class="cell100 column16" id="donation-table-staff-h6">Fund</th>
										<th class="cell100 column17" id="donation-table-staff-h7">Description</th>
										<th class="cell100 column18" id="donation-table-staff-h8">Donation Date</th>
										<th class="cell100 column19" id="donation-table-staff-h9">Approved By</th>
										<th class="cell100 column20" id="donation-table-staff-h10">Status</th>
										<th class="cell100 column21" id="donation-table-staff-h11">Zone Id</th>

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
									<tr class="row100 body" id="donation-table-staff-row">
										<td class="cell100 column01" id="donation-table-staff-r1"><%=donationList.getDonationId()%></td>
										<td class="cell100 column02" id="donation-table-staff-r2"><%=donationList.getStaffId()%></td>
										<td class="cell100 column03" id="donation-table-staff-r3"><%=donationList.getConsumerId()%></td>
										<td class="cell100 column04" id="donation-table-staff-r4"><%=donationList.getStockId()%></td>
										<td class="cell100 column05" id="donation-table-staff-r5"><%=donationList.getQuantity()%></td>
										<td class="cell100 column06" id="donation-table-staff-r6"><%=donationList.getFundAmount()%></td>
										<td class="cell100 column07" id="donation-table-staff-r7"><%=donationList.getDescription()%></td>
										<td class="cell100 column08" id="donation-table-staff-r8"><%=donationList.getDonationDate()%></td>
										<td class="cell100 column09" id="donation-table-staff-r9"><%=donationList.getApprovedBy()%></td>
										<td class="cell100 column010" id="donation-table-staff-r10"><%=donationList.getApprovalStatus()%></td>
										<td class="cell100 column011" id="donation-table-staff-r11"><%=donationList.getZoneId()%></td>

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
			<!-- donation status table end  -->
			<!-- stock details table start  -->
			<div id="stock-table">
				<div class="table100 table1" id="stock-details-table">
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
					<div class="table100-body js-pscroll" id="stock-table-body">
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
			<!-- stock table end  -->
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
			<!-- civilians table end -->
			<!-- volunteers table -->
			<div id="volunteers-table" class="volunteer-table-staff">
				<div class="table100 table1" id="volunteers-details-table">
					<div class="table100-head" id="volunteer-table-staff-head">
						<table>
							<caption id="stock-caption" class="volunteer-table-staff-caption">Volunteer Details</caption>

							<thead>
								<tr class="table-head " id="volunteer-table-staff-h">
									<th class="cell100 column111" id="volunteer-id">Id</th>
									<th class="cell100 column112" id="volunteer-table-staff-h1">Name</th>
									<th class="cell100 column113" id="volunteer-table-staff-h2">Phone Number</th>
									<th class="cell100 column114" id="volunteer-table-staff-h3">Aadhar Number</th>
									<th class="cell100 column115" id="volunteer-table-staff-h4">Mail Id</th>
									<th class="cell100 column116" id="volunteer-table-staff-h5">Address</th>
									<th class="cell100 column117" id="volunteer-table-staff-h6">Zone Id</th>
									<th class="cell100 column118" id="volunteer-table-staff-h7">Account Number</th>
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
								<tr class="row100 body" id="volunteer-table-staff-r">
									<td class="cell100 column121" id="volunteer-table-staff-r1"><%=volunteer.getVolunteerId()%></td>
									<td class="cell100 column122" id="volunteer-table-staff-r2"><%=volunteer.getVolunteerName()%></td>
									<td class="cell100 column123" id="volunteer-table-staff-r3"><%=volunteer.getVolunteerPhoneNo()%></td>
									<td class="cell100 column124" id="volunteer-table-staff-r4"><%=volunteer.getVolunteerAadharNo()%></td>
									<td class="cell100 column125" id="volunteer-table-staff-r5"><%=volunteer.getVolunteerMailId()%></td>
									<td class="cell100 column126" id="volunteer-table-staff-r6"><%=volunteer.getVolunteerAddress()%></td>
									<td class="cell100 column127" id="volunteer-table-staff-r7"><%=volunteer.getVolunteerZoneId()%></td>
									<td class="cell100 column128" id="volunteer-table-staff-r8"><%=volunteer.getVolunteerAccountNo()%></td>
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
		</div>
	</section>

	<script src="/JS files/StaffScript.js"></script>
</body>
</html>