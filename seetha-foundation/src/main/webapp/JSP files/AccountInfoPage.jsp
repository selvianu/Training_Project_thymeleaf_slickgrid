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
<link rel="stylesheet" type="text/css" href="/CSS files/AccountInfoStyle.css">

<title>Account Details</title>
</head>
<body>
	<%@include file="/JSP files/HeaderOrganization.jsp"%>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	String fundDetails = "SELECT account_no,a_holder_name,balance FROM account where account_no=1227101051526";
	PreparedStatement pst = con.prepareStatement(fundDetails);
	ResultSet rs = pst.executeQuery();
	%>
	<section class="account-details">
		<div class="accountTable">
			<table class="accountDetails">
			<caption>Account Information</caption>

				<thead>
					<tr>
						<th>Account No.</th>
						<th>Account Holder Name</th>
						<th>Balance</th>
					</tr>
				</thead>
				<% while (rs.next()) { %>
				<tbody>
					<tr>
						<td><%= rs.getLong(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%= rs.getFloat(3) %></td>
					</tr>

					<% } %>
				</tbody>
			</table>
			
		</div>
	</section>
	<%@include file="/JSP files/CopyRights.jsp"%>
</body>
</html>