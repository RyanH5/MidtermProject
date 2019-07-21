<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img//apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img//favicon.png">
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
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
<!-- <link href="./assets/css/entitiesGrid.css" rel="stylesheet" /> -->

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
<body>

	<script src="http://maps.google.com/maps/api/js"></script>
	<script src="gmaps.js"></script>
	<style type="text/css">
#map {
	width: 400px;
	height: 400px;
}
</style>
</head>
<body>
	<div id="map"></div>
	<script>
      var map;
      function initMap() {
    	  var myLatLng = {lat: ${point.address.latitude }, lng: ${point.address.longitude }};
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: ${point.address.latitude }, lng: ${point.address.longitude }},
          zoom: 8
        });
        
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: '${point.name}'
          });
        
      }
    </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE&callback=initMap"
		async defer></script>

	<div class="mdl-card">
		<div class="mdl-card__title">
			<h2 class="mdl-card__title-text">${point.name }<br>${point.address.getCity() }</h2><br>
		</div>
		<div class="mdl-card__media">
			<img src="skytower.jpg" width="500" height="300" border="0" alt=""
				style="padding: 10px;">
		</div>
		<div class="mdl-card__supporting-text center-text">
		<c:forEach var="amenity" items="${point.getAmenities()}">
			<a href="viewAmenity.do?id=${amenity.id }">
				<img src="${amenity.iconUrl }" alt="${amenity.name }" width="42" height="42">
			</a>
			</c:forEach>
			<br><h3>
			${point.address.getStreet1() } ${point.address.getCity() }
			${point.address.getState() } ${point.address.getZipcode() }<br>
			${point.address.getPhone() }<br> latitude :
			${point.address.latitude }, longitude : ${point.address.longitude }<br></h3>
			<c:forEach var="activity" items="${point.getActivities()}">
				<img href="viewActivity.do?id=${activity.id }" src="${activity.iconUrl }" alt="${activity.name }" width="42" height="42">
			</c:forEach><br><h3>Comments</h3>
			<c:forEach var="comment" items="${point.getComments()}">
				<a href="viewComment.do?id=${comment.user.id }">${comment.user.userName }</a>
				${comment.commentText }
			</c:forEach>
<%-- 		<div class="mdl-card__actions">
			<a href="AddToBucketList.do?id=${destination.id }"
				class="btn btn-link btn-neutral"> <i class="fa fa-minus"
				aria-hidden="true"></i>Delete Comment
			</a>
			<!-- Colored FAB button -->
			<button
				class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
				<i class="material-icons">Add Comment</i>
			</button>
		</div> --%>
	</div>
</body>

</html>