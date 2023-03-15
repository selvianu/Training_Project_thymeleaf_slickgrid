<%@page import="com.chainsys.finalproject.NGO.DonationStatus"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/CSS files/DonationInfoStyle.css">

<title>Donation Details</title>
</head>
<body>
		<%@ include file="/JSP files/HeaderManager.jsp" %>


	<%
	HttpSession session3=request.getSession();
	List<DonationStatus> donationInfoList = (List<DonationStatus>) session3.getAttribute("donationInfoDetails");
	
	%>
	<section class="donor-details">
		<div class="donorTable">
			<table class="donorDetails">
			<caption>Donation Details</caption>

				<thead>
					<tr>
						<th>Donation Id</th>
						<th>Staff Id</th>
						<th>Consumer Id</th>
						<th>Stock Id</th>
						<th>Quantity</th>
						<th>Fund Amount</th>
						<th>Description</th>
						<th>Donation Date</th>
						<th>Approved By</th>
						<th>Approval Status</th>
						<th>Zone Id</th>
					</tr>
				</thead>
				<% for (DonationStatus donationInfo : donationInfoList) { %>
				<tbody>
					<tr>
						<td><%=donationInfo.getDonationId()%></td>
							<td><%=donationInfo.getStaffId()%></td>

							<td><%=donationInfo.getConsumerId()%></td>
							<td><%=donationInfo.getStockId()%></td>
							<td><%=donationInfo.getQuantity()%></td>
							<td><%=donationInfo.getFundAmount()%></td>
							<td><%=donationInfo.getDescription()%></td>
							<td><%=donationInfo.getDonationDate()%></td>
							<td><%=donationInfo.getApprovedBy()%></td>
							<td><%=donationInfo.getApprovalStatus()%></td>
							<td><%=donationInfo.getZoneId()%></td>
					</tr>


					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>