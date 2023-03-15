<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<link rel="stylesheet" type="text/css"
	href="/CSS files/DonationStyle.css">
<script src="https://kit.fontawesome.com/df7f8b914d.js"
	crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="/images/title-logo.ico">

<title>Make a donation</title>
</head>
<script>
	
</script>

<body>
	<%@ include file="/JSP files/Header.jsp"%>

	<section class="section2">

		<form class="form" action="/Donation" method="post">
			<div class="donate-background">

				<div class="payment-mode">
					<div class="quotes">
						<h2>Donate here</h2>
					</div>
					<h2 id="sentence1">How much would you like to donate?</h2>
					<br> <input type="number" onkeyup="amtError()" min="1"
						max="9999999" placeholder="Amount" name="amount" required
						id="amount" step="0.01" inputmode="decimal">
					<div id="amountError"></div>
					<h2>How would you like to pay?</h2>
					<br>
					<button onclick="openCard()" id="credit-button"
						class="creditButton" type="button">Credit Card</button>
					<button onclick="openUPI()" id="upi-button" class="upiButton"
						type="button">UPI</button>

				</div>

				<div id="creditCard" class="creditCard">
					<div class="cardDetails">

						<div class="close-popup">
							<em class="fa-solid fa-rectangle-xmark" onclick="closeCard()"></em>
						</div>

						<h3>Name</h3>
						<input type="text" id="name" placeholder="Card Holder Name"
							onkeyup="nameValidate()" >
						<div id="nameError"></div>
						<h3>Card Number</h3>
						<input type="number" id="card-number"
							placeholder="eg. 2121 4577 7658 6547"
							onkeyup="cardNumberValidate()" >
						<div id="cardNumberError"></div>
						<div class="pin-expire">
							<div>
								<h3>Expiration (mm/yy)</h3>
								<input type="number" id="mm" placeholder="MM" min="01" max="12"
									onkeyup="monthValidate()" ><input type="number"
									id="yy" placeholder="YY" min="23" max="99"
									onkeyup="yearValidate()" >
								<div id="mmExpireError"></div>
								<div id="yyExpireError"></div>
							</div>
							<div class="card-pin">
								<h3>Card Pin</h3>
								<input type="password" placeholder="****" id="pin" min="0000"
									onkeyup="pinValidate()" max="9999" size="4" >
								<div id="pinError"></div>
							</div>
						</div>
						<br>
						<button class="submitButton" type="submit"
							onclick="formValidate()">Pay</button>
						<div id="submitError"></div>

					</div>
				</div>
				<div id="UPI" class="UPI">
					<div class="cardDetails">

						<div class="close-popup">
							<em class="fa-solid fa-rectangle-xmark" onclick="closeCard()"></em>
						</div>

						<h3>Enter your UPI Id</h3>
						<input type="text" id="upiId" placeholder="eg. example@bank" onkeyup="upiIdValidate()"
							>
							<div id="upiIdError"></div>
						<div class="pin-expire">

							<div class="UPI-pin">
								<h3>UPI Pin</h3>
								<input type="password" placeholder="****" id="upiPin" min="0000"
									onkeyup="upiPinValidate()" max="9999" size="4" >
								<div id="upiPinError"></div>
							</div>
						</div>
						<br>
						<button class="submitButton" type="submit"
							onclick="upiFormValidate()">Pay</button>
						<div id="upiSubmitError"></div>

					</div>
				</div>
			</div>
		</form>
	</section>
	<script src="/JS files/DonationScript.js"></script>
</body>
</html>