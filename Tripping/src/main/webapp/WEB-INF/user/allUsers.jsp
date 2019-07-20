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
</head>
<body>
	<!--    navbar come here          -->
	<!-- end navbar  -->
	<div class="wrapper">
		<c:forEach var="user" items="${users}">
			<div class="section text-center">
				<h2>${user.userName }</h2>
				
				<a href="viewUser.do?id=${user.id }">${user.firstName }</a><br> 
				<a href="viewUser.do?id=${user.id }">${user.lastName }</a><br> 
				<a href="viewUser.do?id=${user.id }">${user.active }</a><br> 
				<!--  ************** ADMIN PRIVLEGES ************-->
				<c:choose>
					<c:when test="${sessionScope.user.role.equals('admin')}">
						<div id="switches" class="admin-container">
						<span>*** ADMIN ONLY ***</span>
						<form action="toggleActiveUser.do" modelAttribute="user" method="GET">
							<label>Active: 
								<c:if test="${user.active}">
									<input type="checkbox" name="active" value="true" data-toggle="switch"
									checked="" data-on-color="primary" data-off-color="primary">
								<span class="toggle"></span>								
								</c:if>
								<c:if test="${! user.active}">
									<input type="checkbox" name="active" value="false"
										data-toggle="switch" data-off-color="primary"
										data-on-color="primary"> <span class="toggle"></span>
								</c:if>
								
							</label>
						</form>
						<form action="toggleAdmin.do" modelAttribute="user" method="GET">
							<label>Admin: 
								<c:if test="${user.role.equals('admin')}">
									<input type="checkbox" name="admin" value="true" checked=""
									data-toggle="switch" data-off-color="primary"
									data-on-color="primary"> <span class="toggle"></span>				
								</c:if>
								<c:if test="${! user.role.equals('admin')}">
									<input type="checkbox" name="admin" value="false"
										data-toggle="switch" data-off-color="primary"
										data-on-color="primary"> <span class="toggle"></span>
								</c:if>
							</label>
						</form>
					</div>
					</c:when>
			</c:choose>
					
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