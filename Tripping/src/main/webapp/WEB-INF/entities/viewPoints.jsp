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
<title>tripping</title>
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
	<div class="mdl-card">
		<c:forEach var="point" items="${allpoints}">
			<div class="mdl-card__title">
				<h2 class="mdl-card__title-text">${point.name }<br>${point.destination.getName() }</h2>
			</div>
			<div class="mdl-card__media">
				<img src="skytower.jpg" width="173" height="157" border="0" alt=""
					style="padding: 10px;">
			</div>
			<div class="mdl-card__supporting-text">
				${point.address.getStreet1() } ${point.address.getCity() }
				${point.address.getState() } ${point.address.getZipcode() }
				${point.address.getPhone() }
				<h4>Amenities:</h4>
				<c:forEach var="amenity" items="${point.getAmenities()}">
					<li><a href="getPoint.do?id=${amenity.id }">${amenity.name }</a></li>
				</c:forEach>
				<h4>Activities:</h4>
				<c:forEach var="activity" items="${point.getActivities()}">
					<li><a href="getPoint.do?id=${activity.id }">${activity.name }</a></li>
				</c:forEach>
				<h4>Comments:</h4>
				<c:forEach var="comment" items="${point.getComments()}">
					<li><a href="viewUser.do?id=${comment.id }">${comment.commentText }</a></li>
					<br>
					<br>
				</c:forEach>
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
		</c:forEach>
	</div>
</body>
</html>