var quantityError23 = document.getElementById("quantityNoError");
var amountError23 = document.getElementById("amountError");
var descriptionError23 = document.getElementById("descriptionError");
var submitError23 = document.getElementById("submitError");

function quantityValidate() {
	let quantity23 = document.querySelector("#quantity").value;
	let quantityCheck23 = /^\d{1,2}$/;
	var message;
	if (quantity23 === 0) {
		message = "Quantity Must Not Be 0";
		quantityError23.innerHTML = message;
		document.getElementById("quantity").style.borderBottom = "1px solid red";
		return false;

	}
	if (quantity23.length === 0) {
		message = "Quantity Must Not Be Empty!";
		quantityError23.innerHTML = message;
		document.getElementById("quantity").style.borderBottom = "1px solid red";
		return false;

	}
	if (!quantity23.match(quantityCheck23)) {
		message = "Maximum Nos is 99 only!";
		quantityError23.innerHTML = message;
		document.getElementById("quantity").style.borderBottom = "1px solid red";
		return false;

	}
	quantityError23.innerHTML = null;
	document.getElementById("quantity").style.borderBottom = "1px solid green";
	return true;

}

function amountValidate() {

	let amount23 = document.querySelector("#amount").value;
	let amountCheck23 = /^\d{1,7}(\.\d{0,2})?$/;
	var message;
	if (!amount23.match(amountCheck23)) {
		message = "Please Enter Valid Amount!";
		amountError23.innerHTML = message;
		document.getElementById("amount").style.borderBottom = "1px solid red";
		return false;

	}
	amountError23.innerHTML = null;
	document.getElementById("amount").style.borderBottom = "1px solid green";
	return true;

}
function descriptionValidate() {

	let description23 = document.querySelector("#description").value;
	let descriptionCheck23 = /^([^-\s][a-z .A-Z]{4,50})$/;
	var message;
	if (!description23.match(descriptionCheck23)) {
		message = "Enter Valid Description!";
		descriptionError23.innerHTML = message;
		document.getElementById("description").style.borderBottom = "1px solid red";
		return false;

	}
	descriptionError23.innerHTML = null;
	document.getElementById("description").style.borderBottom = "1px solid green";
	return true;

}






function formValidate() {
	if (!descriptionValidate() || !amountValidate() || !quantityValidate()) {
		submitError.style.display = 'block';
		submitError.innerHTML = 'Please Fix Above Error To Submit! ';
		setTimeout(function() { submitError.style.display = 'none'; }, 3000)
		return false;
	}

	return true;

}








