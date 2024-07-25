<html>

<title>Indian Red Cross</title>
<head>
<%@include file="common/alllinks.jsp"%>
<link rel="shortcut icon" type="image/x-icon" href="common/images/Indian_Red_Cross_Logo.ico" />
<script type="text/javascript">
	$(document).ready(
			function() {
				$.getJSON("common/js/bloodTypes.json", function(data) {
					var tableBody = $("#bloodTable tbody");

					$.each(data.bloodTypes, function(index, bloodType) {
						var donateTo = bloodType.donateTo.join(", ");
						var receiveFrom = bloodType.receiveFrom.join(", ");

						var row = "<tr>" + "<td>" + bloodType.type + "</td>"
								+ "<td>" + donateTo + "</td>" + "<td>"
								+ receiveFrom + "</td>" + "</tr>";

						tableBody.append(row);
					});
				});
			});

	$(document).ready(function() {
		$("#packedRedBloodCellsTab").click(function() {
			$("#packedRedBloodCellsContent").show();
			$("#plasmaContent, #plateletContent").hide();
		});

		$("#plasmaTab").click(function() {
			$("#plasmaContent").show();
			$("#packedRedBloodCellsContent, #plateletContent").hide();
		});

		$("#plateletTab").click(function() {
			$("#plateletContent").show();
			$("#packedRedBloodCellsContent, #plasmaContent").hide();
		});
	});
</script>

</head>

