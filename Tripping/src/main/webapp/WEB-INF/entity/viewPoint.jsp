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
<title>${event.name}</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />
</head>
<body class="index-page sidebar-collapse">
	<div class="main-section" style="background-color: #F0FFFF;">

		<div id="map" class="entity-container card"></div>
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
        for (var i = 0; i < points.length; i++) {}

     /*    List<PointsOfInt> points = ... */
     var points = [];
     points.push(marker)

      }
    </script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE&callback=initMap"
			async defer></script>

		<div class="entity-container card">
			<div class="mdl-card__title">
				<h2 class="mdl-card__title-text">${point.name }<br>${point.address.getCity() }</h2>
			</div>
			<div class="mdl-card__supporting-text center-text">
				<c:forEach var="amenity" items="${point.getAmenities()}">
					<a href="viewAmenity.do?id=${amenity.id }"> <img
						src="${amenity.iconUrl }" alt="${amenity.name }" width="42"
						height="42">
					</a>
				</c:forEach>
				<br>
				<h3>
					${point.address.getStreet1() } ${point.address.getCity() }
					${point.address.getState() } ${point.address.getZipcode() }<br>
					${point.address.getPhone() }<br> latitude :
					${point.address.latitude }, longitude : ${point.address.longitude }<br>
				</h3>

				<c:forEach var="activity" items="${point.getActivities()}">

					<a href="viewActivity.do?id=${activity.id }">
						${activity.iconUrl }</a>
				</c:forEach>
				<br>
				<h3>Comments</h3>
				<c:forEach var="comment" items="${point.getComments()}">
					<a href="viewUser.do?id=${comment.user.id }">${comment.user.userName }</a>
				${comment.commentText }
			</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>