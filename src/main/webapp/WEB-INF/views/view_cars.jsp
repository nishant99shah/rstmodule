<%@ page contentType="text/html; charset=US-ASCII"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
		<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!--  Access the Static Resources without using spring URL -->
<link href="/ABC_Car_Portal/css/style.css" rel="stylesheet" />


</head>

<body>

<header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
        
          <a class="navbar-brand" href="index"><h2>ABC<em>Cars</em></h2></a>

          
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav  navbar-right">
              
              <sec:authorize access="!isAuthenticated()">
					<li class="nav-item "><a class="nav-link" href="index">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="new">Register</a></li>
					<li class="nav-item"><a class="nav-link" href="about">About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="contact">Contact Us</a></li>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
				<sec:authorize access="hasRole('Users')">
					 <li class="nav-item active"><a class="nav-link" href="cars">Used Cars<span class="sr-only">(current)</span></a></li>
					 <li class="nav-item"><a class="nav-link" href="new_car">Sell Your Car</a></li>
				</sec:authorize>
				
				<sec:authorize access="hasRole('Administrator')">
					 <li class="nav-item"><a class="nav-link" href="cars">Car Management </a></li>
					 <li class="nav-item"><a class="nav-link" href="users">User Management</a></li>				 
				</sec:authorize>
              	
              	<!-- /logout must be a POST request, as csrf is enabled.
			        This ensures that log out requires a CSRF token and that a malicious user cannot forcibly log out your users.-->
					
					<li class="nav-item">
					<form action="logout" method="post" style="padding:7px;">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
							<input type="submit"
							name="Logout" value="Logout" class="btn btn-success"></input>
					</form>
					</li>
				</sec:authorize>
				
            </ul>
          </div>
        </div>
      </nav>
    </header>

	<!-- First Container -->
	<div class="container-fluid bg-1" style="padding-top: 200px; padding-bottom: 100px;">
		<div>
			<h2 class="text-center text-primary">Car List</h2>

			<c:if test="${not empty error_message}">
				<p>${error_message}</p>
			</c:if>

			<c:if test="${empty cars}">
				<sec:authorize access="hasRole('Administrator')">
					<span> No Cars are added yet. </span>
				</sec:authorize>
				<sec:authorize access="hasRole('Users')">
					<span> Please click on Add button to add Cars to the system.
					</span>
				</sec:authorize>
			</c:if>


			<!--  All Car Lists  -->
			
			<div class="row">
				<div class="col-md-12">
				
				<sec:authorize access="hasRole('Users')">
					<a href="new_car">
						<button class=" btn btn-success">Post A Car For Sale</button>
					</a>	
				</sec:authorize>

				<c:url var="get_search_url" value="search"/>
				<form action="${get_search_url}" id="myform" method="get" class="form-inline text-right" style="padding:20px;">

						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" value="" name="keyword" />

						<input type="submit" value="Search" class="btn btn-success"/>

					</form>

				</div>
			</div>






			<div class="row">

				<div class="col-md-12">
				
					<c:if test="${not empty cars}">
					
					<table class="table table-striped table-bordered table-hover">

						<thead>
							<tr>
								<th class="text-center text-primary">No.</th>
								<th class="text-center text-primary">Car ID</th>
								<th class="text-center text-primary">Car Make</th>
								<th class="text-center text-primary">Model</th>
								<th class="text-center text-primary">Reg No.</th>
								<th class="text-center text-primary">Price</th>
								<th class="text-center text-primary">Actions</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="car" items="${cars}">
						
							<tr>
								<td class="text-center text-dark"><%=i %></td>
								<td class="text-center text-dark"> ${car.id}</td>
								<td class="text-center text-dark"> ${car.make}</td>
								<td class="text-center text-dark"> ${car.model}</td>
								<td class="text-center text-dark"> ${car.registeration}</td>
								<td class="text-center text-dark"> ${car.price} </td>

								<td class="text-center">
								
								<sec:authorize access="hasRole('Administrator')">
									<a href="edit?id=${car.id}">
										<button class=" btn btn-success">Update</button>
									</a>
									
								</sec:authorize>
								
								<a href="car_detail?id=${car.id}">
									<button class="btn btn-success">View </button>
									</a>
								
								<sec:authorize access="hasRole('Administrator')">
									
									<a href="delete?id=${car.id}">
										<button class="btn btn-danger">Delete</button>
									</a>
								</sec:authorize>
								
									
								</td>
							</tr>
							<% i++; %>
						</c:forEach>

						</tbody>
					</table>
					
					</c:if>
					
				</div>
			</div>
			
			<!--  End Car Lists  -->

		</div>
	</div>


	<%@ include file="footer.jsp"%>
	</body>
	</html>