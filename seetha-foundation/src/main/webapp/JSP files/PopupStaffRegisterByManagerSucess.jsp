<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Staff Registered Success</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/PopupStyle.css">
	  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
	<script type="text/javascript" src="/JS files/PopupScript.js"></script>
</head>
<body>
<div id="popup-container" class="popup-container">
        <div class="popup-content">
            <div class="text">
<%HttpSession session1=request.getSession(); 
		String distributorId=(String) session1.getAttribute("distributorId");%>
                <h2>Distributor Register Successfully</h2>
                <p> Distributor Id: <%=distributorId%></p>
            </div>
            <button onclick="location.href='/JSP files/ManagerPage.jsp'" class="button">Continue</button>
        </div>
    </div>
</body>
</html>