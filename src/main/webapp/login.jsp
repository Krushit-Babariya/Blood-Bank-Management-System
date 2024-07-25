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
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.jpg" />
<style type="text/css">
#logo {
	padding-left: 20%;
}
</style>
<!-- <script>
        var userDetails = {
            Username: "kru",
            Password: "123"
        }
        function LoginClick() {
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
        }
    </script> -->

<script>
	document.getElementById("loginForm").addEventListener("submit",
			function(event) {
				var recaptcha = grecaptcha.getResponse();
				if (recaptcha === "") {
					event.preventDefault();
					alert("Please complete the reCAPTCHA.");
				}
			});
</script>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<main class="main container-fluid">

		<div>
			<%
			if (session.getAttribute("userErrMsg") != null) {
			%>
			<div class="form-container h-auto bg-danger" style="color: white;">
				<div align="center">
					<span class="bi bi-x-circle-fill"> Invalid Username or
						Password</span>
				</div>
			</div>
			<%
			}
			%>
			
			<%
			if (session.getAttribute("userNotExistErrMsg") != null) {
			%>
			<div class="form-container h-auto bg-warning" style="color: white;">
				<div align="center" class="text-black">
					<span class="bi bi-exclamation-triangle"> Sorry, we can't find your account</span>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="form-container">
			<img alt="logo" id="logo" src="common/images/Indian_Red_Cross.png"
				style="height: 60px; width: auto">
			<p class="title">Welcome back</p>
			<form id="loginForm" action="login" class="form" method="POSt">
				<input id="uname" name="email" type="text" class="input"
					placeholder="Email" required="required"> <input id="pass"
					name="password" type="password" class="input"
					placeholder="Password" required="required">
				<div class="g-recaptcha"
					data-sitekey="6LclQakpAAAAAMukXVY2Ur44PLc4SW0xCj2tfy_c"></div> 
				<p class="page-link">
					<a href="changePwd.jsp"><span class="page-link-label">Forgot
							Password?</span></a>
				</p>
				<button type="submit" value="submit" class="form-btn">Log
					in</button>
			</form>
			<h6 id="msg"></h6>
			<p class="sign-up-label">
				Don't have an account?<span class="sign-up-link"><a
					href="signup.jsp">Sign up</a></span>
			</p>
		</div>

		<div class="form-container h-auto">
			<a href="bankLogin.jsp"><button class="form-btn w-100">Blood
					Bank Login</button></a>
		</div>
	</main>
</body>
</html>