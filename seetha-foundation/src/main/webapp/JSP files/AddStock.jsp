<%@page import="com.chainsys.finalproject.ngo.StockDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<title>Apply Donation</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/AddStockStyle.css">
	  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<script src="https://kit.fontawesome.com/df7f8b914d.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="/JSP files/HeaderStaff.jsp"%>

	<section class="section2">


		<div class="quotes">
			<div>
				<h3>Add Stock</h3>
			</div>


		</div>
		<form action="/AddStock" method="post" onclick="return formValidate()">
			<div class="donation-row">

				<div class="register-background" id="form">

					<div class="form-field">
						<div class="form-left">
							<div class="field">
								<label>Name :</label><input type="text"
									placeholder="Stock Name" name="stockName" id="description"
									onkeyup="descriptionValidate()"><br>
								<div id="descriptionError" class="error-box"></div>
							</div>
							<div class="field">
								<label>Quantity :</label><input type="number" placeholder="Nos"
									name="quantity" id="quantity" onkeyup="quantityValidate()"><br>
								<div id="quantityNoError" class="error-box"></div>
							</div>
						</div>

					</div>

					<div class="submit-button">
						<button class="resetButton" type="reset">Cancel</button>
						<button class="registerButton" type="submit">Submit</button>
					</div>
					<div id="submitError" class="error-box"></div>

				</div>
			</div>
		</form>



	</section>

	<script type="text/javascript">
		function checkUncheck(checkBox) {

			var checkBoxList = document.getElementsByName('checkBox');

			for (var i = 0; i < checkBoxList.length; i++) {

				checkBoxList[i].checked = checkBox.checked;
			}

		}
	</script>
	<script src="/JS files/AddStockScript.js"></script>
</body>
</html>