<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>destinations</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<!-- CSS Files -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./assets/css/paper-kit.css" rel="stylesheet" />
<link href="./assets/css/entitiesGrid.css" rel="stylesheet" />

</head>

<nav class="navbar navbar-expand-lg fixed-top navbar-transparent "
  	color-on-scroll="300">
  	<div class="container">



      <div class="navbar-translate">
      			<i class="fa fa-user-o" aria-hidden="true"></i> <a
      				class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
      				title="loginOrRegister.do" data-placement="bottom"> login </a>
      			<button class="navbar-toggler navbar-toggler" type="button"
      				data-toggle="collapse" data-target="#navigation"
      				aria-controls="navigation-index" aria-expanded="false"
      				aria-label="Toggle navigation">
      				<span class="navbar-toggler-bar bar1"></span> <span
      					class="navbar-toggler-bar bar2"></span> <span
      					class="navbar-toggler-bar bar3"></span>
      			</button>
      		</div>


  		<div class="collapse navbar-collapse justify-content-end"
  			id="navigation">
  			<ul class="navbar-nav">
  				<li class="nav-item"><a href="viewActivities.do"
  					class="nav-link"><i class="nc-icon nc-layout-11"></i>
  						Activities</a></li>
  				<li class="nav-item"><a href="viewDestinations.do"
  					class="nav-link"><i class="nc-icon nc-layout-11"></i>
  						Destinations</a></li>
  				<li class="nav-item"><a href="viewEvents.do" class="nav-link"><i
  						class="nc-icon nc-layout-11"></i> Events</a></li>
  				<li class="nav-item"><a class="nav-link" rel="tooltip"
  					title="Star on GitHub" data-placement="bottom"
  					href="https://github.com/RyanH5/MidtermProject"> <i
  						class="fa fa-github"></i>
  						<p class="d-lg-none">GitHub</p>
  				</a></li>
  			</ul>
  		</div>
  	</div>
  </nav>
  <!-- End Navbar -->
<%-- 	<div class="section section-image section-login"
		style="background-image: url('https://www.uncovercolorado.com/wp-content/uploads/2017/10/Colorado-Kayaking-Lake-Clouds-950x475.jpg');">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 mx-auto">
					<div class="card card-register" style="background-image: url('./assets/img/login-image.jpg');">
	<c:forEach var="d" items="${dests}">
						<h3 class="title mx-auto">Welcome</h3>
						<div class="social-line text-center">
							<a href="#pablo"
								class="btn btn-neutral btn-facebook btn-just-icon mt-0"> <i
								class="fa fa-facebook-square"></i>
							</a> <a href="#pablo"
								class="btn btn-neutral btn-google btn-just-icon mt-0"> <i
								class="fa fa-google-plus"></i>
							</a> <a href="#pablo"
								class="btn btn-neutral btn-twitter btn-just-icon mt-0"> <i
								class="fa fa-twitter"></i>
							</a>
						</div>
		<div class="section text-center">
			<h2>${d.name }</h2>
			<a href="viewDestination.do?id=${d.id }">${d.name }</a><br>
			<a href="viewDestination.do?id=${d.id }">${d.description }</a><br>
			<h4>Points Of Interest:</h4>
			<c:forEach var="p" items="${d.getPoints()}">
				<a href="viewPoint.do?id=${p.id }">${p.name }</a><br>
			</c:forEach>
		</div>
	</c:forEach>
	</div> --%>
	
	<div class="main-section">
		<c:forEach var="destination" items="${destinations}">
			<div class="entity-container"><a href="viewDestination.do?id=${destination.id }">
				<div class="section text-center entity-card-image" style="background-image: url('${destination.image}'); height: 230px;">
				</div></a>
				<div class="entity-content dest">
					<h2 class="entity-title"><a href="viewDestination.do?id=${destination.id }">${destination.name }</a></h2>
					<br>
					<a href="viewDestination.do?id=${destination.id }">${d.shortDescription }</a><br>
					<h4>Points Of Interest:</h4>
					<c:forEach var="p" items="${destination.getPoints()}">
						<a href="viewPoint.do?id=${p.id }">${p.name }</a><br>
					</c:forEach>					
				</div>
			</div>
		</c:forEach>
	</div>
	<footer class="footer footer-black  footer-white ">
		<div class="container">
			<div class="row">
				<nav class="footer-nav">
					<ul>
						<li><a href="https://www.creative-tim.com" target="_blank">Creative
								Tim</a></li>
						<li><a href="http://blog.creative-tim.com/" target="_blank">Blog</a>
						</li>
						<li><a href="https://www.creative-tim.com/license"
							target="_blank">Licenses</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</footer>
	<!--   Core JS Files   -->
	<script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="./assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="./assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	
	</body>
</html>