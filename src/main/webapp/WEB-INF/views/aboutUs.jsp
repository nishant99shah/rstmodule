<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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


<!-- Access the Static Resources  using spring Url  -->
<!--
<spring:url value="/css/style.css" var="myCss" />
<spring:url value="/js/custom.js" var="myJS" />

<link href="${myCss}" rel="stylesheet" />
<script src="${myJS}"></script>
-->

<!--  Access the Static Resources without using spring URL -->
<link href="/ABC_Car_Portal/css/style.css" rel="stylesheet" />
<script src="/ABC_Car_Portal/js/custom.js"></script>

</head>

<body>

	<!-- Test My JS -->
	<!-- <input type="button" class="button" onclick="sayHello();" value="Click me!">  -->

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="index"><h2>ABC<em>Cars</em></h2></a> 
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav  navbar-right">
              
              <sec:authorize access="!isAuthenticated()">
					<li class="nav-item "><a class="nav-link" href="index">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="new">Register</a></li>
					<li class="nav-item active"><a class="nav-link" href="about">About Us<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="contact">Contact Us</a></li>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
				<sec:authorize access="hasRole('Users')">
					 <li class="nav-item"><a class="nav-link" href="cars">Used Cars</a></li>
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


	<!-- First Container -->
	<div class="container-fluid aboutus">
		<div class="jumbotron">
			<h3  class="text-primary"> Buy and Sell Used Cars in India at right price. !</h3>



			<p class="lead text-primary">With Sell My Car, you get the facility of posting your car details on the website and getting the best value of car instantly. Your car deal is closed in very less time. Isn’t it hassle free and time efficient? With no expenditure, you get the best value for your car.! Happy Car Selling!!</p>

			<hr class="my-4">
			<p>Buy Used Cars in India from Sell My Car. Get Certified Second Hand Cars in India at best prices. Largest collection of pre-owned cars for sale.</p>
			<br>
			<p class="lead">
				<a class="btn btn-success btn-lg" href="new" role="button">Explore Now!</a>
			</p>
		</div>
	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
