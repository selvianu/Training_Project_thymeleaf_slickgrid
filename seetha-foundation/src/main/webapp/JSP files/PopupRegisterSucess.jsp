<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Manager Registered Success</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/PopupStyle.css">
	<script type="text/javascript" src="/JS files/PopupScript.js"></script>
	  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
</head>
<body>
<div id="popup-container" class="popup-container">
        <div class="popup-content">
            <div class="text">
<%HttpSession session1=request.getSession(); 
		String managerId=(String) session1.getAttribute("manager_id");%>
                <h2>Manager Register Successfully</h2>
                <p> Manager Id: <%=managerId%></p>
            </div>
            <button onclick="location.href='/JSP files/AdminPage.jsp'" class="button">Continue</button>
        </div>
    </div>
</body>
</html>