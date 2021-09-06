<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Portal</title>
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
<script src="/ABC_Car_Portal/js/custom.js"></script>

</head>
<body>
<header class="">
      <nav class="navbar navbar-expand-lg" style="background: rgba(250,250,250,0.1);">
        <div class="container">
        
          <a class="navbar-brand" href="index"><h2>ABC<em>Cars</em></h2></a>

          
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav  navbar-right">
              
              <sec:authorize access="!isAuthenticated()">
					<li class="nav-item active"><a class="nav-link" href="index">Home<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="new">Register</a></li>
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

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="main-banner header-text" id="top">
        <div class="Modern-Slider">
          <!-- Item -->
          <div class="item item-1">
            <div class="img-fill">
                <div class="text-content">
                  <h6>Don't dream it. Drive it!</h6>
                  <h4>Let Us Find<br>What You're Looking For.</h4>
                  <p style="font-size: 16px; font-weight: bold;">We offer high quality vehicles at unbelievable prices & creates pleasant buying experience.</p>
                  <a href="cars.html" class="filled-button">Cars</a>
                </div>
            </div>
          </div>
          <!-- // Item -->
         
        </div>
    </div>
    <!-- Banner Ends Here -->

    <div class="request-form">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ">
            <h4>Request a call back right now ?</h4>
            
          </div>
          <div class="col-md-4">
            <a href="contact.html" class="border-button">Contact Us</a>
          </div>
        </div>
      </div>
    </div>

    <div class="services mt-auto">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>Featured <em>Cars</em></h2>
              <span>Aliquam id urna imperdiet libero mollis hendrerit</span>
            </div>
          </div>
          <div class="col-md-4">
            <div class="service-item">
              <img src="/ABC_Car_Portal/images/product-1-720x480.jpg" alt="">
              <div class="down-content">
                <h4>Lorem ipsum dolor sit amet</h4>
                <div style="margin-bottom:10px;">
                  
                </div>

                <p>
                  <i class="fa fa-dashboard"></i> 130 000km &nbsp;&nbsp;&nbsp;
                  <i class="fa fa-cube"></i> 1800 cc &nbsp;&nbsp;&nbsp;
                  <i class="fa fa-cog"></i> Manual &nbsp;&nbsp;&nbsp;
                </p>
                <a href="new" class="filled-button">View More</a>
              </div>
            </div>
            
            <br>
          </div>
          <div class="col-md-4">
            <div class="service-item">
              <img src="/ABC_Car_Portal/images/product-2-720x480.jpg" alt="">
              <div class="down-content">
                <h4>Lorem ipsum dolor sit amet</h4>
                <div style="margin-bottom:10px;">
                  
                </div>

                <p>
                  <i class="fa fa-dashboard"></i> 130 000km &nbsp;&nbsp;&nbsp;
                  <i class="fa fa-cube"></i> 1800 cc &nbsp;&nbsp;&nbsp;
                  <i class="fa fa-cog"></i> Manual &nbsp;&nbsp;&nbsp;
                </p>
                <a href="new" class="filled-button">View More</a>
              </div>
            </div>

            <br>
          </div>
          <div class="col-md-4">
            <div class="service-item">
              <img src="/ABC_Car_Portal/images/product-3-720x480.jpg" alt="">
              <div class="down-content">
                <h4>Lorem ipsum dolor sit amet</h4>
                <div style="margin-bottom:10px;">
                  
                </div>

                <p>
                  <i class="fa fa-dashboard"></i> 130 000km &nbsp;&nbsp;&nbsp;
                  <i class="fa fa-cube"></i> 1800 cc &nbsp;&nbsp;&nbsp;
                  <i class="fa fa-cog"></i> Manual &nbsp;&nbsp;&nbsp;
                </p>
                <a href="new" class="filled-button">View More</a>
              </div>
            </div>

            <br>
          </div>
        </div>
      </div>
    </div>

    <div class="fun-facts">
      <div class="container">
        <div class="more-info-content">
          <div class="row">
            <div class="col-md-6">
              <div class="left-image">
                <img src="/ABC_Car_Portal/images/about-1-570x350.jpg" class="img-fluid" alt="">
              </div>
            </div>
            <div class="col-md-6 align-self-center">
              <div class="right-content">
                <span>Who we are</span>
                <h2>Get to know about <em>our company</em></h2>
                <p>is a leading digital automotive marketplace designed to connect vehicle buyers and sellers. Our website lets you research and compare new, certified and used cars by searching for car make, model & price.</p>
                <a href="about.html" class="filled-button">Read More</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

   	<%@ include file="footer.jsp"%>    
</body>
</html>