<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>Tripping Login</title>
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
<nav id="navExample" class="navbar navbar-expand-lg fixed-top"
	color-on-scroll="300">
	<div class="container">
		<div class="navbar-translate">
			<i class="fa fa-user-o" aria-hidden="true"></i> <a
				class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
				title="loginOrRegister.do" data-placement="bottom">login</a>
			<button class="navbar-toggler navbar-toggler" type="button"
				data-toggle="collapse" data-target="#navigation"
				aria-controls="navigation-index" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-bar bar1"></span><span
					class="navbar-toggler-bar bar2"></span><span
					class="navbar-toggler-bar bar3"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse justify-content-end"
			id="navigation">
			<ul class="navbar-nav">
				<li><a class="navbar-brand" href="/" rel="tooltip"
					title="tripping" data-placement="bottom"> tripping </a></li>
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
					href="https://github.com/RyanH5/MidtermProject" target="_blank">
						<i class="fa fa-github"></i>
						<p class="d-lg-none">GitHub</p>
				</a></li>
			</ul>
		</div>
	</div>
</nav>				
<div class="main-section">
	<c:forEach var="event" items="${events}">
		<div class="entity-container card">
			<div class="section text-center entity-card-image"
				style="background-image: url('${event.destination.image}'); height: 230px;">
			</div>
			<h6 class="entity-title">
				<a href="viewEvent.do?id=${event.id }">${event.name }</a><br>
						<a href="viewDestination.do?id=${event.destination.id }">${event.destination.name }</a><br>
			</h6>
		</div>
	</c:forEach>
</div>
<footer class="footer footer-black  footer-white ">
	<div class="container">
		<div class="row">
			<nav class="footer-nav"></nav>
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
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="./assets/js/plugins/moment.min.js"></script>
<script src="./assets/js/plugins/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<script>
	$(document).ready(function() {

		if ($("#datetimepicker").length != 0) {
			$('#datetimepicker').datetimepicker({
				icons : {
					time : "fa fa-clock-o",
					date : "fa fa-calendar",
					up : "fa fa-chevron-up",
					down : "fa fa-chevron-down",
					previous : 'fa fa-chevron-left',
					next : 'fa fa-chevron-right',
					today : 'fa fa-screenshot',
					clear : 'fa fa-trash',
					close : 'fa fa-remove'
				}
			});
		}

		function scrollToDownload() {

			if ($('.section-download').length != 0) {
				$("html, body").animate({
					scrollTop : $('.section-download').offset().top
				}, 1000);
			}
		}
	});
</script>
</body>
</html>