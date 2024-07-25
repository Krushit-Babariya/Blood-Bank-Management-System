<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Red Cross</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.jpg" />
</head>
<body style="font-family: 'Alata'; background-color: #e9ecef">
	<%@include file="common/bank_header.jsp"%>
	
	<section>
	<div class="container mb-5">
		<div class="row justify-content-center mt-5">
			<div class="col px-0 ">
				<img class="rounded" alt="" style="height: 780px;"
					src="common/images/Camp.png">
			</div>
			<div class="col-lg-6">
				<div class="card shadow-sm p-4 mb-5 bg-body rounded">
					<div class="card-body h-100">
						<h5 class="card-title text-center mb-5">Organize Blood Donation Camp</h5>
						<form action="campData" onsubmit="return validateForm()">
							<div class="mb-4">
								<label for="CNAME" class="form-label">Camp Name</label> <input
									name="CNAME" type="text" class="form-control" id="CNAME"
									placeholder="Enter Camp Name" required>
							</div>
							<div class="mb-4">
								<label for="LANDMARK" class="form-label">Landmark</label> <input
									name="LANDMARK" type="text" class="form-control" id="LANDMARK"
									placeholder="Enter Nearby Landmark" required>
							</div>
							<div class="mb-4">
								<label for="AREA" class="form-label">Area</label> <input
									name="AREA" type="text" class="form-control" id="AREA"
									placeholder="Enter Area Name" required>
							</div>
							<div class="mb-4">
								<label for="PINCODE" class="form-label">Pin Code</label> <input
									name="PINCODE" type="text" class="form-control" id="PINCODE"
									placeholder="Enter Pin Code" required>
							</div>
							<div class="mb-4">
								<label for="APPOINTMENTDATE" class="form-label">Appointment
									Date</label> <input name="APPOINTMENTDATE" type="date"
									class="form-control" id="APPOINTMENTDATE"
									min="<?php echo date('2024-03-29'); ?>" required>
							</div>
							<div class="mb-5">
								<label for="time" class="form-label">Time</label> <input
									name="time" type="text" class="form-control" id="time"
									placeholder="10 A.M. to 6 P.M." readonly>
							</div>
							<div class="text-center">
								<button data-bs-target="#success" data-bs-toggle="modal"
									type="submit" class="btn btn-danger w-100">Organize Camp</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

	<%@include file="common/footer.jsp"%>
</body>
</html>