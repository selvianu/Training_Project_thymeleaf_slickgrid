
<%@page import="java.util.ArrayList"%>
<%@page import="com.chainsys.finalproject.ngo.DonationStatus"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="/CSS files/DonationStatusStyle.css">
	  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<script>
	setTimeout("location.reload(true);", 10000);
</script>
<title>Donation Approval</title>
</head>
<body>
	<%@include file="/JSP files/HeaderManager.jsp"%>

	<%
	HttpSession session3 = request.getSession();
	List<DonationStatus> donationStatusList = (List<DonationStatus>) session3.getAttribute("donationStatusDetails");
	session3.removeAttribute("donationStatusDetails");
	%>
	<section class="account-details">
		<form action="/Approve" method="post" onsubmit="pageRefresh()">
			<div class="donorTable">
				<div class="wrap-table100">
					<div class="table100 table1">
						<div class="table100-head">



							<table>
								<caption>Donation Status</caption>
								<thead>
									<tr class="table-head ">

										<th class="cell100 column1">Select All <input
											type="checkbox" name="selectAll" value="test"
											onclick="checkUncheck(this)"></th>
										<th class="cell100 column2">Donation Id</th>
										<th class="cell100 column3">Staff Id</th>
										<th class="cell100 column4">Consumer Id</th>
										<th class="cell100 column5">Stock Id</th>
										<th class="cell100 column6">Quantity</th>
										<th class="cell100 column7">Fund Amount</th>
										<th class="cell100 column8">Donation Description</th>
										<th class="cell100 column9">Donation Date</th>
										<th class="cell100 column10">Approval By</th>
										<th class="cell100 column11">Approval Status</th>
										<th class="cell100 column12">Zone Id</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table100-body js-pscroll">
							<table>
								<caption></caption>
								<th></th>
								<%
								for (DonationStatus donationStatus : donationStatusList) {
								%>
								<tbody>
									<tr class="row100 body">

										<td class="cell100 column1"><input type="checkbox"
											name="checkBox" value="<%=donationStatus.getDonationId()%>"></td>

										<td class="cell100 column2"><%=donationStatus.getDonationId()%></td>
										<td class="cell100 column3"><%=donationStatus.getStaffId()%></td>

										<td class="cell100 column4"><%=donationStatus.getConsumerId()%></td>
										<td class="cell100 column5"><%=donationStatus.getStockId()%></td>
										<td class="cell100 column6"><%=donationStatus.getQuantity()%></td>
										<td class="cell100 column7"><%=donationStatus.getFundAmount()%></td>
										<td class="cell100 column8"><%=donationStatus.getDescription()%></td>
										<td class="cell100 column9"><%=donationStatus.getDonationDate()%></td>
										<td class="cell100 column10"><%=donationStatus.getApprovedBy()%></td>
										<td class="cell100 column11"><%=donationStatus.getApprovalStatus()%></td>
										<td class="cell100 column12"><%=donationStatus.getZoneId()%></td>


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
			<div class="button">
				<button type="submit" class="approve-button">Approve</button>
				<button type="submit" class="approve-button" id="reject-button"
					formaction="/Reject">Reject</button>
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

</body>
</html>








