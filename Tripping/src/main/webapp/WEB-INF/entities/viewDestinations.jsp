<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img//apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img//favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>destinations</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./assets/css/paper-kit.css" rel="stylesheet" />
<link href="./assets/css/entitiesGrid.css" rel="stylesheet" />

</head>

<body class="index-page sidebar-collapse">

	<nav class="navbar navbar-expand-lg fixed-top navbar-transparent "
		color-on-scroll="300">
		<div class="container">




			<div class="navbar-translate">
				<a href="viewProfile.do"><i class="fa fa-user-o" aria-hidden="true"></i></a> <a
					class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
					title="login" data-placement="bottom" data-toggle="modal"
					data-target="#loginModal"> login </a>
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-bar bar1"></span> <span
						class="navbar-toggler-bar bar2"></span> <span
						class="navbar-toggler-bar bar3"></span>
				</button>
			</div>

			<div class="navbar-translate">
				<a class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
					title="login" data-placement="bottom" data-toggle="modal"
					data-target="#registerModal"> register </a>
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
	
	<div class="main-section">
		<c:forEach var="destination" items="${destinations}">
			<div class="entity-container"><a href="viewDestination.do?id=${destination.id }">
				<div class="section text-center entity-card-image" style="background-image: url('${destination.image}'); height: 230px;">
				</div></a>
				<div class="entity-content dest">
					<h2 class="entity-title"><a href="viewDestination.do?id=${destination.id }">${destination.name }</a></h2>
					<br>
					<a href="createDestination.do?id=${destination.id }">Create</a><br>
					<a href="createDestinationReview.do?id=${destination.id }">FIX Create Destination Review</a><br>
					<a href="createPointComment.do?id=${point.id }">FIX Create Point Review</a><br>
					<a href="createEventReview.do?id=${event.id }">FIX Create Event Review</a><br>
					<a href="createEventReview.do?id=${event.id }">STRETCH GOALS FILE UPLOADS FOR IMG?</a><br>
					<a href="updateDestination.do?id=${destination.id }">FIX ME Update Destination</a><br>
					<a href="updateDestination.do?id=${destination.id }">FIX ME Update Point Add/Remove Activity</a><br>
					<a href="updateDestination.do?id=${destination.id }">FIX ME Add Point of Interest</a><br>
					<a href="removeDestination.do?id=${destination.id }">Remove Destination</a><br>
					<a href="removePointOfInterestComment.do?id=${destination.id }">Remove Point of Interest</a><br>
					<a href="removeDestinationReview.do?id=${destination.id }">Remove Destination Review</a><br>
					<a href="removePointOfInterestComment.do?id=${destination.id }">Remove Point of Interest Comment</a><br>
					<a href="removeEventReview.do?id=${destination.id }">Remove Event Review</a><br>
					<a href="removeEventReview.do?id=${destination.id }">Add/Remove Activity/Amenity</a><br>
					<p>FIX ME, NEED TWO COLUMNS  Points Of Interest:</p>
					<c:forEach var="p" items="${destination.getPoints()}">
						<a href="viewPoint.do?id=${p.id }"><h3>${p.name }</a></h3><br>
					</c:forEach>					
				</div>
			</div>
		</c:forEach>
	</div>
<!-- register modal -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-hidden="false">
		<div class="modal-dialog modal-register">
			<div class="modal-content">
				<div class="modal-header no-border-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h6 class="text-muted">Tripping</h6>
					<h3 class="modal-title text-center">Register</h3>
										<p>Create an account account</p>
					
				</div>
				<form class="register-form" action="createUser.do">
					<div class="modal-body">
						<div class="form-group">
							<label>Username</label> <input type="text" value=""
								name="userName" placeholder="username" class="form-control" />
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password" value=""
								name="password" placeholder="password" class="form-control" />
						</div>
						<button class="btn btn-block btn-round">Register</button>
				</form>
			</div>
		</div>
	</div>
	<!-- END MODALS  -->
	<!--   end modal -->
	<!--   Core JS Files   -->
	<script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="./assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="./assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
	<script src="./assets/js/plugins/moment.min.js"></script>
	<script src="./assets/js/plugins/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
	<script src="./assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
	<!--  Google Maps Plugin    -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

</body>

</html>