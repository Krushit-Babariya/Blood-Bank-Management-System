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

	<section class="m-5 py-lg-12 ">
		<div class="hero-img">
			<div class="container px-4 px-lg-0 ">
				<div class="row align-items-center">
					<div class="col-xl-5 col-md-12 py-6 py-xl-0">
						<div class="card shadow-sm p-2 mb-5 bg-body rounded">
							<div class="card-body text-center">
								<h5 class="card-title">Donation Requests</h5>
								<p class="card-text">Blood donation requests from your
									nearby area.</p>
								<a href="blood_donation_request.jsp"
									class="btn btn-danger position-relative"> <i
									class="bi bi-heart"></i> Donation Requests <span
									class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle"></span>
								</a>
							</div>
						</div>

						<div class="card shadow-sm p-2 mb-5 bg-body rounded">
							<div class="card-body text-center">
								<h5 class="card-title">Organize Donation Camp</h5>
								<p class="card-text">Organize donation camp</p>
								<a href="camp.jsp" class="btn btn-danger"><i
									class="bi bi-calendar"></i> Organize </a>
							</div>
						</div>
					</div>

					<div
						class="offset-xl-1 col-xl-6 col-md-12  d-flex justify-content-end">
						<div class="">
							<a target="_blank"><img
								src="common/images/doctor_with_whitecourt.png"
								class="img-fluid rounded-3 smooth-shadow-md"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@include file="common/footer.jsp"%>

</body>
</html>