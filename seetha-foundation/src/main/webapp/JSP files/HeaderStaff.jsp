<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/HeaderOrganizationStyle.css">
<script src="https://kit.fontawesome.com/df7f8b914d.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<section class="first-section">

			<div class="home">
				<div class="logo">
					<h2 id="logo_text">Seetha Foundation</h2>
				</div>
				<div class="homeIcon">
					<a href="/JSP files/StaffPage.jsp"><em class="fa-solid fa-house" style="font-size: 20px;" ></em></a>
				</div>
			</div>
			<div class="nav-tools">

				<%
				HttpSession session2 = request.getSession();
				%>
				<%
				String name = (String) session2.getAttribute("staffName");
				%>
				
				<div class="session">
					<div class="loginAs">
						<h5 class="loginType">
							Welcome
							<%=name%>, Logged in as
							Distributor</h5>
					</div>
					<div>
						<a href="/Logout"><em class="fa-solid fa-right-from-bracket"
							id="logout" style="font-size: 25px;"></em></a>
					</div>
				</div>
			</div>
		</section>
	</header>
	<script>
		document.getElementById("logout").addEventListener("click", function() {
			// Perform logout actions here, such as clearing session data

			// Prevent the user from navigating back to the page after logging out
			history.forward();
		});
	</script>
</body>
</html>