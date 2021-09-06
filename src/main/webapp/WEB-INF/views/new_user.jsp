<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
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
					<li class="nav-item active"><a class="nav-link" href="new">Register<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="about">About Us</a></li>
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
    </header>
	<!-- First Container -->
	<div class="container-fluid bg-1 text-center" style="padding-top: 200px; padding-bottom: 100px;">
		<h3 class="margin text-primary">Register Here ! </h3>

		<div class="row">

			<div class="col-md-4"></div>

			<div class="col-md-4">


				<c:if test="${register_success != null}">
					<div class="alert alert-success">
						<p>${register_success} Click <a href="login"> Sign In</a> to login to Your dash board...</p>
					</div>
				</c:if>

			<form:form action="save" method="post" modelAttribute="user">
				<div class="form-group">
					<label class="text-primary" for="username">Full Name :</label>
					<form:input path="name" class="form-control" required="true"/>
				</div>
				
				<div class="form-group">
					<label class="text-primary" for="username">User Name :</label>
					<form:input path="userName" class="form-control" required="true"/>
					
				</div>
				
				
				<div class="form-group">
					<label class="text-primary" for="password">Password :</label>
					<form:password path="password" class="form-control" required="true"/>
					
				</div>
				
				<input type="submit" value="Register" class="btn btn-success"/>
					
			</form:form>

			</div>


			<div class="col-md-4"></div>

		</div>

	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
