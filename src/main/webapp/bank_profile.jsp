<%@ page import="com.port.model.BloodBank"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Red Cross</title>
<%@ include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
</head>
<body style="font-family: 'Alata'; background-color: #e9ecef;">

	<%@ include file="common/bank_header.jsp"%>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-3 offset-md-3 m-3">
				<div class="card">
					<img class="card-img-top" src="common/images/user.jpg"
						alt="Card image cap">
					<div class="card-body">
						<%
						BloodBank bank = (BloodBank) session.getAttribute("bloodBankData");
						if (bank != null) {
						%>
						<h5 class="card-title"><%=bank.getBname()%></h5>
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><strong>Bank ID:</strong> <%=bank.getBid()%></li>
							<li class="list-group-item"><strong>State:</strong> <%=bank.getState()%></li>
							<li class="list-group-item"><strong>City:</strong> <%=bank.getCity()%></li>
							<li class="list-group-item"><strong>PinCode:</strong> <%=bank.getZipcode()%></li>
							<li class="list-group-item"><strong>Email:</strong> <%=bank.getEmail()%></li>
							<li class="list-group-item"><strong>Phone:</strong> <%=bank.getPhoneno()%></li>
						</ul>
						<%
						} else {
						%>
						<p>No bank details found.</p>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="common/footer.jsp"%>
</body>
</html>
