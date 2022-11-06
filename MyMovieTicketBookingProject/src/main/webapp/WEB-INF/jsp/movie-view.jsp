<%@page import="com.MyMovieTicketBookingProject.entites.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BOOK MY MOVIE</title>
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
    <div class="jumbotron">
      <div class="col-sm-8 mx-auto">
        <h1 class="text-center mt-5">${movie.movie_name}</h1>
          <div class = "container">
           
           <div class="row justify-content-center">
              
               ${movie.video}
           </div>
          
          </div>
           
           <h4 class="mt-5 text-center">Description</h4>
           
           <p class="text-center font-weight-bold" style="color:fuchsia;" >${movie.description }</p>
           
            <h4 class="mt-4 text-center">Director</h4>
            <p class="text-center font-weight-bold">${movie.director}</p>
            
              <h4 class="mt-4 text-center">Cast</h4>
            <p class="text-center font-weight-bold">${movie.cast} etc...</p>
        
      </div>
    </div>
  </main>



	
		<jsp:include page="footer.jsp" />
</body>
</html>