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

<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>

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
						<li class="nav-item"><a class="nav-link active" href="/admin">
								<span data-feather="home"></span> Dashboard <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="movielist">
								<span data-feather="file"></span> Add movies
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/theater-list">
								<span data-feather="users"></span> Add theater
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

				<h2 class="ml-5 ">Add Movies</h2>
				<div>
					<div class="container ml-5">

						<div class="row">

							<div class="col-sm-8 col-md-5">

								<form action="/savemovies" method="post"
									enctype="multipart/form-data">
                                          
               
									<div class="form-group">
									    <label>Select Theater & screen</label>
										<select name="t" id="ddlCountryAdd" class="form-control">
										
										 <c:forEach items="${theater }" var="th">
										   
										   <option value="${th.id }">${th.name } ${th.screen}</option>
										 
										 </c:forEach>
										
										</select>
													
									</div>
									

									<div class="form-group">

										<label>Movie Name</label> <input type="text" name="movie_name"
											class="form-control" required="required"
											autofocus="autofocus">

									</div>

									<div class="form-group">

										<label>Director</label> <input type="text" name="director"
											class="form-control" required="required"
											autofocus="autofocus">

									</div>

									<div class="form-group">

										<label>Cast</label> <input type="text" name="cast"
											class="form-control" required="required"
											autofocus="autofocus">

									</div>

									<div class="form-group">

										<label>Description</label>
										<textarea rows="5" cols="" class="form-control"
											name="description" required="required" autofocus="autofocus">
					                 
					                 
					                 </textarea>

									</div>

									<div class="form-group">

										<label>Link</label> <input type="text" name="video"
											class="form-control" required="required"
											autofocus="autofocus">

									</div>

									<div class="form-group">

										<label>Image</label> <input type="file" name="file"
											accept="jpg" class="form-control" required="required">

									</div>
									
									<div class="form-group">

										<label>Start date</label> <input type="date" name="start_date"
											 class="form-control" required="required">

									</div>
										
											
									<div class="form-group">

										<label>End Date</label> <input type="date" name="end_date"
											 class="form-control" required="required">

									</div>					

									<div class="form-group">

										<button type="submit" class="btn btn-danger">Submit</button>

									</div>

								</form>

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