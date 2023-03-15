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
<title>TestGrid</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/ManagerInfoStyle.css">
<link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<!-- slick grid start  -->
<link rel="stylesheet"
	href="/SlickGrid/css/smoothness/jquery-ui-1.8.16.custom.css" type="text/css" />
<link rel="stylesheet" href="/SlickGrid/slick.grid.css" type="text/css" />

<style>
.slick-headerrow-column {
	background: #87ceeb;
	text-overflow: clip;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.slick-headerrow-column input {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
</style>
<!-- slick grid end  -->
</head>
<body>
 
	<%@ include file="/JSP files/HeaderAdmin.jsp"%>

	<%
	HttpSession session3 = request.getSession();
	List<Manager> managerList = (List<Manager>) session3.getAttribute("managerList");
	%> 
	<div style="position: relative; margin-top: 100px;">
		<div style="width: 800px;">
			<div id="myGrid" style="width: 100%; height: 500px;"></div>
		</div>
	</div>
	<%-- <input id="values" value="${managerInfo}" > --%>


	<script src="/SlickGrid/lib/jquery-1.7.min.js"></script>
	<script src="/SlickGrid/lib/jquery-ui-1.8.16.custom.min.js"></script>
	<script src="/SlickGrid/lib/jquery.event.drag-2.2.js"></script>

	<script src="/SlickGrid/slick.core.js"></script>
	<script src="/SlickGrid/slick.dataview.js"></script>
	<script src="/SlickGrid/slick.grid.js"></script>

	<script>
		var dataView;
		var grid;
		var data = ${managerInfo};
		//var data=document.getElementById("values");
		//data = [];
		var options = {
			enableCellNavigation : true,
			showHeaderRow : true,
			headerRowHeight : 30,
			explicitInitialization : true
		};
		var columnFilters = {};

		 var columns = [
	            { id: "managerCode", name: "Manager Code", field: "managerCode" },
	            { id: "managerName", name: "Manager Name", field: "managerName" },
	            { id: "managerPhoneNo", name: "Manager Phone No.", field: "managerPhoneNo" },
	            { id: "managerAadhar", name: "Manager Aadhar No.", field: "managerAadhar" },
	            { id: "managerMailId", name: "Manager MailId.", field: "managerMailId" },
	            { id: "managerAddress", name: "Manager Address", field: "managerAddress" },
	            { id: "managerZone", name: "Manager Zone", field: "managerZone" },
	            { id: "managerAccount", name: "Manager Account", field: "managerAccount" }
	        ];

		/*  $(function() {
			for (var i = 0; i < data.lenght; i++) {
				var d = (data1[i] = {});

				d["title"] = data.;
				d["director"] = "5 days";
				d["name"] ="Raja";
				d["year"] = "01/01/2009";
				d["year"] = "01/01/2009";
				d["year"] = "01/01/2009";
				d["year"] = "01/01/2009";
				d["year"] = "01/01/2009";
			} 

		})  */
		;
		
			grid = new Slick.Grid("#myGrid", data, columns);
		
	</script>
	<%-- <section class="manager-details">
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
	</section> --%>
</body>
</html>