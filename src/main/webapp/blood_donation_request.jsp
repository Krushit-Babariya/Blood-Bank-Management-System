<%@page import="java.sql.Connection"%>
<%@page import="com.port.dao.HomeDonorDAOImpl"%>
<%@page import="com.port.model.HomeDonor"%>
<%@page import="com.port.db.DBConnection"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="java.util.*"%>

<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Donor List</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
</head>
<body style="font-family: 'Alata'; background-color: #e9ecef;">
	<%@include file="common/user_header.jsp"%>

	<div class="container mt-5">
		<h2>Home Donor List</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Donor ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>House Number</th>
					<th>Street</th>
					<th>Zip Code</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				String pinCode = (String) session.getAttribute("pinCode");

				HomeDonorDAOImpl donorDAO = new HomeDonorDAOImpl();
				List<HomeDonor> donors = donorDAO.selectDonor(pinCode);

				for (HomeDonor donor : donors) {
				%>
				<tr>
					<td><%=donor.getDid()%></td>
					<td><%=donor.getFname()%></td>
					<td><%=donor.getLname()%></td>
					<td><%=donor.getHno()%></td>
					<td><%=donor.getStreet()%></td>
					<td><%=donor.getZipcode()%></td>
					<td><%=donor.getDate()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<%@include file="common/footer.jsp"%>
</body>
</html>
 --%>


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
		<h2>Home Donor List</h2>
		<table class="table table-bordered">
			<thead align="center">
				<tr>
					<th>Donor ID</th>
					<th>Name</th>
					<th>Address</th>
					<th>Zip Code</th>
					<th>Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody align="center">
				<%
				String pinCode = (String) session.getAttribute("bankPincode");
				System.out.println("ZIP CODE ::::: " + pinCode);

				HomeDonorDAOImpl donorDAO = new HomeDonorDAOImpl(DBConnection.getConn());
				List<HomeDonor> donors = donorDAO.selectDonor(pinCode);

				if (donors != null && !donors.isEmpty()) {
					for (HomeDonor donor : donors) {
						System.out.println(donor);
				%>
				<tr>
					<td><%=donor.getDid()%></td>
					<td><%=donor.getFname()%> <%=donor.getLname()%></td>
					<td><%=donor.getHno()%>, <%=donor.getStreet()%></td>
					<td><%=donor.getZipcode()%></td>
					<td><%=donor.getDate()%></td>
					<td>
						<div class="d-block">
							<%
							if (!donor.getStatus().equals("Accepted") && !donor.getStatus().equals("Rejected")) {
							%>
							<form action="acceptStatus" method="post">
								<input type="hidden" name="donorID" value="<%=donor.getDid()%>">
								<button type="submit"
									class="btn btn-success  bi bi-check2-circle">Accept</button>
							</form>
							<br>
							<form action="rejectStatus" method="post">
								<input type="hidden" name="donorID" value="<%=donor.getDid()%>">
								<button type="submit" class="btn btn-danger bi bi-x-circle-fill">
									Reject</button>
							</form>
							<%
							} else if (donor.getStatus().equals("Accepted")) {
							%>
							<span style="font-size: 15px;" class="badge bg-success bi bi-check2-circle"> <%=donor.getStatus()%></span>
							<%
							} else {
							%>
							<span style="font-size: 15px;" class="badge bg-danger bi bi-x-circle-fill"> <%=donor.getStatus()%></span>
							<%
							}
							%>
						</div>
					</td>
				</tr>

				<%
				}
				} else {
				%>
				<tr>
					<td colspan="5">No Requests!!</td>
				</tr>
				<%
				}
				%>
			</tbody>

		</table>
	</div>

	<%-- <%@include file="common/footer.jsp"%> --%>
</body>
</html>
