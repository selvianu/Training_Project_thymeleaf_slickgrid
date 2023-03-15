var nameError = document.getElementById("nameError");
var phoneNoError = document.getElementById("phoneNoError");
var aadharNoError = document.getElementById("aadharNoError");
var mailIdError = document.getElementById("mailIdError");
var passError = document.getElementById("passError");
var confirmPassError = document.getElementById("confirmPassError");
var addressError = document.getElementById("addressError");
var accountNoError = document.getElementById("accountNoError");
var submitError = document.getElementById("submitError");

function nameValidate() {
	let name = document.querySelector("#donorName").value;
	let nameCheck = /^([^-\s][a-z .A-Z]{4,35})$/;
	var message;
	if (name.length === 0) {
		message = "User Name Must Not Be Empty!";
		nameError.innerHTML = message;
		return false;

	}
	if (!name.match(nameCheck)) {
		message = "Enter Valid Full Name!";
		nameError.innerHTML = message;
		return false;

	}
	nameError.innerHTML = '<i class="fas fa-check-circle"></i>';
	return true;

}

function phoneNoValidate() {

	let phoneStr = document.querySelector("#donorPhone").value;
	let phoneCheck = /^(0|91)?[6-9][0-9]{9}$/;
	var message;
	if (!phoneStr.match(phoneCheck)) {
		message = "Enter Valid 10 Digit Phone Number!";
		phoneNoError.innerHTML = message;
		return false;

	}
	phoneNoError.innerHTML = '<i class="fas fa-check-circle"></i>';
	return true;

}
function aadharNoValidate() {

	let aadharStr = document.querySelector("#donorAadhar").value;
	let aadharCheck = /^[2-9]\d{11}$/;
	var message;
	if (!aadharStr.match(aadharCheck)) {
		message = "Enter Valid 12 Digit Aadhar Number!";
		aadharNoError.innerHTML = message;
		return false;

	}
	aadharNoError.innerHTML = '<i class="fas fa-check-circle"></i>';
	return true;

}

function emailIdValidate() {
	let mail = document.querySelector("#donorMail").value;
	let mailCheck = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var message;
	if (!mail.match(mailCheck)) {
		message = "Enter Valid Email Address!";
		mailIdError.innerHTML = message;
		return false;

	}
	mailIdError.innerHTML = '<i class="fas fa-check-circle"></i>';
	return true;

}

function passValidate() {
	let pass = document.querySelector("#donorPass").value;
	let strongPass = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})/;
	var message;
	if (pass.match(strongPass)) {
		passError.innerHTML = '<i class="fas fa-check-circle"></i>';
		return true;

	}

	if (pass.length < 8) {
		message = "Weak Password!";
		passError.innerHTML = message;
		return false;
	}
	passError.innerHTML = '<i class="fas fa-check-circle"></i>';
	return true;

}

function confirmPassValidate() {
	let Pass = document.querySelector("#donorPass").value;
	let cPass = document.querySelector("#confrimPass").value;
	var message;
	if (Pass !== cPass) {
		message = "Pass Mismatch!";
		confirmPassError.innerHTML = message;
		return false;

	}

	confirmPassError.innerHTML = '<i class="fas fa-check-circle"></i>';
	return true;

}

function addressValidate() {
	let address = document.querySelector("#address").value;
	let addressCheck = /^([^-\s][-a-z,.-/ A-Z0-9]{4,200})$/;
	var message;
	if (address.length === 0) {
		message = "Address Must Not Be Empty!";
		addressError.innerHTML = message;
		return false;

	}
	if (!address.match(addressCheck)) {
		message = "Enter Correct Address!";
		addressError.innerHTML = message;
		return false;

	}
	addressError.innerHTML = '<i class="fas fa-check-circle"></i>';
	return true;

}
function accountNoValidate() {
	let account = document.querySelector("#accountNumber").value;
	let accountCheck = /^(\d{10}|\d{13}|\d{15}|\d{17})$/;
	var message;
	if (account.length === 0) {
		message = "Account Number Must Not Be Empty!";
		accountNoError.innerHTML = message;
		return false;

	}
	if (!account.match(accountCheck)) {
		message = "Account Number Must Be 10/13/15/17 Digits ";
		accountNoError.innerHTML = message;
		return false;

	}
	accountNoError.innerHTML = '<i class="fas fa-check-circle"></i>';
	return true;

}

const PassInput = document.querySelector("#donorPass")
const eye = document.querySelector("#eyeIcon")
eye.addEventListener("click", function() {
	//PassInput.getAttribute("type") === "Pass" ? "text" : "Pass"
	PassInput.setAttribute("type", "text");
	setTimeout(function() { PassInput.setAttribute("type", "Password") }, 3000)
	this.classList.toggle('fa-eye-slash')
});

function formValidate() {
	if (!nameValidate() || !phoneNoValidate() || !aadharNoValidate() || !emailIdValidate() || !PassValidate()
		|| !confirmPassValidate() || !addressValidate() || !accountNoValidate()) {
		submitError.style.display = 'block';
		submitError.innerHTML = 'Please Fix Above Error To Submit! ';
		setTimeout(function() { submitError.style.display = 'none'; }, 3000)
		return false;
	}
	alert('Registration Successfull');
	return true;

}








