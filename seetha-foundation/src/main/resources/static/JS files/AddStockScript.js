var quantityError12 = document.getElementById("quantityNoError");
var amountError12 = document.getElementById("amountError");
var descriptionError12 = document.getElementById("descriptionError");
var submitError12 = document.getElementById("submitError");

function quantityValidate() {
	let quantity12 = document.querySelector("#quantity").value;
	let quantityCheck12 = /^\d{1,6}$/;
	var message;
	if (quantity12 === 0) {
		message = "Quantity Must Not Be 0";
		quantityError12.innerHTML = message;
		document.getElementById("quantity").style.borderBottom = "1px solid red";
		return false;

	}
	if (quantity12.length === 0) {
		message = "Quantity Must Not Be Empty!";
		quantityError12.innerHTML = message;
		document.getElementById("quantity").style.borderBottom = "1px solid red";
		return false;

	}
	if (!quantity12.match(quantityCheck12)) {
		message = "Maximum Nos is 999999 only!";
		quantityError12.innerHTML = message;
		document.getElementById("quantity").style.borderBottom = "1px solid red";
		return false;

	}
	quantityError12.innerHTML = null;
	document.getElementById("quantity").style.borderBottom = "1px solid green";
	return true;

}

function descriptionValidate() {

	let description12 = document.querySelector("#description").value;
	let descriptionCheck12 = /^([^-\s][a-z .A-Z]{2,50})$/;
	var message;
	if (!description12.match(descriptionCheck12)) {
		message = "Enter Valid Stock Name!";
		descriptionError12.innerHTML = message;
		document.getElementById("description").style.borderBottom = "1px solid red";
		return false;

	}
	descriptionError12.innerHTML = null;
	document.getElementById("description").style.borderBottom = "1px solid green";
	return true;

}






function formValidate() {
	if (!descriptionValidate() || !quantityValidate()) {
		submitError12.style.display = 'block';
		submitError12.innerHTML = 'Please Fix Above Error To Submit! ';
		setTimeout(function() { submitError12.style.display = 'none'; }, 3000)
		return false;
	}

	return true;

}








