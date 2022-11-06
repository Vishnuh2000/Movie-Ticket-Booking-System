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
		<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="/admin">BOOK MY MOVIE
			</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-toggle="collapse" data-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="/logout">Sign
					out</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="sidebar-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="#">
								<span data-feather="home"></span> Dashboard <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/movielist"> <span
								data-feather="file"></span> Add movies
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/theater-list"> <span
								data-feather="users"></span> Add theater
						</a></li>
						
						<li class="nav-item"><a class="nav-link" href="/seats"> <span
								data-feather="users"></span> Add theater seats
						</a></li>
					</ul>
				</div>

			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 border-bottom">
					<h1 class="h2">Admin Dashboard</h1>

				</div>

								<h4 class="ml-5 ">Add Show seats</h4>
				<div>
					<div class="container">

						<div class="row">

							<div class="col-sm-8 col-md-5">

								<form action="../saveseats" method="post">

									<input type="hidden" name="th" value="${th.id}">
									<div class="form-group">

										<label>Name</label> <input type="text" value="${th.name }"
											readonly="readonly" class="form-control" required="required"
											autofocus="autofocus">

									</div>

									<div class="form-group">

										<label>Screen</label> <input type="text" value="${th.screen }"
											readonly="readonly" class="form-control" required="required"
											autofocus="autofocus">

									</div>

									<div class="form-group">

										<label>Category</label> <input type="text" name="category"
											class="form-control" required="required"
											autofocus="autofocus">

									</div>


									<div class="form-group">

										<label>Cost</label> <input type="tel" name="cost"
											class="form-control" required="required"
											autofocus="autofocus">

									</div>
									
									<div class="form-group">

										<label>Total Seats</label> <input type="tel" name="totalSeats"
											class="form-control" required="required"
											autofocus="autofocus">

									</div>

									<div class="form-group">

										<button type="submit" class="btn btn-danger">Submit</button>

									</div>

								</form>

							</div>

						</div>
						<div class="container">
						
						<div>
							<table class="table table-striped table-bordered mt-2" style="margin-right: 10px">
								<thead>
									<tr class="text-center">
										<th>Srno</th>
										<th>Theater name</th>
										<th>Screen</th>
										<th>Category</th>
										<th>Cost</th>
										<th>Total seats</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${seat}" var="s" varStatus="count">

										<tr class="text-center">
											<td>${count.index+1}</td>
											<td>${s.th.name}</td>
											<td>${s.th.screen}</td>
											<td>${s.category}</td>
											<td>${s.cost}</td>
											<td>${s.totalSeats}</td>

											<td>
											
												<a href="../delete/seat/${s.id }" class="btn btn-danger badge" onclick="return confirm('are you sure')">Delete</a>

											</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						</div>
						</div>
					</div>
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