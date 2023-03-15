<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Volunteer Registered Success</title>
<link rel="stylesheet" type="text/css" href="/CSS files/PopupStyle.css">
<script type="text/javascript" src="/JS files/PopupScript.js"></script>
</head>
<body>
	<div id="popup-container" class="popup-container">
		<div class="popup-content">
			<div class="text">
				<%
				HttpSession session1 = request.getSession();
				String donorId = (String) session1.getAttribute("donorId");
				%>
				<h2>We are humbled by your generosity, both your volunteerism
					and financial donation. Thank you for your unwavering support.</h2>
				<p>
					Volunteer Id:
					<%=donorId%></p>
			</div>
			<button onclick="location.href='/JSP files/LandingPage.jsp'"
				class="button">Continue</button>
		</div>
	</div>
</body>
</html>