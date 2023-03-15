<%@page import="com.chainsys.finalproject.NGO.StockDetails"%>
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
<link rel="stylesheet" type="text/css" href="MakeDonationStyle.css">

<title>Make Donation</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderStaff.jsp" %>

	<%
	HttpSession session3 = request.getSession();
	String wareHouseId=(String)session3.getAttribute("warehouseId");
	List<StockDetails> stockDetailsList = (List<StockDetails>) session3.getAttribute("stockDetailsZoneWise");
	session3.removeAttribute("stockDetailsZoneWise");
	%>
	<section class="account-details">
		<div class="accountTable">
			<h4>Stock list in Warehouse</h4>
			<h4>
				Warehouse Id :
				<%=
						wareHouseId
			%>
			</h4>
			<table class="accountDetails">
			<caption>Stock Details Zone wise</caption>

				<thead>
					<tr>
						<th>Stock Id</th>
						<th>Stock Name</th>
						<th>Quantity</th>
						<th>Staff Id</th>
						<th>Warehouse Id</th>
					</tr>
				</thead>
				<%
				for (StockDetails stockDetails : stockDetailsList) {
				%>
				<tbody>
					<tr>
						<td><%=stockDetails.getStockId()%></td>
						<td><%=stockDetails.getStockName()%></td>
						<td><%=stockDetails.getQuantity()%></td>
						<td><%=stockDetails.getStaffId()%></td>
						<td><%=stockDetails.getWareHouseId()%></td>
					</tr>

					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</section>
		<%@ include file="/JSP files/CopyRights.jsp" %>
	
</body>
</html>