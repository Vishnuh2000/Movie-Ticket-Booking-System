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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	let editStatus = false;
	
	$('#edit-button').click(function(){
		
		if(editStatus == false){
			
			$('#profile-details').hide();
			$('#profile-edit').show();
			
			editStatus = true;
		}else{
			
			$('#profile-details').show();
			$('#profile-edit').hide();
			
			editStatus = false;
			
		}
		
	});
	
});


</script>
</head>
<body>

	<nav
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="/">
			BOOK MY MOVIE </a>
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
						<li class="nav-item"><a class="nav-link active" href="/profile">
								<span data-feather="home"></span> Dashboard <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/profile">
								<span data-feather="file"></span> My Profile
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

				<h4 class="mt-5 ml-4" style="font-family: monospace;">My Profile</h4>
				<div class="container">
					<div class="row">

						

							<div class="col-lg-7" id="profile-details">
								<div class="card mb-4">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-3">
												<p class="mb-0">First name</p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-0">${user.firstname }</p>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-sm-3">
												<p class="mb-0">Last name</p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-0">${user.lastname }</p>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-sm-3">
												<p class="mb-0">Email</p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-0">${user.email }</p>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-sm-3">
												<p class="mb-0">Password</p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-0">${user.password }</p>
											</div>
										</div>
										<hr>
										<div class="row">
											
											<button id="edit-button" class="btn btn-success mt-2 btn-sm offset-md-4">Edit Profile</button>
										</div>
									</div>
								</div>

							</div>
							

						  
						  
						   	<div class="col-lg-7" id="profile-edit" style="display: none;">
								
								
								<form action="/updateProfileDetails" method="post">
								
								<div class="card mb-4">
									<div class="card-body">
										<h5 class="text-center mb-4">Edit your profile</h5>
										<div class="row">
											<div class="col-sm-3">
												<p class="mb-0">First name</p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-0"><input type="text" name="firstname" class="form-control" value="${user.firstname }"></p>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-sm-3">
												<p class="mb-0">Last name</p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-0"><input type="text" name="lastname" class="form-control" value="${user.lastname }"></p>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-sm-3">
												<p class="mb-0">Email</p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-0"><input type="text" name="email" class="form-control" value="${user.email }"></p>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-sm-3">
												<p class="mb-0">Password</p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-0"><input type="text" name="password" class="form-control" value="${user.password }"></p>
											</div>
										</div>
										<hr>
										<div class="row">
											
											<button class="btn btn-success mt-2 btn-sm offset-md-4" href="#">Edit Profile</button>
										</div>
									</div>
								</div>
								
								</form>

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
	</body>
</html>