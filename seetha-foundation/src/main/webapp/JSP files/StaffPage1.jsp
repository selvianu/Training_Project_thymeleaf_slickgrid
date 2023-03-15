<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Staff Page</title>
<link rel="stylesheet" type="text/css" href="/CSS files/StaffStyle.css">
<script type="text/javascript">
	alert("After management approval donation will done.");
</script>
</head>
<body>
	<%@ include file="/JSP files/HeaderStaff.jsp" %>
	<section class="section2">
		<div class="staff-background">
			<ul class="staff-feature">
				<h3>1.Donate</h3>
				<li id="features"><a href="CivilianRegister.jsp"> Make Donation </a></li>
				<h3>2.Donation details</h3>
				<li id="features"><a href="AccountInfoPage.jsp"> Donation
						status </a></li>
				<h3>3.Civilians details</h3>
				<li id="features"><a href="TransactionPage.jsp"> Civilians
						details </a></li>
				<h3>4.Stock details</h3>
				<li id="features"><a href="StaffRegister.jsp"> Stock list </a></li>

			</ul>

		</div>
	</section>
</body>
</html>