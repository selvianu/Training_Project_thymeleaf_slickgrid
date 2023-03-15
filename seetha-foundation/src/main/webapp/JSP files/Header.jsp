<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<!-- <meta charset="ISO-8859-1"> -->
<title>Header</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/HeaderFooterStyle.css">
<link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<%-- <%@ page pageEncoding="UTF-8" %> --%>

</head>
<body>
	<header>
		<section class="first-section">
			<img alt="logo" src="/images/logo.png" class="logo-img">


			<div>
				<!-- Language Dropdown -->

				<select id="languageDropdown" onchange="changeLanguage()">
					<option value="en">English</option>
					<option value="fr">Français</option>
					<option value="es">Español</option>
					<option value="ta">தமிழ்</option>
				</select>
			</div>
			<div class="nav-tools">
				<ul class="tool-list">
					<li id="home">
						<button class="hbutton"
							onclick="location.href='/JSP files/LandingPage.jsp'">
							Home</button>
					</li>
					<li id="about">
						<button class="hbutton"
							onclick="location.href='/JSP files/LandingPage.jsp#about-content'">
							About Us</button>

					</li>
					<li id="services">
						<button class="hbutton"
							onclick="location.href='/Service'">
							Services</button>

					</li>
					<li id="contact-us">
						<button class="hbutton"
							onclick="location.href='/JSP files/LandingPage.jsp#footer'">
							Contact Us</button>

					</li>
					<li id="login">
						<button class="hbutton"
							onclick="location.href='/JSP files/Login.jsp'">Login</button>

					</li>
				</ul>

			</div>
		</section>
	</header>
	<script src="/JS files/LandingScript.js"></script>
</body>
</html>