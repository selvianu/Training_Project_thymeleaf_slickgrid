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
<link rel="stylesheet" type="text/css" href="/CSS files/TransactionStyle.css">

<title>Transaction Details</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderAdmin.jsp" %>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	String transactionDetails = "SELECT transaction_date, account_no, transaction_type, amount, description FROM transaction";
	PreparedStatement pst = con.prepareStatement(transactionDetails);
	ResultSet rs = pst.executeQuery();
	%>
	<section class="transaction-details">
		<div class="transactionTable">
			<table class="transactionDetails">
			<caption>Transaction Details</caption>

				<thead>
					<tr>
						<th>Transaction Date</th>
						<th>Account No.</th>
						<th>Transaction Type</th>
						<th>Ammount</th>
						<th>Description</th>
					</tr>
				</thead>
				<% while (rs.next()) { %>
				<tbody>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%= rs.getLong(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%= rs.getFloat(4) %></td>
						<td><%=rs.getString(5) %></td>
					</tr>

					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>