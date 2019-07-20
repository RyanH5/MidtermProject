<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>Activities</title>
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
<body>

	<!--    navbar come here          -->
	<nav>
		<a id="navExample" class="navbar-brand" href="/" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom">
			          tripping
			        </a>
	</nav>

	<!-- end navbar  -->

<%-- 	<div class="wrapper">

	<!-- content come here     -->
		<c:forEach var="a" items="${activities}">
		<div class="section text-center">
			<h2>${a.name }</h2>
			<a href="viewDestination.do?id=${a.id }">${a.name }</a><br>
			<a href="viewDestination.do?id=${a.id }">${a.imageUrl }</a><br>
			<h4>Points Of Interest:</h4>
			<c:forEach var="p" items="${a.getPoints()}">
				<a href="viewPoints.do?id=${p.id }">${p.name }</a><br>
			</c:forEach>
		</div>
	</c:forEach>

	</div> --%>
		<div class="main-section">
		<c:forEach var="a" items="${activities}">
			<div class="entity-container">
				<div class="section text-center entity-card-image" style="background-image: url('${a.imageUrl}'); height: 230px;">
				</div>
				<div class="entity-content dest">
					<h2 class="entity-title"><a href="viewDestination.do?id=${a.id }">${a.name }</a></h2>
					<br>
					<h4>Points Of Interest:</h4>
					<c:forEach var="p" items="${a.getPoints()}">
						<a href="viewPoint.do?id=${p.id }">${p.name }</a><br>
					</c:forEach>					
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- Modal Bodies come here -->

	<!--   end modal -->

</body>

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

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

<!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/paper-kit.min.js" type="text/javascript"></script>
</html>