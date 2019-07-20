<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
</head>
</head>
<body>

	<iframe width="600" height="450" frameborder="0" style="border: 0"
		src="https://www.google.com/maps/embed/v1/view?zoom=12&center=40.3772%2C-105.5217&key=AIzaSyC-iDfFnLA6gtcuXgzqGOdDqeVr4TQFHI4..."
		allowfullscreen></iframe>

	<div class="mdl-card">
		<div class="mdl-card__title">
			<h2 class="mdl-card__title-text">${point.name }<br>${point.destination.getName() }</h2>
		</div>
		<div class="mdl-card__media">
			<img src="skytower.jpg" width="173" height="157" border="0" alt=""
				style="padding: 10px;">
		</div>






		<div class="mdl-card__actions">
			<button
				class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
				Button</button>
			<!-- Colored FAB button -->
			<button
				class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
				<i class="material-icons">add</i>
			</button>
		</div>
	</div>
	<!--    navbar come here          -->
	<!-- end navbar  -->
	<div class="wrapper">
		<!-- content come here     -->
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
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC-iDfFnLA6gtcuXgzqGOdDqeVr4TQFHI4"></script>
<!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/paper-kit.min.js" type="text/javascript"></script>
</html>