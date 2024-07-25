<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.port.model.BloodBank,com.port.model.Camp, com.port.dao.BloodBankDAOimpl, com.port.db.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Red Cross</title>
<%@include file="common/alllinks.jsp"%>
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
</head>
<body>
	<%@include file="common/header.jsp"%>

	<div class="container">
		<%-- <h1 class="mt-4 mb-4">All Donation Camps</h1>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Blood Bank ID</th>
					<th scope="col">Blood Bank Name</th>
					<th scope="col">Camp Name</th>
					<th scope="col">Location</th>
					<th scope="col">Pincode</th>
					<th scope="col">Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				BloodBankDAOimpl dao = new BloodBankDAOimpl(DBConnection.getConn());
				List<Camp> camps = dao.getAllCamps();
				for (Camp camp : camps) {
				%>
				<tr>
					<td><%=camp.getBID()%></td>
					<td><%=camp.getBNAME()%></td>
					<td><%=camp.getCNAME()%></td>
					<td><%=camp.getLANDMARK()%>&nbsp;<%=camp.getAREA()%></td>
					<td><%=camp.getPINCODE()%></td>
					<td><%=camp.getDATE()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table> --%>

		<h1 class="mt-4 mb-4">All Donation Camps</h1>
		<div class="row">
			<%
			BloodBankDAOimpl dao = new BloodBankDAOimpl(DBConnection.getConn());
			List<Camp> camps = dao.getAllCamps();
			for (Camp camp : camps) {
			%>
			<div class="col-md-4 mb-4">
				<div class="card">
					<div class="card-header">Camp Details</div>
					<div class="card-body">
						<h5 class="card-title">
							Blood Bank ID:
							<%=camp.getBID()%></h5>
						<p class="card-text">
							Blood Bank Name:
							<%=camp.getBNAME()%></p>
						<p class="card-text">
							Camp Name:
							<%=camp.getCNAME()%></p>
						<p class="card-text">
							Location:
							<%=camp.getLANDMARK()%>,
							<%=camp.getAREA()%></p>
						<p class="card-text">
							Pincode:
							<%=camp.getPINCODE()%></p>
						<p class="card-text">
							Date:
							<%=camp.getDATE()%></p>
						<p class="card-text">
							Phone No:
							<%=camp.getPHONENO()%></p>
						<p class="card-text">
							Email:
							<%=camp.getEMAIL()%></p>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

	</div>

	<%-- <%@include file="common/footer.jsp"%> --%>

</body>
</html>
