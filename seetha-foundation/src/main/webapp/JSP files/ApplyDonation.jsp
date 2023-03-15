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
	href="/CSS files/ApplyDonationStyle.css">
	  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<script src="https://kit.fontawesome.com/df7f8b914d.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="/JSP files/HeaderStaff.jsp"%>
	<%
	String zoneId = (String) session.getAttribute("staffZoneId");
	String ConsumerId = (String) session.getAttribute("consumerId");
	List<StockDetails> stockDetailsZoneWise = (List<StockDetails>) session.getAttribute("stockDetailsZoneWise");
	%>
	<section class="section2">


		<div class="quotes">
			<div>
				<h3>Civilian ID: &nbsp;</h3>
			</div>
			<div>
				<h3 id="consumer-id"><%=ConsumerId%></h3>
			</div>

		</div>
			<form action="/ApplyDonation" method="post"
				onclick="return formValidate()">
			<div class="donation-row">
				<div class="stock-list">
					<!-- stock details table start  -->
					<div class="table-content">
						<div class="table-first-row">
							<div class="stock-table" id="stock-table-id">
								<div class="table100 table1">
									<div class="table100-head">
										<table>
											<caption id="stock-caption">Stock Details</caption>
											<thead>
												<tr class="table-head ">

													<th class="cell100 column1">Select All<input
														type="checkbox" name="selectAll" value="test"
														onclick="checkUncheck(this)"></th>
													<th class="cell100 column2">Stock Id</th>
													<th class="cell100 column3">Name</th>
													<th class="cell100 column4">Quantity</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="table100-body js-pscroll">
										<table>
											<caption></caption>
											<th></th>
											<%
											for (StockDetails stockDetails : stockDetailsZoneWise) {
											%>
											<tbody>
												<tr class="row100 body">
													<td class="cell100 column2"><input type="checkbox"
														name="checkBox" value="<%=stockDetails.getStockId()%>" ></td>
													<td class="cell100 column2"><%=stockDetails.getStockId()%></td>
													<td class="cell100 column2"><%=stockDetails.getStockName()%></td>
													<td class="cell100 column2"><%=stockDetails.getQuantity()%></td>
												</tr>
												<%
												}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- stock table end  -->
				</div>
				<div class="register-background" id="form">

					<div class="form-field">
						<div class="form-left">


							<div class="field">
								<label>Quantity :</label><input type="number" placeholder="Nos"
									name="quantity" id="quantity" onkeyup="quantityValidate()"><br>
								<div id="quantityNoError" class="error-box"></div>
							</div>

							<div class="field">
								<label>Amount :</label><input type="tel" placeholder="Rs."
									name="amount" id="amount" onkeyup="amountValidate()"><br>
								<div id="amountError" class="error-box"></div>
							</div>
							<div class="field">
								<label>Description :</label><input type="text"
									placeholder="Description" name="description" id="description"
									onkeyup="descriptionValidate()"><br>
								<div id="descriptionError" class="error-box"></div>
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
	<script src="/JS files/ApplyDonation.js"></script>
</body>
</html>