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
<link rel="stylesheet" type="text/css" href="/CSS files/WarehouseInfoStyle.css">

<title>Warehouse Details</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderAdmin.jsp" %>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
	String fundDetails = "SELECT CONCAT(prefix,w_id)as warehouse_id, location,"
			+ " zone_id FROM warehouse";
	PreparedStatement pst = con.prepareStatement(fundDetails);
	ResultSet rs = pst.executeQuery();
	%>
	<section class="donor-details">
		<div class="donorTable">
			<table class="donorDetails">
			<caption>Warehouse Details</caption>

				<thead>
					<tr>
						<th>Warehouse Id</th>
						<th>Location</th>
						<th>Zone Id</th>
					</tr>
				</thead>
				<% while (rs.next()) { %>
				<tbody>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
					</tr>


					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>