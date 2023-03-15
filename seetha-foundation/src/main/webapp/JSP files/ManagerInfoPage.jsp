<%@page import="com.chainsys.finalproject.ngo.Distributor"%>
<%@page import="com.chainsys.finalproject.ngo.Manager"%>
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
<link rel="stylesheet" type="text/css" href="/CSS files/ManagerInfoStyle.css">
  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">

<title>Manager Details</title>
</head>
<body>
	<%@ include file="/JSP files/HeaderAdmin.jsp" %>

	<%
	HttpSession session3=request.getSession();
	List<Manager> managerList = (List<Manager>) session3.getAttribute("managerList");
	%>
	<section class="manager-details">
		<!-- manager table -->
				<div id="manager-table">
					<div class="table100 table1" id="manager-details-table">
						<div class="table100-head">
							<table>
								<caption id="manager-caption">Manager Details</caption>

								<thead>
									<tr class="table-head ">
										<th class="cell100 column111" id="volunteer-id">Id</th>
										<th class="cell100 column112">Name</th>
										<th class="cell100 column113">Phone Number</th>
										<th class="cell100 column114">Aadhar Number</th>
										<th class="cell100 column115">Mail Id</th>
										<th class="cell100 column116">Address</th>
										<th class="cell100 column117">Zone Id</th>
										<th class="cell100 column118">Account Number</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll" id="manager-table-body">
							<table>
								<caption></caption>
								<th></th>

								<%
								for (Manager managerInfo : managerList) {
								%>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column121"><%=managerInfo.getManagerId()%></td>
										<td class="cell100 column122"><%=managerInfo.getManagerName()%></td>
										<td class="cell100 column123"><%=managerInfo.getManagerPhoneNo()%></td>
										<td class="cell100 column124"><%=managerInfo.getManagerAadharNo()%></td>
										<td class="cell100 column125"><%=managerInfo.getManagerMailId()%></td>
										<td class="cell100 column126"><%=managerInfo.getManagerAddress()%></td>
										<td class="cell100 column127"><%=managerInfo.getManagerZoneId()%></td>
										<td class="cell100 column128"><%=managerInfo.getManagerAccountNo()%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
	</section>
</body>
</html>