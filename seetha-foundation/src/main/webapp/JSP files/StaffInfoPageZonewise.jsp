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
<link rel="stylesheet" type="text/css" href="/CSS files/StaffInfoStyleZonewise.css">

<title>Staff Details</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderManager.jsp" %>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	String fundDetails = "SELECT CONCAT(prefix,s_id) as staff_id, staff_name, phone_no, "
			+ "aadhar_no, mail_id, address, zone_id, account_no FROM distributor where zone_id=?";
	PreparedStatement pst = con.prepareStatement(fundDetails);
	
	ResultSet rs = pst.executeQuery();
	%>
	<section class="donor-details">
		<div class="donorTable">
			<table class="donorDetails">
			<caption>Staff Information Zone wise</caption>

				<thead>
					<tr>
						<th>Staff Id</th>
						<th>Staff Name</th>
						<th>Staff Phone NO.</th>
						<th>Aadhar No.</th>
						<th>Mail Id</th>
						<th>Address</th>
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
						<td><%= rs.getLong(8) %></td>
					</tr>


					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>