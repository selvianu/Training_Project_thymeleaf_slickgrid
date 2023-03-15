var nameError1 = document.getElementById("nameError");
var phoneNoError1 = document.getElementById("phoneNoError");
var aadharNoError1 = document.getElementById("aadharNoError");
var mailIdError1 = document.getElementById("mailIdError");
var passError1 = document.getElementById("passError");
var confirmPassError1 = document.getElementById("confirmPassError");
var addressError1 = document.getElementById("addressError");
var accountNoError1 = document.getElementById("accountNoError");
var submitError1 = document.getElementById("submitError");

function nameValidate() {
	let name1 = document.querySelector("#donorName").value;
	let nameCheck1 = /^([^-\s][a-z .A-Z]{4,35})$/;
	var message;
	if (name1.length === 0) {
		message = "User Name Must Not Be Empty!";
		nameError1.innerHTML = message;
		document.getElementById("donorName").style.borderBottom = "1px solid red";
		return false;

	}
	if (!name1.match(nameCheck1)) {
		message = "Enter Valid Full Name!";
		nameError1.innerHTML = message;
		document.getElementById("donorName").style.borderBottom = "1px solid red";
		return false;

	}
	nameError1.innerHTML = null;
	document.getElementById("donorName").style.borderBottom = "1px solid green";
	return true;

}

function phoneNoValidate() {

	let phoneStr1 = document.querySelector("#donorPhone").value;
	let phoneCheck1 = /^(0|91)?[6-9][0-9]{9}$/;
	var message;
	if (!phoneStr1.match(phoneCheck1)) {
		message = "Enter Valid 10 Digit Phone Number!";
		phoneNoError1.innerHTML = message;
		document.getElementById("donorPhone").style.borderBottom = "1px solid red";
		return false;

	}
phoneNoError1.innerHTML = null;
	document.getElementById("donorPhone").style.borderBottom = "1px solid green";
	return true;

}
function aadharNoValidate() {

	let aadharStr1 = document.querySelector("#donorAadhar").value;
	let aadharCheck1 = /^[2-9]\d{11}$/;
	var message;
	if (!aadharStr1.match(aadharCheck1)) {
		message = "Enter Valid 12 Digit Aadhar Number!";
		aadharNoError1.innerHTML = message;
		document.getElementById("donorAadhar").style.borderBottom = "1px solid red";
		return false;

	}
	aadharNoError1.innerHTML = null;
	document.getElementById("donorAadhar").style.borderBottom = "1px solid green";
	return true;

}





function addressValidate() {
	let address1 = document.querySelector("#address").value;
	let addressCheck1 = /^([^-\s][-a-z,.-/ A-Z0-9]{4,200})$/;
	var message;
	if (address1.length === 0) {
		message = "Address Must Not Be Empty!";
		addressError1.innerHTML = message;
		document.getElementById("address").style.borderBottom = "1px solid red";
		return false;

	}
	if (!address1.match(addressCheck1)) {
		message = "Enter Correct Address!";
		addressError1.innerHTML = message;
		document.getElementById("address").style.borderBottom = "1px solid red";
		return false;

	}
	addressError1.innerHTML = null;
	document.getElementById("address").style.borderBottom = "1px solid green";
	return true;

}
function accountNoValidate() {
	let account1 = document.querySelector("#accountNumber").value;
	let accountCheck1 = /^(\d{10}|\d{13}|\d{15}|\d{17})$/;
	var message;
	if (account1.length === 0) {
		message = "Account Number Must Not Be Empty!";
		accountNoError1.innerHTML = message;
		document.getElementById("accountNumber").style.borderBottom = "1px solid red";
		return false;

	}
	if (!account1.match(accountCheck1)) {
		message = "Account Number Must Be 10/13/15/17 Digits ";
		accountNoError1.innerHTML = message;
		document.getElementById("accountNumber").style.borderBottom = "1px solid red";
		return false;

	}
	accountNoError1.innerHTML = null;
	document.getElementById("accountNumber").style.borderBottom = "1px solid green";
	return true;

}



function formValidate() {
	if (!nameValidate() || !phoneNoValidate() || !aadharNoValidate() || !addressValidate() || !accountNoValidate()) {
		submitError1.style.display = 'block';
		submitError1.innerHTML = 'Please Fix Above Error To Submit! ';
		setTimeout(function() { submitError1.style.display = 'none'; }, 3000)
		return false;
	}

	return true;

}








