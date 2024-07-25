<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Indian Red Cross</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="stylesheet" href="commom/css/dropDown.css">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
<style>
body {
	background-color: #f4f4f4;
}

.container {
	margin-top: 50px;
}

.error-text {
	color: #333;
}

.error-description {
	color: #666;
}
</style>
</head>
<body style="font-family: 'Alata'; background-color: #e9ecef;">

	<%@include file="common/bank_header.jsp"%>

	<div class="container">
		<div class="text-center">
			<h1 class="error-text">Oops! Something went wrong.</h1>
			<p class="error-description">We're sorry, but it seems like there
				was an error processing your request.</p>
			<img class="h-25 w-25"
				src="https://media.giphy.com/media/YyKPbc5OOTSQE/giphy.gif"
				class="img-fluid" alt="Error GIF">
			<p class="error-description">Please try again later.</p>
		</div>
	</div>

	<%@include file="common/footer.jsp"%>

</body>
</html>
