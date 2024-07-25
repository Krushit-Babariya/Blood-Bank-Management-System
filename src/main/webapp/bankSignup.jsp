<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Indian Red Cross</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="stylesheet" href="common/css/login.css">
<link rel="shortcut icon" type="image/x-icon"
	href="common/images/Indian_Red_Cross_Logo.ico" />
<script src="common/WEB_INF/signup.js"></script>

<style>
.form-container {
	width: 500px;
	height: auto;
	margin-left: 35%;
	margin-top: 30px;
	margin-bottom: 30px;
}

#logo {
	padding-left: 30%;
}

progress {
	margin-top: 0;
	height: 20px;
	width: 100%;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	/* 	$(document).ready(function() {
	 $('#signupForm').submit(function(e) {
	 e.preventDefault(); // Prevent form submission

	 var formData = $(this).serialize(); // Serialize form data

	 // Send AJAX request to servlet
	 $.ajax({
	 type : 'POST',
	 url : 'sign_up',
	 data : formData,
	 success : function(response) {
	 $('#signupMessage').text(response); // Display response message 
	 alert("success");
	 }
	 });
	 });
	 }); 
	 */
	 
	 /* function LoginClick() {
         var name = document.getElementById("uname").value;
         var pass = document.getElementById("pass").value;
         var msg = document.getElementById("msg");

         if (name === "") {
             msg.innerHTML = "Please Enter UserName".fontcolor('red');
         } else {
             if (name === userDetails.Username) {
                 if (pass === userDetails.Password) {
                     msg.innerHTML = "Login successful";
                 } else {
                     msg.innerHTML = "Incorrect Password";
                 }
             } else {
                 msg.innerHTML = "Invalid Username";
             }
         }
     } */
     
	function VerifyPassword() {
		var regExp = /(?=.*[A-Z])\w{4,10}/;
		var txtPwd = document.getElementById("password").value;
		var lblMsg = document.getElementById("lblMsg");
		var grade = document.getElementById("grade");
		grade.style.display = "inline";
		function GradeDisplay(min, max, value) {
			grade.min = min;
			grade.max = max;
			grade.value = value;

		}
		if (txtPwd.match(regExp)) {
			lblMsg.innerHTML = "Strong Password";
			GradeDisplay(1, 100, 100);
		} else {
			if (txtPwd.length == 0) {
                lblMsg.innerHTML = "Please Enter Password";
                GradeDisplay(1, 100, 0)
            } else if(txtPwd.length < 4 && txtPwd.length >=1){
                lblMsg.innerHTML = "Poor Password";
                GradeDisplay(1, 100, 20);
            } else {
                lblMsg.innerHTML = "Weak Password";
                GradeDisplay(1, 100, 60);
            }
		}
	}
</script>
</head>

<body>
	<%@include file="common/header.jsp"%>
	<main class="main container-fluid">

		<div>
			<%
			if (session.getAttribute("errorMsg") != null) {
			%>
			<div class="form-container h-auto bg-danger" style="color: white;">
				<div align="center">
					<span class="bi bi-x-circle-fill"> User Already Exist</span>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div>
			<%
			if (session.getAttribute("successMsg") != null) {
			%>
			<div class="form-container h-auto bg-success" style="color: white;">
				<div align="center">
					<span class="bi bi-check2-circle"> Registration Successful</span>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="form-container">
			<img alt="logo" id="logo" src="common/images/Indian_Red_Cross.png"
				style="height: 60px; width: auto">
			<p class="title">Add Blood Bank</p>
			<form action="bankSignup" class="form" id="signupForm" method="post">
				<input type="text" class="input" name="bname" id="bname"
					placeholder="Blood Bank Name" required="required"> <input
					type="text" class="input" name="state" id="state"
					placeholder="State" required="required"> <input type="text"
					class="input" name="city" id="city" placeholder="City"
					required="required"> <input type="text" class="input"
					name="zipcode" id="zipcode" placeholder="Zip Code"
					required="required"><input type="email" class="input"
					name="email" id="email" placeholder="Email" required="required">
				<input type="text" class="input" name="phoneno" id="phoneno"
					placeholder="Contact Number" required="required"><input
					onkeyup="VerifyPassword()" type="password" class="input"
					name="pass" id="password" placeholder="Password"
					required="required">
				<div>
					<progress min="1" max="100" style="display: none;" id="grade"></progress>
					<br> <span id="lblMsg"></span>
				</div>
				<!-- <input type="password" class="input" name="cpass" id="confirmPassword" placeholder="Confirm Password"> -->
				<button type="submit" class="form-btn">Sign up</button>
			</form>
			<div id="signupMessage"></div>

			<p class="sign-up-label">
				Already have an account?<span class="sign-up-link"><a
					href="bankLogin.jsp">log in</a></span>
			</p>
		</div>
	</main>
</body>

</html>