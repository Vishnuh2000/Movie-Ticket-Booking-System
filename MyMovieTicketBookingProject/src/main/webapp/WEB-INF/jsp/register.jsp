<%@page import="com.MyMovieTicketBookingProject.entites.User"%>
<%@page import="org.springframework.ui.Model"%>
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
<title>BOOK MY MOVIE REGISTER</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/sign-in/">



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

input::placeholder {
	
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#signup-form').validate({

			rules : {

				firstname : {

					required : true,

				},

				lastname : {

					required : true,

				},

				email : {

					required : true,
					email : true,

				},

				password : {

					required : true,
					minlength : 8,

				},


			}

		});

	});
</script>
<body>

	<header>

		<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
			<a class="navbar-brand" href="/">BOOK MY MOVIE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExampleDefault"
				aria-controls="navbarsExampleDefault" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsExampleDefault">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>

				</ul>


				<%
				User user = (User) session.getAttribute("user");
				if (user != null) {
				%>

				<ul class="navbar-nav" style="margin-right: 100px">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						aria-expanded="false"><i class="fas fa-user"></i>${user.firstname }
							${user.lastname}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Profile</a> <a
								class="dropdown-item" href="#">Booking Ticket</a> <a
								class="dropdown-item" href="#">Booking History</a> <a
								class="dropdown-item" href="/logout">Logout</a>
						</div></li>
				</ul>

				<%
				} else {
				%>

				<a href="/login" class="btn btn-outline-primary"
					style="margin-right: 100px">Sign in</a>

				<%
				}
				%>

			</div>
		</nav>

	</header>
	<!-- Section: Design Block -->
	<section class="">
		<!-- Jumbotron -->
		<div class="px-4 py-5 px-md-5 text-center text-lg-start"
			style="background-color: hsl(0, 0%, 96%)">
			<div class="container mt-5">
				<div class="row justify-content-center">

					<div class="col-lg-6 mb-5 mb-lg-0">
						<div class="card">
							<div class="card-body py-5 px-md-5">
								<form action="/save" method="post" id="signup-form">
									<h3>Please Sign up</h3>
									<div class="row mt-5">
										<div class="col-md-6 mb-4">
											<div class="form-outline">
												<label class="form-label" for="form3Example1">First
													name</label> <input type="text" name="firstname"
													class="form-control" placeholder="Firstname"
													id="first_name" />
											</div>
										</div>
										<div class="col-md-6 mb-4">
											<div class="form-outline">
												<label class="form-label" for="form3Example2">Last
													name</label> <input type="text" name="lastname"
													class="form-control" placeholder="Lastname" />
											</div>
										</div>
									</div>

									<!-- Email input -->
									<div class="form-outline mb-4">
										<label class="form-label" for="form3Example3">Email
											address</label> <input type="email" name="email" class="form-control"
											placeholder="Email address" /> <small
											id="emailHelp" class="form-text text-danger font-weight-bold">${errorMessage }</small>
									</div>

									<!-- Password input -->
									<div class="form-outline mb-4">
										<label class="form-label" for="form3Example4">Password</label>
										<input type="password" name="password" class="form-control"
											placeholder="Password" />
									</div>

									<!-- Checkbox -->
									<div class="form-check d-flex justify-content-center mb-4">

									</div>

									<!-- Submit button -->
									<button type="submit" class="btn btn-primary btn-block mb-4">
										Sign up</button>

									<!-- Register buttons -->
									<div class="text-center">
										<p>
											Already have an account ? <a href="/login">Sign in</a>
										</p>

									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Jumbotron -->
	</section>
	<!-- Section: Design Block -->
	<footer class="bg-danger">

		<jsp:include page="footer.jsp" />

	</footer>
</body>
</html>