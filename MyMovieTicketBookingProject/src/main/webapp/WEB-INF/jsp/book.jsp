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


<style type="text/css">

img{
	width: 100%;
	height: 650px;
}
</style>
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
	
		$('#timeDropdownBox').change(function(){
			
			var timeId = $(this).val();
			//alert(timeId);
			$('#seatIdInput').val(timeId);
			
			$('#ticket').mouseup(function(){
				
				 var price = parseInt($('#timeDropdownBox option:selected').text());
				 var q = $(this).val();
				 var totalAmount = price * q;
				 $('#total').val(totalAmount);
				
			});
			 
			
		});
	
			
		});
	</script>
	
</head>

<body style="background: gray;">

	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
		<a class="navbar-brand" href="/" style="font-family: sans-serif;">BOOK MY MOVIE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			+<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="sr-only">(current)</span>
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
                           </svg><span class="font-weight-bold"
						style="text-transform: uppercase;"> ${user.firstname }
							${user.lastname}</span></a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Profile</a> <a
							class="dropdown-item" href="#">Booking Ticket</a> <a
							class="dropdown-item" href="#">Booking History</a> <a
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
     

    <div class="container">
    
       <div class="row"> 
       
       

<div class="container" style="margin-top: 100px; margin-bottom: 100px">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title">Book now</h3>
 
           <form action="/saveBookingItem" method="post">
           
                <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6">
                    <div class="white-box text-center"><img src="data:image/jpg;base64,${movie.image}" class="img-responsive"></div>
                </div>
                     <input type="hidden" name="movie" value="${movie.id }">
                     <input type="hidden" name="theater" value="${movie.t.id }">
                     <input type="hidden" name="user" value="${user.id}">
                    
                <div class="col-lg-7 col-md-7 col-sm-6">
                    <h4 class="box-title mt-5"><span class="text-secondary">Movie name</span> : ${movie.movie_name }</h4>
         			<h4 class="box-title "><span class="text-secondary">Theater name</span> : ${movie.t.name }</h4>
         			<h4 class="box-title "><span class="text-secondary">Screen name</span> : ${movie.t.screen }</h4>
                    <h4>
                        Select date
                    </h4>
                    <div class="col-sm-6 mb-4">
                       <input type="date" name="date" class="form-control">
                    </div>
                    
                    <h4 class="text-secondary mt-3 ml-3">
                        Select Time schedule
                    </h4>
             
                   <div class="col-sm-6 mb-4">
                       <select name="time" class="form-control">
                       
                         <c:forEach items="${timepick }" var="t">
                         
                           <option value="${t.id }">${t.showName} ${t.showTime }</option>
                         
                         </c:forEach>
                       
                       </select>
                    </div>
                    
                    <h4 class="text-secondary mt-3 ml-3">
                        Select Price 
                    </h4>
                    <div class="col-sm-6 mb-4">
                       <select name="seat" class="form-control" id="timeDropdownBox">
                       
                         <c:forEach items="${seat }" var="s">
                         
                           <option value="${s.id }">${s.cost}</option>
                         
                         </c:forEach>
                       
                       </select>
                    </div>
                    
                    <div class="col-sm-6 ">
                       <input type="hidden" name="seat" id="seatIdInput">
                    </div>
                    
                    <h4 class="text-secondary mt-3 ml-3">
                        Enter not of ticket 
                    </h4><span class="text-mute ml-3">(you can enter only 5 tickets)</span>
                    <div class="col-sm-6 mb-4">
                      <input type="number" min="1" max="6" name="ticket" class="form-control" id="ticket" onchange="return ticketCount()">
                    </div>
                    
                    <h4 class="text-secondary mt-3 ml-3">
                        Total Amount
                    </h4>
                    <div class="col-sm-6 mb-4">
                      <input type="text" name="totalAmount" class="form-control" id="total">
                    </div>
                    
                    <button class="btn btn-primary ml-3">Buy Now</button>
                    <h3 class="box-title mt-5"></h3>
                </div>
            </div>
           
           </form>
        </div>
    </div>
</div>
       
       </div>
    
    </div>


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

<script type="text/javascript">


function ticketCount() {
	
	var num = document.getElementById("ticket").value;
	
	if(num>=5){
		
		alert("you can only select 5 ticket");
		
	}
	
	
}

</script>

</body>
</html>