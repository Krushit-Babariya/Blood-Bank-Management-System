<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<main class="p-5">
		<h1 align="center">FAQ?</h1>
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingOne">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="false" aria-controls="flush-collapseOne">
						Why should I donate blood?</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse"
					aria-labelledby="flush-headingOne"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">Donating blood saves lives. It is
						used to treat various medical conditions, including surgeries,
						trauma, cancer, and chronic illnesses. Blood donation helps
						maintain an adequate supply of blood for transfusions, ensuring
						that hospitals have enough blood to meet the needs of patients.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
						Who can donate blood?</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="flush-headingTwo"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">Generally, individuals who are in
						good health, weigh at least 110 pounds, and are over 17 years old
						(or meet the age requirement set by their country's regulations)
						can donate blood. Certain medical conditions, medications, and
						travel history may disqualify individuals from donating blood.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
						How often can I donate blood?</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					aria-labelledby="flush-headingThree"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">The frequency of blood donation
						varies depending on the blood donation center and local
						regulations. In many countries, donors can donate whole blood
						every 8 to 12 weeks.</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFour">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseFour"
						aria-expanded="false" aria-controls="flush-collapseThree">
						How can I prepare for a blood donation?</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse"
					aria-labelledby="flush-headingFour"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">Stay hydrated by drinking plenty
						of fluids (water or juice) before your donation. <br>Eat a nutritious
						meal rich in iron before donating. <br>Get a good night's sleep the
						night before your donation. <br>Avoid alcohol consumption and heavy
						meals immediately before your donation. <br>Bring a valid ID and any
						required documentation to the donation center.</div>
				</div>
			</div>
		</div>
	</main>

</body>
</html>