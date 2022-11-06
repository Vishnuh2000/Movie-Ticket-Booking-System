<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>ADMIN DASHBOARD</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/dashboard/">



<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">



<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
</head>
<body>

	<nav
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="/">BOOK
			MY MOVIE </a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-toggle="collapse" data-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">Sign
					out</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="sidebar-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="/profile">
								<span data-feather="home"></span> Dashboard <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/profile">
								<span data-feather="file"></span> My profile
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/booking-status">
								<span data-feather="users"></span> New Booking
						</a></li>

						<li class="nav-item"><a class="nav-link" href="/booking-history"> <span
								data-feather="users"></span> Booking History
						</a></li>
					</ul>
				</div>

			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 border-bottom">
					<h1 class="h2">User Dashboard</h1>

				</div>

				<h4 class="mt-5" style="font-family: monospace;">New Booking</h4>
				<div>
					<c:forEach items="${book }" var="b">
					
					<div class="card mb-3" style="max-width: 600px;">
						<div class="row no-gutters">
							<div class="col-md-4">
								<img src="data:image/jpg;base64,${b.movie.image}" alt="..." width="200px">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title ">${b.movie.movie_name}</h5>
									<p class="card-text">
									 <span class="font-weight-bold">Ticket ID : </span>
									 <span class="text-danger font-weight-bold">${b.id}</span><br>
									 <span class="font-weight-bold">Name : </span>
									 <span>${b.user.firstname } ${b.user.lastname }</span><br>
									 <span class="font-weight-bold">Email : </span>${b.user.email}<br>
									 <span class="font-weight-bold">Theater name & screen : </span>${b.theater.name} ${b.theater.screen}<br>
									 <span class="font-weight-bold">Selected show & time : </span>${b.time.showName} ${b.time.showTime}<br>
									 <span class="font-weight-bold">Selected date : </span>${b.date}<br>
									 <span class="font-weight-bold">No of ticket : </span>${b.ticket}
									  <%-- <h6>Payment Details</h6>
									   <span class="font-weight-bold">Payment type : </span>${pay.paymentType}<br>
									   <span class="font-weight-bold">Toal Amount : </span><br> --%>
									</p>
									<p class="card-text">
										<small class="text-muted">This booking expired after three and half hours</small>
									</p>
								</div>
							</div>
						</div>
					</div>
					
					</c:forEach>
				</div>
			</main>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
	<script src="css/dashboard.js"></script>
</html>