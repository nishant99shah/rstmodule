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
					<li class="nav-item active"><a class="nav-link" href="contact">Contact Us<span class="sr-only">(current)</span></a></li>
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
    </header>

	<!-- First Container -->
	<div class="container-fluid contactus" style="padding-top: 170px; padding-bottom: 50px;">
		<div class="jumbotron">

				<div class=" mt-3 row">
					<h2 class="text-center text-primary"> Contact Us</h2>
				</div>
				
				<div class="row">
					<div class="col-sm-5">
						<p>Write to us and we'll get back to you within 24 hours.</p>
						<p>
							<span class="glyphicon glyphicon-map-marker"></span> Red Fort, Mumbai
						</p>
						<p>
							<span class="glyphicon glyphicon-phone"></span> +91 9987652231
						</p>
						<p>
							<span class="glyphicon glyphicon-envelope"></span>
							help@sellmycar.com
						</p>
					</div>
					<div class="col-sm-7 slideanim">
						<div class="row">
							<div class="col-sm-6 form-group">
								<input class="form-control" id="name" name="name"
									placeholder="Name" type="text" required>
							</div>
							<div class="col-sm-6 form-group">
								<input class="form-control" id="email" name="email"
									placeholder="Email" type="email" required>
							</div>
						</div>
						<textarea class="form-control" id="comments" name="comments"
							placeholder="Comment" rows="4"></textarea>
						<br>
						<div class="row">
							<div class="col-sm-12 form-group">
								<button class="btn btn-success " type="submit">Send</button>
							</div>
						</div>
					</div>
				</div>

		</div>
	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
