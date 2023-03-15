<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Staff Registration</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/CivilianRegisterStyle.css">
	  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<script src="https://kit.fontawesome.com/df7f8b914d.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="/JSP files/HeaderStaff.jsp"%>
<%String zoneId=(String)session.getAttribute("staffZoneId"); %>
	<section class="section2">


		<div class="quotes">
			<h3>Civilian Registration</h3>

		</div>
		<div class="register-background">
			<form class="form" id="donor-register" name="donor-registration"
				method="post" onclick="return formValidate()"
				action="/CivilianRegister">
				<div class="form-field">
					<div class="form-left">
						<div class="field">
							<label>Name:</label><input type="text" placeholder="Your Name"
								name="donorName" id="donorName" onkeyup="nameValidate()"><br>
							<div id="nameError" class="error-box"></div>
						</div>
						<div class="field">
							<label>Phone Number:</label><input type="tel"
								placeholder="10 Digit Phone No." name="phoneNumber"
								id="donorPhone" onkeyup="phoneNoValidate()"><br>
							<div id="phoneNoError" class="error-box"></div>
						</div>
						<div class="field">
							<label>Aadhar Number:</label><input type="number"
								placeholder="12 Digit Aadhar No." name="aadharNumber"
								id="donorAadhar" onkeyup="aadharNoValidate()"><br>
							<div id="aadharNoError" class="error-box"></div>
						</div>
					</div>
					<div class="form-right">
						<div class="field">
							<label for="zone">Zone Id:</label> <input type="text"
								name="zone" id="zoneId" value="<%=zoneId %>" readonly> <br>

						</div>

						<div class="field">
							<label>Address:</label><input type="text"
								placeholder="Street Name, City Name" name="address" id="address"
								onkeyup="addressValidate()"><br>
							<div id="addressError" class="error-box"></div>
						</div>
						<div class="field">
							<label>Account Number:</label><input type="number"
								placeholder="Account Number" name="accountNumber"
								id="accountNumber" onkeyup="accountNoValidate()"><br>
							<div id="accountNoError" class="error-box"></div>
						</div>
					</div>
				</div>

				<div class="submit-button">
					<button class="resetButton" type="reset">Cancel</button>
					<button class="registerButton" type="submit">Register now</button>
				</div>
				<div id="submitError" class="error-box"></div>
			</form>
		</div>

	</section>


	<script src="/JS files/CivilianRegValidation.js"></script>
</body>
</html>