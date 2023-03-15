<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>

<title>Login page</title>
<link rel="stylesheet" type="text/css"
	href="/CSS files/LoginPageStyle.css">
	  <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
</head>
<body>

	<%@ include file="/JSP files/Header.jsp"%>

	<section class="section2">
	<img class="login-img" alt="login-background" src="/images/login-background.jpeg">
		<div class="login-background">
			<div class="quotes">
				<h2>Login here</h2>
			</div>
			<div class="donate">
				<form class="form" action="/Login"  method="post">
					<label for="loginAs" id="login-as">Login as: </label> <select name="loginType"
						id="loginTypeAs">
						<option value="admin">Admin</option>
						<option value="management">Manager</option>
						<option value="distributor">Staff</option>
					</select> <br> 
					<!-- Enter user Id <input type="text" placeholder="UserId"
						name="userId" required id="userId"><br> Enter
					password <input type="password" placeholder="Password"
						name="password" required id="password"> -->
						<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="userId" placeholder="User Code">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
						<br>
					<button class="loginButton" type="submit">Login</button>
				</form>
			</div>
		</div>

	</section>

	<%@ include file="/JSP files/CopyRights.jsp"%>
</body>
</html>