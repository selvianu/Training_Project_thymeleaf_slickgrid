<%@page import="org.springframework.jdbc.core.JdbcTemplate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">

<head>
<meta charset="ISO-8859-1">
<title>Distributor Registration</title>

<link rel="stylesheet" type="text/css"
	href="/CSS files/DistributorRegisterPageStyle.css">
<script src="https://kit.fontawesome.com/df7f8b914d.js"
	crossorigin="anonymous"></script>

</head>

<body>

	<%@ include file="/JSP files/HeaderManager.jsp"%>

	<section class="section2">


		<div class="quotes">
			<h3>Distributing Staff Registration</h3>

		</div>

		<div class="register-background">
			<form class="form" id="donor-register" name="donor-registration"
				method="post" onclick="return formValidate()"
				action="/DistributorRegisterByManager">
				<div class="field">
					<label>Name:</label><input type="text" placeholder="Your Name"
						name="donorName" id="donorName" onkeyup="nameValidate()"><br>
					<span id="nameError"></span>
				</div>
				<div class="field">
					<label>Phone Number:</label><input type="tel"
						placeholder="10 Digit Phone No." name="phoneNumber"
						id="donorPhone" onkeyup="phoneNoValidate()"><br> <span
						id="phoneNoError"></span>
				</div>
				<div class="field">
					<label>Aadhar Number:</label><input type="number"
						placeholder="12 Digit Aadhar No." name="aadharNumber"
						id="donorAadhar" onkeyup="aadharNoValidate()"><br> <span
						id="aadharNoError"></span>
				</div>
				<div class="field">
					<label>Mail Id:</label><input type="email"
						placeholder="example@domain.com" name="mail" id="donorMail"
						onkeyup="emailIdValidate()"><br> <span
						id="mailIdError"></span>
				</div>
				<div class="field">
					<label>Password:</label><input type="password"
						placeholder="Password" name="pass" id="donorPass"
						onkeyup="passValidate()"><em id="eyeIcon"
						class="fa-solid fa-eye"></em><br> <span id="passError"></span>
				</div>
				<div class="field">
					<label>Confirm Your Password:</label><input type="password"
						placeholder="Re-Enter Password" name="confrimPass"
						id="confrimPass" onkeyup="confirmPassValidate()"><br>
					<span id="confirmPassError"></span>
				</div>
				<div class="field">
					<label for="zone">Select Zone Id:</label> <select name="zone"
						id="zoneId">

						<option value="tn47">Karur-tn47</option>
						<option value="tn01">Chennai-tn01</option>
						<option value="tn45">Trichy-tn45</option>
					</select><br>

				</div>

				<div class="field">
					<label>Address:</label><input type="text"
						placeholder="Street Name, City Name" name="address" id="address"
						onkeyup="addressValidate()"><br> <span
						id="addressError"></span>
				</div>
				<div class="field">
					<label>Account Number:</label><input type="number"
						placeholder="Account Number" name="accountNumber"
						id="accountNumber" onkeyup="accountNoValidate()"><br>
					<span id="accountNoError"></span>
				</div>
				<button class="resetButton" type="reset">Cancel</button>
				<button class="registerButton" type="submit">Register now</button>
				<span id="submitError"></span>
			</form>
		</div>

	</section>


	<script src="/JS files/RegisterPageValidation.js"></script>
</body>

</html>