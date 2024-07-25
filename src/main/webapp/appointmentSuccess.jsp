<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Red Cross</title>
<%@include file="common/alllinks.jsp"%>
<link rel="stylesheet" href="common/css/style.css">
<link rel="stylesheet" href="commom/css/dropDown.css">
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
</head>
<body style="font-family: 'Alata'; background-color: #e9ecef;">
	<%@include file="common/user_header.jsp"%>
	<main>
		<section>
			<div class="container mb-5">
				<div class="row justify-content-center mt-5">
					<div class="col px-0">
						<img class="rounded" alt=""
							src="common/images/nurse4.png">
					</div>
					<div class="col-lg-6">
						<div class="card shadow-sm p-4 mb-5 bg-body rounded">
							<div align="center" class="card-header bg-success m-1 p-2">
								<h3 style="color: white;">
									<span class="bi bi-check2-circle"> Request Submitted
										Successfully!</span>
								</h3>
							</div>
							<div class="card-body h-100" style="text-align: justify;">
								<h5 class="card-title text-center">#SAVE LIVES</h5>
								<p class="text-center">Your request has been successfully
									submitted to your nearby blood bank. We will notify you as soon
									as your request is accepted. We appreciate your patience.</p>
								<p class="text-center">Thank you so much for your generous
									donation! Your contribution helps save lives and makes a
									significant difference in our community.</p>
								<p class="text-center">We appreciate your kindness and
									willingness to donate blood from home. Your support means
									everything to us.</p>
								<h5 class="card-title text-center">Add more people in <b>#SAVE LIVES</b> campaign.</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>


	<%@include file="common/footer.jsp"%>

</body>
</html>