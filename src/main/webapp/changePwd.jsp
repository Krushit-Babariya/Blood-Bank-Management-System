<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="stylesheet" href="common/css/login.css">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
<style>
.form-container {
	/* width: 500px; */
	height: 430px;
	margin-left: 40%;
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<main class="main container-fluid">
		<div class="form-container h-auto bg-danger">
			<h5 align="center" class="text-white">Sorry, this service is
				currently unavailable.</h5>
		</div>
		<div class="form-container h-auto">
			<img alt="logo" id="logo" src="common/images/Indian_Red_Cross.png"
				style="height: 60px; width: auto; margin-left: 60px;">
			<p class="title">Change Password</p>
			<form action="#" class="form" method="post">
				<input id="email" name="email" type="email" class="input"
					placeholder="Enter Email">
				<button type="submit" class="form-btn">Next <span class="bi bi-arrow-right"></span></button>
			</form>
			<h6 id="msg"></h6>
			<p class="sign-up-label">
				Back to <span class="sign-up-link"><a href="login.jsp">log
						in</a></span>
			</p>
			<div class="buttons-container"></div>
		</div>
	</main>
</body>
</html>