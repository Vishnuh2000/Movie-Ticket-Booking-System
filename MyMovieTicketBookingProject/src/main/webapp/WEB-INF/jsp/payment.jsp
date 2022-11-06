<%@page import="com.MyMovieTicketBookingProject.entites.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Checkout example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/checkout/">

    

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

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
    
  </head>
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
  <body class="bg-light">
    
<div class="container">
  <div class="py-5 text-center">
    <h2 class="mt-5">Payment form</h2>
  </div>

  <div class="row justify-content-center">

    <div class="col-md-8 order-md-1">

      <form action="/paymentSave" method="post" class="needs-validation" novalidate>
        
        <input type="hidden" name="book" value="${book.id }">
        <input type="hidden" name="user" value="${user.id }">
        <h4 class="mb-3">Payment</h4>
        <span class="alert alert-success font-weight-bold">Total Amount : ${book.totalAmount }rs/-</span>
        <div class="d-block my-3">
          <div class="custom-control custom-radio">
            <input id="credit" name="paymentType" type="radio" class="custom-control-input" value="credit card" checked required>
            <label class="custom-control-label" for="credit" >Credit card</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="debit" name="paymentType" type="radio" class="custom-control-input" value="debit card" required>
            <label class="custom-control-label" for="debit">Debit card</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="paypal" name="paymentType" type="radio" class="custom-control-input" value="paypal" required>
            <label class="custom-control-label" for="paypal">PayPal</label>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="cc-name">Name on card</label>
            <input type="text" class="form-control" id="cc-name" placeholder="" required>
            <small class="text-muted">Full name as displayed on card</small>
            <div class="invalid-feedback">
              Name on card is required
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="cc-number">Credit card number</label>
            <input type="text" class="form-control" id="cc-number" placeholder="" required>
            <div class="invalid-feedback">
              Credit card number is required
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 mb-3">
            <label for="cc-expiration">Expiration</label>
            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
            <div class="invalid-feedback">
              Expiration date required
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="cc-cvv">CVV</label>
            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
            <div class="invalid-feedback">
              Security code required
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" type="submit">submit</button>
      </form>
    </div>
  </div>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2022 BOOK MY MOVIE</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>


    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

      
        <script src="form-validation.js"></script>
  </body>
</html>
    