<body>

	<%@include file="common/header.jsp"%>
	<main class="p-5">
		<div class="container-fluid">
			<nav>
				<img class="img-fluid rounded mb-5" src="common/images/banner22.png">
			</nav>
		</div>
		<section class="py-lg-12 ">
			<div class="hero-img">
				<div class="container px-4 px-lg-0 ">
					<!-- Hero Section -->
					<div class="row align-items-center">
						<div class=" col-xl-5 col-md-12 py-6 py-xl-0">
							<div
								class="mb-4 text-center text-xl-start px-md-8 px-lg-19 px-xl-0">
								<!-- Caption -->
								<h1 class="display-3 fw-bold mb-3 ls-sm ">
									<span class="text-danger">Save Lives</span>, protect the
									vulnerable, and foster a healthier future for all.
								</h1>
								<div class="mt-5">
									<p>
									<div class="badge bg-light text-dark me-2">
										<i class="bi bi-star-fill text-warning me-1"></i>5.0
									</div>
									Over <span class="text-dark fw-bold">20+</span> blood donation
									camp organized
								</div>
							</div>
						</div>
						<div
							class="offset-xl-1 col-xl-6 col-md-12  d-flex justify-content-end">
							<div class="">
								<a target="_blank"><img
									src="common/images/child_with_heart2.png"
									class="img-fluid rounded-3 smooth-shadow-md"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<br><br>
		<section>

			<h1 align="center">TYPES OF DONATION</h1>
			<p align="center">
				The average human body contains about five liters of blood, which is
				made of several cellular and non-cellular components such as <b>Red
					blood cell</b>, <b>Platelet</b>, and <b>Plasma</b>.
			</p>
			<p align="center">Each type of component has its unique
				properties and can be used for different indications. The donated
				blood is separated into these components by the blood centre and one
				donated unit can save up to four lives depending on the number of
				components separated from your blood.</p>

			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-home-tab"
						data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
						role="tab" aria-controls="nav-home" aria-selected="true">Packed
						Red Blood cells</button>
					<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
						data-bs-target="#nav-profile" type="button" role="tab"
						aria-controls="nav-profile" aria-selected="false">Plasma</button>
					<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
						data-bs-target="#nav-contact" type="button" role="tab"
						aria-controls="nav-contact" aria-selected="false">Platelet</button>
				</div>
			</nav>

			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active m-3" id="nav-home"
					role="tabpanel" aria-labelledby="nav-home-tab">
					<div class="card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">What is it?</h4>
								<p class="card-text">Blood collected straight from the donor
									into a blood bag and mixed with an anticoagulant is called as
									whole blood. This collected whole blood is then centrifuged and
									red cell, platelets, and plasma are separated. The separated
									red cells are mixed with a preservative to be called packed red
									blood cells.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Who can donate?</h4>
								<p class="card-text">You need to be 18-65 years old, weight
									45kg or more, and be fit and healthy.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">User For?</h4>
								<p class="card-text">Correction of severe anemia in a number
									of conditions and blood loss in case of childbirth, surgery, or
									trauma settings.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Lasts For?</h4>
								<p class="card-text">Red cells can be stored for 42 days at
									2-6 degrees Celsius.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">How long does it take to donate?</h4>
								<p class="card-text">15-30 minutes to donate, including the
									pre-donation check-up.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">How often can I donate?</h4>
								<p class="card-text">Male donors can donate again after 90
									days and female donors can donate again after 120 days.</p>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade m-3" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
					<div class="card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">What is it?</h4>
								<p class="card-text">The straw-coloured liquid in which red
									blood cells, white blood cells, and platelets float in is
									called plasma. Contains special nutrients which can be used to
									create 18 different types of medical products to treat many
									different medical conditions.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Who can donate?</h4>
								<p class="card-text">The donation criteria are similar to
									that of red blood cells. However, for apheresis plasma
									collection, the minimum weight is 50 kgs.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">User For?</h4>
								<p class="card-text">Used for bleeding patients with
									coagulation factor deficiency such as hemophilia A and B, von
									Willebrand disease, etc. Also used in cases of blood loss due
									to trauma.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Lasts For?</h4>
								<p class="card-text">Plasma after separation, if frozen
									below -30 degrees, can be stored for up to one year.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">How long does it take?</h4>
								<p class="card-text">15-30 minutes to donate including the
									pre-donation check-up.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">How often can I donate?</h4>
								<p class="card-text">Similar to red cell donation.</p>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade m-3" id="nav-contact" role="tabpanel"
					aria-labelledby="nav-contact-tab">
					<div class="card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">What is it?</h4>
								<p class="card-text">These are cellular elements in blood
									which wedge together to help to clot and reduce bleeding.
									Always in high demand, vital for people with low platelet
									count, like hematology and cancer patients.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Who can donate?</h4>
								<p class="card-text">One can donate whole blood from which
									the blood center will separate platelets from other components.
									Criteria similar to whole blood donation apply. Alternatively,
									one can donate using apheresis equipment where only platelets
									are collected and rest components are returned back to donate.
									One needs to satisfy whole blood criteria and pre-donation
									screening which include negative infectious markers and
									platelet count >1,50,000 per microlitre of blood. Weight should
									be >50kgs.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">User For?</h4>
								<p class="card-text">Conditions with very low platelet count
									such as cancer, blood diseases, trauma, dengue etc.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Lasts For?</h4>
								<p class="card-text">Can be stored for 5 days at 20-24
									degrees Celsius.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">How does it work?</h4>
								<p class="card-text">We collect your blood, keep platelet
									and return the rest to you by apheresis donation.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">How long does it take?</h4>
								<p class="card-text">45-60 minutes to donate. 2-3 hours for
									pre-donation screening.</p>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">How often can I donate?</h4>
								<p class="card-text">Every 2 weeks but should not exceed
									more than 24 times in a year.</p>
							</div>
						</div>
					</div>
				</div>

			</div>

		</section>
		<br> <br> 
		<section>
			<img style="width: 100%; height: auto;" class="rounded" alt=""
				src="common/images/banner.png">
		</section>
		<br> <br>
		<section class="py-lg-12 ">
			<div class="hero-img">
				<div class="container px-4 px-lg-0 ">
					<!-- Hero Section -->
					<div class="row align-items-center">
						<div
							class="offset-xl-1 col-xl-6 col-md-10  d-flex justify-content-end">
							<div class="">
								<a target="_blank"><img src="common/images/OneDonation.png"
									class="img-fluid rounded-3 smooth-shadow-md"></a>
							</div>
						</div>
						<div class=" col-xl-5 col-md-12 py-6 py-xl-0">
							<div class="mt-5">
								<h3>LEARN ABOUT DONATION</h3>
								<table id="bloodTable"
									class="table table-striped table-borderless">
									<caption>Compatible Blood Type Donors</caption>
									<thead>
										<tr>
											<th scope="col">Blood Type</th>
											<th scope="col">Donate Blood To</th>
											<th scope="col">Receive Blood From</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
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