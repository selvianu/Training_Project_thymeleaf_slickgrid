<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Donor login</title>
<link rel="stylesheet" type="text/css" href="/CSS files/DonorLoginStyle.css">
<link rel="stylesheet" type="text/css"
	href="/CSS files/HeaderFooterStyle.css">
</head>
<body>
	<%@ include file="/JSP files/Header.jsp" %>

	<section class="section2">


		<div class="quotes">
			<h2>Login here</h2>
		</div>
		<div class="donate-background">
			<form class="form" action="/DonorLogin" method="post">
				Enter Donor Id  <input type="text" placeholder="userId" name="userId"
					required id="userId"><br> Enter password  <input
					type="password" placeholder="password" name="password" required
					id="password"><br>
				<button class="submitButton" type="submit">Login</button>
			</form>
		</div>

	</section>

	<script type="text/javascript">
		
	</script>
</body>
</html>