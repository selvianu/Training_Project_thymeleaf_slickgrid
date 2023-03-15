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
<link rel="stylesheet" type="text/css" href="/CSS files/DonorInfoStyle.css">

<title>Donor Details</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderAdmin.jsp" %>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	String fundDetails = "SELECT concat (prefix,d_id) as donor_id,donor_name,phone_no,"
			+ "aadhar_no,mail_id,address,password,zone_id,account_no FROM donator";
	PreparedStatement pst = con.prepareStatement(fundDetails);
	ResultSet rs = pst.executeQuery();
	%>
	<section class="donor-details">
		<div class="donorTable">
			<table class="donorDetails">
			<caption>Donor Details</caption>

				<thead>
					<tr>
						<th>Donor Id</th>
						<th>Donor Name</th>
						<th>Donor Phone NO.</th>
						<th>Aadhar No.</th>
						<th>Mail Id</th>
						<th>Address</th>
						<th>Password</th>
						<th>Zone Id</th>
						<th>Account No.</th>
					</tr>
				</thead>
				<% while (rs.next()) { %>
				<tbody>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%= rs.getLong(3) %></td>
						<td><%= rs.getLong(4) %></td>
						<td><%= rs.getString(5) %></td>
						<td><%= rs.getString(6) %></td>
						<td><%= rs.getString(7) %></td>
						<td><%= rs.getString(8) %></td>
						<td><%= rs.getLong(9) %></td>
					</tr>


					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>