<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>

<link rel="stylesheet" type="text/css" href="/CSS files/FundInfoStyle.css">

<title>Fund Details</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderAdmin.jsp" %>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	String fundDetails = "SELECT CONCAT(prefix,f_id) AS fund_id, fund_amount, donor_account_no, "
			+ "donation_date FROM fund";
	PreparedStatement pst = con.prepareStatement(fundDetails);
	ResultSet rs = pst.executeQuery();
	%>
	<section class="fund-details">
		<div class="fundTable">
			<table class="fundDetails">
			<caption>Fund Details</caption>

				<thead>
					<tr>
						<th>Fund Id</th>
						<th>Fund Amount</th>
						<th>Donor Account No.</th>
						<th>Donation Date</th>
					</tr>
				</thead>
				<% while (rs.next()) { %>
				<tbody>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%= rs.getFloat(2) %></td>
						<td><%= rs.getLong(3) %></td>
						<td><%= rs.getString(4) %></td>
					</tr>

					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>