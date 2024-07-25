<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Red Cross</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="stylesheet" href="common/css/dropDown.css">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
</head>
<body style="font-family: 'Alata'; background-color: #e9ecef;">
	<%@include file="common/bank_header.jsp"%>



	<section class="py-lg-12 ">
		<div class="hero-img">
			<div class="container px-4 px-lg-0 ">
				<div class="row align-items-center">
					<div class=" col-xl-5 col-md-12 py-6 py-xl-0">
						<div class="container mt-5">
							<h2>Request Status</h2>
							<%
							if (session.getAttribute("status") != null) {
								String status = (String) session.getAttribute("status");
								if (status.equals("accepted")) {
							%>
							<div class="alert alert-success" role="alert">
								The request has been <strong>accepted</strong> successfully!
							</div>
							<%
							} else if (status.equals("rejected")) {
							%>
							<div class="alert alert-danger" role="alert">
								The request has been <strong>rejected</strong>!
							</div>
							<%
							}
							}
							%>
							<a href="blood_donation_request.jsp" class="btn btn-danger">Go Back</a>
						</div>
					</div>
					<div
						class="offset-xl-1 col-xl-6 col-md-12  d-flex justify-content-end">
						<div class="">
							<a target="_blank"><img
								src="common/images/child_with_heart2.png"
								class="img-fluid rounded-3 smooth-shadow-md"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
