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
<link rel="stylesheet" type="text/css" href="/CSS files/StockInfoStyle.css">

<title>Stock Details</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderAdmin.jsp" %>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	String fundDetails = "SELECT CONCAT (prefix,s_id) as stock_id, stock_name, quantity, "
			+ "staff_id,warehouse_id FROM stock";
	PreparedStatement pst = con.prepareStatement(fundDetails);
	ResultSet rs = pst.executeQuery();
	%>
	<section class="donor-details">
		<div class="donorTable">
			<table class="donorDetails">
			<caption>Stock Information</caption>

				<thead>
					<tr>
						<th>Stock Id</th>
						<th>Stock Name</th>
						<th>Quantity</th>
						<th>Staff Id</th>
						<th>Warehouse Id</th>
					</tr>
				</thead>
				<% while (rs.next()) { %>
				<tbody>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%= rs.getInt(3) %></td>
						<td><%= rs.getString(4) %></td>
						<td><%= rs.getString(5) %></td>
					</tr>


					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>