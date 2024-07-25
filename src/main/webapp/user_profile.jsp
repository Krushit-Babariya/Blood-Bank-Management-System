<%@page import="java.util.List"%>
<%@page import="com.port.model.HomeDonor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.port.dao.UserDAOimpl"%>
<%@ page import="com.port.db.DBConnection"%>
<%@ page import="com.port.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Red Cross</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="stylesheet" href="commom/css/dropDown.css">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />

<style>
.card {
	margin-bottom: 20px;
}
</style>


</head>
<body style="font-family: 'Alata'; background-color: #e9ecef;">
	<%@include file="common/user_header.jsp"%>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card" style="width: 21rem;">
					<img class="card-img-top" src="common/images/user.jpg"
						alt="Card image cap">
					<%
					String userEmail = (String) session.getAttribute("email");
					UserDAOimpl userDAO = new UserDAOimpl(DBConnection.getConn());
					System.out.println("User DAO :: " + userDAO);
					User user = userDAO.getUserDetail(userEmail);

					int uid = user.getUid();

					List<HomeDonor> hm = userDAO.getUserDonations(uid);
					%>
					<div class="card-body">
						<h5 class="card-title"><%=user.getFname()%>
							<%=user.getLname()%></h5>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Donor ID : <%=user.getUid()%></li>
						<li class="list-group-item">Email : <%=user.getEmail()%></li>
						<li class="list-group-item">State : <%=user.getState()%></li>
					</ul>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Previous Donations</h5>
						<table class="table">
							<thead>
								<tr>
									<th>Date</th>
									<th>Location</th>
									<th>Pincode</th>
									<th>Status</th>
									<th>Points</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (HomeDonor donation : hm) {
								%>
								<tr>
									<td><%=donation.getDate()%></td>
									<td><%=donation.getHno()%>, <%=donation.getStreet()%></td>
									<td><%=donation.getZipcode()%></td>
									<%
									if (donation.getStatus().equals("NO")) {
									%>
									<td><span class="bi bi-clock-fill"> Pending</span></td>
									<%
									} else if (donation.getStatus().equals("Accepted")) {
									%>
									<td><span class="bi bi-check-circle-fill"> Accepted</span></td>
									<%
									} else {
									%>
									<td><span class="bi bi-x-circle-fill"> Rejected</span></td>
									<%
									}
									%>
									<%
									if (donation.getStatus().equals("NO") || donation.getStatus().equals("Rejected")) {
									%>
									<td><span class="badge bg-primary rounded-pill">0</span></td>
									<%
									} else {
									%>
									<td><span class="badge bg-primary rounded-pill">100</span></td>
									<%
									}
									%>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="common/footer.jsp"%>
</body>
</html>
