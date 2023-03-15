var amountError = document.getElementById("amountError");
var nameError = document.getElementById("nameError");
var cardNumberError = document.getElementById("cardNumberError");
var mmExpireError = document.getElementById("mmExpireError");
var yyExpireError = document.getElementById("yyExpireError");
var pinError = document.getElementById("pinError");
var upiIdError = document.getElementById("upiIdError");
var upiPinError = document.getElementById("upiPinError");
var submitError = document.getElementById("submitError");
var upiSubmitError = document.getElementById("upiSubmitError");
//hide popup default by page loading
window.onload = function() {
	var popupCard = document.getElementById("creditCard");
	var popupUPI = document.getElementById("UPI");
	popupCard.style.display = "none";
	popupUPI.style.display = "none";
};
//open credit card popup on the screen
function openCard() {
	var popupCard = document.getElementById("creditCard");
	var creditBtn = document.getElementById("credit-button");
	var popupUPI = document.getElementById("UPI");
	var UPIBtn = document.getElementById("upi-button");
	popupCard.style.display = "block";
	popupUPI.style.display = "none";
	UPIBtn.style.backgroundColor = 'transparent';
	creditBtn.style.backgroundColor = 'yellow';
	creditBtn.style.color = 'black';

}
//open upi popup on the screen
function openUPI() {
	var popupUPI = document.getElementById("UPI");
	var creditBtn = document.getElementById("credit-button");
	var UPIBtn = document.getElementById("upi-button");
	var popupCard = document.getElementById("creditCard");
	popupCard.style.display = "none";
	popupUPI.style.display = "block";
	creditBtn.style.backgroundColor = 'transparent';
	creditBtn.style.color = 'black';
	UPIBtn.style.backgroundColor = 'orange';
	UPIBtn.style.color = 'black';
}
// Hide popup when user clicks outside of popup box
function closeCard() {
	var cardPopup = document.getElementById("creditCard");
	var upiPopup = document.getElementById("UPI");
	var creditBtn = document.getElementById("credit-button");
	var upiBtn = document.getElementById("upi-button");
	cardPopup.style.display = "none";
	upiPopup.style.display = "none";
	creditBtn.style.backgroundColor = 'transparent';
	upiBtn.style.backgroundColor = 'transparent';
	creditBtn.style.color = 'black';
	upiBtn.style.color = 'black';
}
//amount validation
function amtError() {
	let amount = document.querySelector("#amount").value;
	let amountCheck = /^\d{1,7}(\.\d{0,2})?$/;
	var message;
	if (!amount.match(amountCheck)) {
		message = "Please Enter Valid Amount!";
		amountError.innerHTML = message;
		document.getElementById("amount").style.border = "2px solid red";
		return false;
	}
	message = null;
	amountError.innerHTML = message;
	document.getElementById("amount").style.border = "2px solid green";
	return true;
}
//name validation
function nameValidate() {
	let name = document.querySelector("#name").value;
	let nameCheck = /^([^-\s][a-z .A-Z]{4,35})$/;
	var message;
	if (name.length === 0) {
		message = "User Name Must Not Be Empty!";
		nameError.innerHTML = message;
		document.getElementById("name").style.border = "2px solid red";
		return false;
	}
	if (!name.match(nameCheck)) {
		message = "Enter Valid Full Name!";
		nameError.innerHTML = message;
		document.getElementById("name").style.border = "2px solid red";
		return false;
	}
	message = null;
	nameError.innerHTML = message;
	document.getElementById("name").style.border = "2px solid green";
	return true;
}
//card number validation
function cardNumberValidate() {
	let cardNumber = document.querySelector("#card-number").value;
	let cardNumberCheck = /^[2-9]{1}[0-9]{3}(\s{1})?[0-9]{4}(\s{1})?[0-9]{4}(\s{1})?[0-9]{4}$/;
	var message;
	if (!cardNumber.match(cardNumberCheck)) {
		message = "Enter Valid 16 Digit Card Number!";
		cardNumberError.innerHTML = message;
		document.getElementById("card-number").style.border = "2px solid red";
		return false;
	}
	message = null;
	cardNumberError.innerHTML = message;
	document.getElementById("card-number").style.border = "2px solid green";
	return true;
}
//validate month
function monthValidate() {
	let mm = document.querySelector("#mm").value;
	let mmCheck = /^\d{2}$/;
	var message;
	if (!mm.match(mmCheck)) {
		message = "Please Enter Month only!";
		mmExpireError.innerHTML = message;
		document.getElementById("mm").style.border = "2px solid red";
		return false;
	}
	message = null;
	mmExpireError.innerHTML = message;
	document.getElementById("mm").style.border = "2px solid green";
	return true;
}
//validate year
function yearValidate() {
	let yy = document.querySelector("#yy").value;
	let yyCheck = /^\d{2}$/;
	var message;
	if (!yy.match(yyCheck)) {
		message = "Please Enter Year only!";
		yyExpireError.innerHTML = message;
		document.getElementById("yy").style.border = "2px solid red";
		return false;
	}
	message = null;
	yyExpireError.innerHTML = message;
	document.getElementById("yy").style.border = "2px solid green";
	return true;
}
//validate pin
function pinValidate() {
	let pin = document.querySelector("#pin").value;
	let pinCheck = /^\d{4}$/;
	var message;
	if (!pin.match(pinCheck)) {
		message = "Please Valid 4 Digits Pin!";
		pinError.innerHTML = message;
		document.getElementById("pin").style.border = "2px solid red";
		return false;
	}
	message = null;
	pinError.innerHTML = message;
	document.getElementById("pin").style.border = "2px solid green";
	return true;
}
//validate upi ID
function upiIdValidate() {
	let upiId = document.querySelector("#upiId").value;
	let upiIdCheck = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})?$/;
	var message;
	if (!upiId.match(upiIdCheck)) {
		message = "Please Enter Valid UPI Id!";
		upiIdError.innerHTML = message;
		document.getElementById("upiId").style.border = "2px solid red";
		return false;
	}
	message = null;
	upiIdError.innerHTML = message;
	document.getElementById("upiId").style.border = "2px solid green";
	return true;

}
//validate upiPin
function upiPinValidate() {
	let upiPin = document.querySelector("#upiPin").value;
	let upiPinCheck = /^\d{4}$/;
	var message;
	if (!upiPin.match(upiPinCheck)) {
		message = "Please Valid 4 Digits Pin!";
		upiPinError.innerHTML = message;
		document.getElementById("upiPin").style.border = "2px solid red";
		return false;
	}
	message = null;
	upiPinError.innerHTML = message;
	document.getElementById("upiPin").style.border = "2px solid green";
	return true;
}
function formValidate() {
	if (!amtError() || !nameValidate() || !cardNumberValidate() || !monthValidate() || !yearValidate()
		|| !pinValidate()) {
		submitError.style.display = 'block';
		submitError.innerHTML = 'Please Fill Above field To Pay! ';
		setTimeout(function() { submitError.style.display = 'none'; }, 3000)
		return false;
	}
	return true;
}
function upiFormValidate() {
	if (!amtError() || !upiIdValidate() || !upiPinValidate()) {
		upiSubmitError.style.display = 'block';
		upiSubmitError.innerHTML = 'Please Fill Above field To Pay! ';
		setTimeout(function() { upiSubmitError.style.display = 'none'; }, 3000)
		return false;
	}
	return true;
}


