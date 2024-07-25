

<style>
.row {
	margin: 0 !important;
}

.col, .col-lg-6 {
	padding: 0 !important;
}

img.h-100 {
	object-fit: cover;
}

.card {
	height: 100%;
}
</style>

<section class="m-5 py-lg-12 ">
	<div class="hero-img">
		<div class="container px-4 px-lg-0 ">
			<div class="row align-items-center">
				<div class="col-xl-5 col-md-12 py-6 py-xl-0">
					<!-- First Card: Donate Blood Now -->
					<div class="card shadow-sm p-2 mb-5 bg-body rounded">
						<div class="card-body text-center">
							<h5 class="card-title">Donate Blood From Home</h5>
							<p class="card-text">Donate Blood from home just book your
								slot</p>
							<a href="#dropCounts" class="btn btn-danger"><i
								class="bi bi-heart"></i> Donate Now</a>
						</div>
					</div>

					<!-- Second Card: Book Appointment -->
					<div class="card sshadow-sm p-2 mb-5 bg-body rounded">
						<div class="card-body text-center">
							<h5 class="card-title">Book Appointment</h5>
							<p class="card-text">Body Checkup</p>
							<a href="#" class="btn btn-danger"><i class="bi bi-calendar"></i>
								Book Now</a>
						</div>
					</div>
				</div>

				<div
					class="offset-xl-1 col-xl-6 col-md-12  d-flex justify-content-end">
					<div class="">
						<a target="_blank"><img src="common/images/nurse2.jpeg"
							class="img-fluid rounded-3 smooth-shadow-md"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="dropCounts">
	<div class="hero-img mb-5">
		<div class="container px-lg-0">
			<img src="common/images/dropCounts.png"
				class="img-fluid rounded-3 smooth-shadow-md w-100">
		</div>
	</div>
</section>

<section>
	<div class="container mb-5">
		<div class="row justify-content-center mt-5">
			<div class="col px-0">
				<img class="h-100 rounded-start" alt=""
					src="common/images/atHome.png">
			</div>
			<div class="col-lg-6">
				<div class="card shadow-sm p-4 bg-body rounded">
					<div class="card-body h-100">
						<h5 class="card-title text-center">Book Blood Donation
							Appointment</h5>
						<form action="bookAppointment" onsubmit="return validateForm()">
							<div class="mb-4">
								<label for="houseNo" class="form-label">House No.</label> <input
									name="houseno" type="text" class="form-control" id="houseNo"
									placeholder="Enter Your House Number" required>
							</div>
							<div class="mb-4">
								<label for="street" class="form-label">Street</label> <input
									name="street" type="text" class="form-control" id="street"
									placeholder="Enter Your Street Name" required>
							</div>
							<div class="mb-4">
								<label for="area" class="form-label">Area</label> <input
									name="area" type="text" class="form-control" id="area"
									placeholder="Enter Your Area Name" required>
							</div>
							<div class="mb-4">
								<label for="pinCode" class="form-label">Pin Code</label> <input
									name="pincode" type="text" class="form-control" id="pinCode"
									placeholder="Enter Your Pin Code" required>
							</div>
							<div class="mb-5">
								<label for="appointmentDate" class="form-label">Appointment
									Date</label> <input name="appointmentDate" type="date"
									class="form-control" id="appointmentDate" required>
							</div>
							<div class="text-center">
								<button data-bs-target="#success" data-bs-toggle="modal"
									type="submit" class="btn btn-danger w-100">Book
									Appointment</button>
							</div><br>
							<div class="text-center" style="color: red;">
								<p>*Make sure that you are above 17 and your weight above 117 pound or 50 kg</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>