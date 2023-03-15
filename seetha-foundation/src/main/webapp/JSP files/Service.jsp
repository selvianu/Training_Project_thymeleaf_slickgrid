<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en-US" xmlns:th="http://www.thymeleaf.org">

<head>
<!-- <meta charset="ISO-8859-1"> -->
<title>Services</title>

<link rel="stylesheet" type="text/css"
	href="/CSS files/LandingPageStyle.css">
<link rel="stylesheet" type="text/css"
	href="/CSS files/ServiceStyle.css">
<link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<link rel="icon" type="image/x-icon" href="/images/title-logo.ico">


</head>

<body>
	<%@include file="/JSP files/Header.jsp"%>
	<%
	//Float donationAmount = (Float) request.getAttribute("donationAmountServiceView");
	//Float donationAmount = ;
	/* Integer volunteer = (Integer) request.getAttribute("donatorCountServiceView");
	Integer civiliansCount = (Integer) request.getAttribute("consumerCountServiceView");
	Integer staffCount = (Integer) request.getAttribute("staffCountServiceView");
	Integer managerCount = (Integer) request.getAttribute("managerCountServiceView");
	Integer organizationCount = staffCount + managerCount; */
	%>
	<!-- count box start  -->
	<div class="count-box">
		<div class="container">
			<div class="text-row">
				<br />
				<div class="text-center">
					<h2 id="our">Our Achievement</h2>
					<p>With support from kind hearted volunteer and donor</p>
				</div>



			</div>
			<div class="count-row">
				<div class="col">
					<div class="counter">
						<em class="fa-solid fa-user-group fa-3x"></em>
						<h2 id="staff-count"></h2>
						<input type="number" id="value" value="${staffCountServiceView}">
						<p class="count-text ">Our Organization</p>
					</div>
				</div>
				<div class="col">
					<div class="counter">
						<em class="fa-solid fa-people-group fa-3x"></em>
						<h2 id="valunteer-count"></h2>
						<input type="number" id="value1"
							value="${donatorCountServiceView}">
						<p class="count-text ">Volunteer</p>
					</div>
				</div>
				<div class="col">
					<div class="counter">
						<em class="fa-solid fa-handshake-angle fa-3x"></em>
						<h2 id="donee-count"></h2>
						<input type="number" id="value2"
							value="${consumerCountServiceView}">
						<p class="count-text ">Donee</p>
					</div>
				</div>
				<div class="col">
					<div class="counter">
						<em class="fa-solid fa-coins fa-3x"></em>
						<div id="rupees">
							<div>
								<h2>Rs.</h2>
							</div>
							<div>
								<h2 id="expenses-count"></h2>
							</div>
						</div>
						<input type="number" id="value3"
							value="${donationAmountServiceView}">
						<p class="count-text ">Contribution</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- ################# Events Start Here#######################--->
	<section class="events">
		<div class="container">

			<div class="event-ro row">
				<div id="service-row">
					<div id="first-row">

						<div class="col-md-4 col-sm-6">
							<div class="event-box">
								<img src="/images/image_08.jpg" alt="">
								<h4>Child Education in Odisha</h4>

								<p class="raises">
									<span>Raised : Rs.2,32,467</span> / Rs.5,00,000
								</p>
								<p class="desic">The meaning of life is to find your gift.
									The purpose of life is to give it away</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<div class="event-box">
								<img src="/images/image_02.jpg" alt="">
								<h4>Child Education in Bihar</h4>
								<p class="raises">
									<span>Raised : Rs.44,235</span> / Rs.5,00,000
								</p>
								<p class="desic">We make a living by what we get. We make a
									life by what we give.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<div class="event-box">
								<img src="/images/image_04.jpg" alt="">
								<h4>Child Education in TamilNadu</h4>
								<p class="raises">
									<span>Raised : Rs.1,25,983</span> / Rs.5,00,000
								</p>
								<p class="desic">Happiness doesn’t result from what we get,
									but from what we give.</p>
							</div>
						</div>
					</div>
					<div id="second-row">
						<div class="col-md-4 col-sm-6">
							<div class="event-box">
								<img src="/images/image_05.jpg" alt="">
								<h4>Child Education in Kerala</h4>
								<p class="raises">
									<span>Raised : Rs.98,134</span> / Rs.5,00,000
								</p>
								<p class="desic">Always give without remembering and always
									receive without forgetting.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<div class="event-box">
								<img src="/images/image_06.jpg" alt="">
								<h4>Child Education in Lucknow</h4>
								<p class="raises">
									<span>Raised : Rs.3,45,643</span> / Rs.5,00,000
								</p>
								<p class="desic">Giving does not only precede receiving; it
									is the reason for it.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<div class="event-box">
								<img src="/images/image_07.jpg" alt="">
								<h4>Child Education in Assam</h4>
								<p class="raises">
									<span>Raised : Rs.89,274</span> / Rs.5,00,000
								</p>
								<p class="desic">No one has ever become poor from giving</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<div id="footer">
		<%@include file="/JSP files/Footer.jsp"%>
	</div>
	<script src="/JS files/LandingScript.js"></script>
	<script src="/JS files/ServiceScript.js"></script>

</body>

</html>