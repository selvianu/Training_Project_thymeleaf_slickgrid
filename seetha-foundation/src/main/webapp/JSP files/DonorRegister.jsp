<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Donor Registration</title>
<link rel="stylesheet" type="text/css" href="/CSS files/DonorRegisterStyle.css">
<link rel="stylesheet" type="text/css" href="/CSS files/CivilianRegisterStyle.css">
            <script src="https://kit.fontawesome.com/df7f8b914d.js" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="/JSP files/Header.jsp" %>

	<section class="section2">


		<div class="quotes">
			<h3>Welcome to Seetha Foundation</h3>
			<h5>Heartly appriciate your step into become a part of helping
				motive</h5>
		</div>
		<div class="register-background">
			<form class="form" id="donor-register" name="donor-registration"
				method="post" onclick="return formValidate()"
				action="/DonorRegister">
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
						<div class="field">
                            <label>Mail Id:</label><input type="email" placeholder="example@domain.com" name="mail"
                                 id="donorMail" onkeyup="emailIdValidate()"><br>
                            <span id="mailIdError" class="error-box"></span>
                        </div>
					</div>
					<div class="form-right">
						<div class="field">
                            <label for="zone">Select Zone Id:</label> <select name="zone" id="zoneId" class="zoneId">

                                <option value="tn47">Karur-tn47</option>
                                <option value="tn01">Chennai-tn01</option>
                                <option value="tn45">Trichy-tn45</option>
                            </select><br>

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
                        <div class="field">
                            <label>Password:</label><input type="password" placeholder="Password" name="pass"
                                 id="donorPass" onkeyup="passValidate()"><em  id="eyeIcon" class="fa-solid fa-eye" ></em><br>
                            <span id="passError" class="error-box"></span>
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

            <script src="/JS files/DonorRegValidation.js"></script>

	
</body>
</html>