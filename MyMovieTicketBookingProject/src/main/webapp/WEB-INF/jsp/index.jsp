<%@page import="com.MyMovieTicketBookingProject.entites.Seats"%>
<%@page import="com.MyMovieTicketBookingProject.entites.User"%>
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
<title>BOOK MY MOVIE</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/album/">



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

<style type="text/css">
img {
	width: 100%;
	height: 260px;
}
</style>
<link href="css/album.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
		<a class="navbar-brand" href="#">BOOK MY MOVIE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			+<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExampleDefault">
		 <ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">
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
					aria-expanded="false"><svg xmlns="http://www.w3.org/2000/svg"
							width="26" height="26" fill="currentColor"
							class="bi bi-person-circle" viewBox="0 0 16 16">
                      <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                              <path fill-rule="evenodd"
								d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                           </svg><span class="font-weight-bold" style="text-transform: uppercase;"> ${user.firstname } ${user.lastname}</span></a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/profile">Profile</a> <a
							class="dropdown-item" href="/booking-status">Booking Ticket</a> <a
							class="dropdown-item" href="/booking-history">Booking History</a> <a
							class="dropdown-item text-danger font-weight-bold" href="/logout">Logout</a>
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

	<main role="main">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img alt=""
						src="images/wp10858403-black-panther-wakanda-forever-2022-wallpapers.jpg">

					<div class="container">
						<div class="carousel-caption text-left">
							<!-- <h1>Example headline.</h1>
            <p>Some representative placeholder content for the first slide of the carousel.</p> -->
							<p>
								<a class="btn btn-lg btn-secondary offset-md-5" href="#">Watch
									Trailer</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">

					<img alt=""
						src="images/wp7834432-zack-snyders-justice-league-poster-wallpapers.jpg">

					<div class="container">
						<div class="carousel-caption">
							<!--  <h1>Another example headline.</h1>
            <p>Some representative placeholder content for the second slide of the carousel.</p> -->
							<p>
								<a class="btn btn-lg btn-primary" href="#">Watch Trailer</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img alt="" src="images/black-adam.jpg" width="100%">

					<div class="container">
						<div class="carousel-caption text-right">
							<h1>One more for good measure</h1>
							<p>Some representative placeholder content for the third
								slide of this carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-target="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#myCarousel" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</button>
		</div>

	</main>
	<main role="main">

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row">
					<c:forEach items="${movie }" var="m">

						<div class="col-md-4">
							<div class="card mb-7 shadow-sm">
								<img alt="" src="data:image/jpg;base64,${m.image}">
								<div class="card-body">
									<h4 style="color: navy;">${m.movie_name}</h4>
									<p class="card-text font-weight-bold" style="color: graytext;">${m.description }</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<a href="view/${m.id}" class="btn btn-sm btn-outline-primary">View</a>
											<%
											
											 Seats s = new Seats();
											 if(s.getTotalSeats()!=0){
												 
												 %>
												 
												 <a type="button"
												class="btn btn-sm btn-danger">Not Booking Available</a>
												 
												 <%
												 
											 }else{
												 
												 %>
												 
												 <a type="button" href="moviebooking/${m.id}/${m.t.id}"
												class="btn btn-sm btn-outline-danger">Book now </a>
												 
												 <%
											 }
											
											%>
										</div>
										<small class="text- font-weight-bold">${m.t.name}</small>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>

	</main>

	<footer class="bg-danger text-white">
		<div class="container">
			<p class="float-right">
				<a href="#">Back to top</a>
			</p>
			<p>This template &copy; Book my movie,</p>
			<p>
				<a href="/">Visit our Twitter page</a> or read our <a
					href="../getting-started/introduction/">getting started guide</a>.
			</p>
		</div>
	</footer>

</body>
</html>