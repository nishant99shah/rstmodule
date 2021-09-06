<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
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
					
					<li class="nav-item" style="padding-top: 9px;">
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