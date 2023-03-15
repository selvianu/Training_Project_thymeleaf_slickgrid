<%@page import="com.chainsys.finalproject.ngo.DonationHistory"%>
<%@page import="com.chainsys.finalproject.ngo.DonationStatus"%>
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
<link rel="stylesheet" type="text/css"
	href="/CSS files/DonationHistoryStyle.css">

<title>Donation History</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderManager.jsp"%>


	<%
	HttpSession session3 = request.getSession();
	List<DonationHistory> donationHistoryList = (List<DonationHistory>) session3.getAttribute("donationHistoryList");
	%>
	<section class="donor-details">
		<div class="donorTable">
			<div class="wrap-table100">
				<div class="table100 table1">
					<div class="table100-head">
						<table>
							<caption>Donation History</caption>

							<thead>
								<tr class="table-head ">
									<th class="cell100 column1">History Id</th>
									<th class="cell100 column2">Zone Id</th>
									<th class="cell100 column3">Donation Year</th>
									<th class="cell100 column4">Total Civilians</th>
									<th class="cell100 column5">Donation Cause</th>
									<th class="cell100 column6">Donation Expenses</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table100-body js-pscroll">
						<table>
							<caption>Donation History</caption>
							<th></th>
							
							<%
							for (DonationHistory donationHistory : donationHistoryList) {
							%>
							<tbody>
								<tr class="row100 body">
									<td class="cell100 column1"><%=donationHistory.getHistoryId()%></td>
									<td class="cell100 column2" id="zoneId"><%=donationHistory.getZoneId()%></td>
									<td class="cell100 column3"><%=donationHistory.getDonationYear()%></td>
									<td class="cell100 column4"><%=donationHistory.getNoOfCivilians()%></td>
									<td class="cell100 column5"><%=donationHistory.getDonationCause()%></td>
									<td class="cell100 column6">Rs. <%=donationHistory.getDonationExpenses()%></td>
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
	</section>

</body>
</html>