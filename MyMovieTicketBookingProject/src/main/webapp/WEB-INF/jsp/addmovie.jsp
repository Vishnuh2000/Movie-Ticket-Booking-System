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

 <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<body>

	<nav
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="/">BOOK MY MOVIE
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
						<li class="nav-item"><a class="nav-link active" href="/admin">
								<span data-feather="home"></span> Dashboard <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="movielist"> <span
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
					<h1 class="h2">Dashboard</h1>

				</div>

				<h2 class="">Movie List</h2>
				<div> 
				    <div class="col">
				    
				    <form class="form-inline">
				    
				        <a href="/addmovies" class="btn btn-primary my-2 my-sm-0">Add</a>
				        <input class="form-control mr-sm-2 offset-md-4" name="myInput" type="search" placeholder="search...">
				    
				    </form>
				    
				    </div>
					<table class="table table-striped table-bordered mt-2 ">
						<thead>
							<tr class="text-center">
								<th>Srno</th>
								<th>Image</th>
								<th>Theater Name & Screen</th>
								<th>Movie Details</th>
								<th>Tailer Link</th>
								<th>Date</th>
								<th>Action</th>					
							</tr>
						</thead>
						<tbody id="#myTable">
							<c:forEach items="${movie}" var="m" varStatus="count">

								<tr class="text-center">
									<td>${count.index+1}</td>
									<td>
									
									  <img alt="" src="data:image/jpg;base64,${m.image}" width="90px">
									
									</td>
									<td>${m.t.name } ${m.t.screen }</td>
									<td>
									<span>Movie Name : ${m.movie_name }</span>
									${m.director }
									${m.cast }
									</td>
			
									<td>
									  <c:out value="${m.video }"/>
									</td>
									<td>
									
									  <span>Start date : ${m.start_date }</span>
									  <span>End date : ${m.end_date }</span>
									 
									</td>
									<td>
									<a href="edit-movie/${m.id }" class="btn btn-primary badge">Edit</a>
									<a href="delete/${m.id}" class="btn btn-danger badge" onclick="return confirrm('Are you sure')">Delete</a>
									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>

 <script type="text/javascript">
 
 
 </script>
</body>	
</html>