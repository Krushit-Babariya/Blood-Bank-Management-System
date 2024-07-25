<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="commom/css/dropDown.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
<title>Indian Red Cross</title>



<nav id="navbar"
	class="navbar navbar-expand-lg navbar-light bg-body mt-2 pl-4 p-3 mb-3 sticky-top">
	<div class="container-fluid">
		<a href="user.jsp"><img class="ml-5" alt="logo"
			src="common/images/Indian_Red_Cross.png"
			style="height: 60px; width: auto"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse m-10" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto m3-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="donationCampList.jsp">Doation camps</a></li>
				<li class="nav-item"><a class="nav-link" href="user.jsp">Donate From Home</a></li>
			</ul>
		</div>
		<a class="btn btn-danger" data-bs-toggle="offcanvas"
			href="#offcanvasExample" role="button"
			aria-controls="offcanvasExample"><i class="bi bi-person-fill"
			style="font-size: 2em; color: #fff;"></i> </a>

		<div class="offcanvas offcanvas-end" tabindex="-1"
			id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasExampleLabel">
					Hello,
					<%=session.getAttribute("name")%></h5>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<hr style="margin-bottom: 0">
			<div class="offcanvas-body">
				<div class="list-group">
					<a href="user_profile.jsp"
						class="list-group-item list-group-item-action">Profile</a> <a
						href="#" class="list-group-item list-group-item-action">Settings</a>
					<a href="#" class="list-group-item list-group-item-action">Messages</a>
					<a href="#" class="list-group-item list-group-item-action">Notifications</a>
				</div>
			</div>
			<div class="offcanvas-footer p-3" style="margin-bottom: 15px">
				<div class="d-grid gap-2">
					<a href="userLogout"><button type="button"
							class="btn btn-danger mt-3 w-100">Logout</button></a>
				</div>
			</div>
		</div>


	</div>
</nav>



