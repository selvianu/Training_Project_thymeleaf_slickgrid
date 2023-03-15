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
<link rel="stylesheet" type="text/css" href="/CSS files/ConsumerInfoStyle.css">

<title>Consumer Details</title>
</head>
<body>
	  <%@ include file="/JSP files/HeaderAdmin.jsp" %>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	String fundDetails = "SELECT CONCAT(prefix,c_id) AS consumer_id, consumer_name,phone_no,aadhar_no,"
			+ "address,zone_id,account_no FROM consumer";
	PreparedStatement pst = con.prepareStatement(fundDetails);
	ResultSet rs = pst.executeQuery();
	%>
	<section class="donor-details">
		<div class="donorTable">
			<table class="donorDetails">
			<caption>Consumer Details</caption>

				<thead>
					<tr>
						<th>Consumer Id</th>
						<th>Consumer Name</th>
						<th>Consumer Phone NO.</th>
						<th>Aadhar No.</th>
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
						<td><%= rs.getLong(7) %></td>
					</tr>


					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>