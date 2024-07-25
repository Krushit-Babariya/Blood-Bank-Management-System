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
<body>
	<div class="container mt-5">
		<h1 class="text-center mb-4">Emergency Blood Request</h1>
		<div class="row justify-content-center">
			<div class="col-md-6">
				<form action="EmergencyServletRequest" method="post">
					<div class="form-group mt-3">
						<label for="bloodGroup">Blood Group:</label> <select
							class="form-control" name="bloodGroup" id="bloodGroup" required>
							<option value="">Select Blood Group</option>
							<option value="A+">A+</option>
							<option value="A-">A-</option>
							<option value="B+">B+</option>
							<option value="B-">B-</option>
							<option value="AB+">AB+</option>
							<option value="AB-">AB-</option>
							<option value="O+">O+</option>
							<option value="O-">O-</option>
						</select>
					</div>
					<div class="form-group mt-3">
						<label for="units">Units Required:</label> <input type="number" min="1" max="100"
							class="form-control" name="units" id="units" required>
					</div>
					<div class="form-group mt-3">
						<label for="emergencyMessage">Emergency Message:</label>
						<textarea class="form-control" name="emergencyMessage"
							id="emergencyMessage" rows="4" required></textarea>
					</div>
					<input type="hidden" name="pincode" value="${pincode}">
					<button type="submit" class="btn btn-danger mt-3">Send
						Emergency Request</button>
				</form>
			</div>
		</div>
	</div>
</body>
</body>

</html>