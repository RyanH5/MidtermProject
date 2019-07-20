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
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th class="text-center">#</th>
					<th>Username</th>
					<th>Role</th>
					<th>Since</th>
					<th class="text-right">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<tr>
						<td class="text-center">${user.id }</td>
						<td>${user.userName }</td>
						<td>${user.role }</td>
						<td>${user.createDate }</td>
						<td class="td-actions text-right">
							<button type="button" rel="tooltip" title="View Profile"
								class="btn btn-info btn-simple btn-xs">
								<i class="fa fa-user"></i>
							</button>
							<button type="button" rel="tooltip" title="Edit Profile"
								class="btn btn-success btn-simple btn-xs">
								<i class="fa fa-edit"></i>
							</button>
							<button type="button" rel="tooltip" title="Make Inactive"
								class="btn btn-danger btn-simple btn-xs">
								<i class="fa fa-times"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
<%--
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
