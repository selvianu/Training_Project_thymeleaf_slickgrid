<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Manager Registered Status</title>
<link rel="stylesheet" type="text/css" href="/CSS files/PopupStyle.css">
  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<script type="text/javascript" src="/JS files/PopupScript.js"></script>
</head>
<body>
	<div id="popup-container" class="popup-container">
		<div class="popup-content">
			<div class="text">
				<%
				HttpSession session1 = request.getSession();
				%>
				<h2>Oops, something wasn't right</h2>
				<%
				for (int j = 1; j < 13; j++) {
					if (session1.getAttribute("errorMessage" + j) != null) {
				%>
				<p><%=session1.getAttribute("errorMessage" + j)%></p>
				<%
				}
				}
				%>

			</div>
			<button onclick="location.href='javascript:history.back()'"
				class="button">Retry</button>
		</div>
	</div>
</body>
</html>