<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Red Cross</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
</head>
<body style="font-family: 'Alata'; background-color: #e9ecef;">
	<%@include file="common/bank_header.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title text-success">Emergency Request
							Submitted Successfully</h5>
						<p class="card-text">Your emergency blood request has been
							successfully submitted to potential donors.</p>
						<img src="common/images/RedCrossVan.png">
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <%@include file="common/footer.jsp"%> --%>
</body>
</html>