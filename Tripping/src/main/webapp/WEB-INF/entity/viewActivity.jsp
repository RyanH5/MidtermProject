<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img//apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img//favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>${activity.name}</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />
</head>

<div class="page-header section-dark"
	style="background-image: url('${activity.imageUrl }')">
	<div class="filter"></div>
	<div class="moving-clouds"
		style="background-image: url('./assets/img/clouds.png');"></div>
	<h6 class="category category-absolute"></h6>

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
        /* for (var i = 0; i < points.length; i++) {}

     /*    List<PointsOfInt> points = ... */
     /*var points = [];
     points.push(marker) */

      }
    </script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC-iDfFnLA6gtcuXgzqGOdDqeVr4TQFHI4&callback=initMap"
			async defer></script>
	
		<div class="entity-container card" style="margin-top:50px;">
			<div class="card-body">
				<div class="section text-center">
					<h3 class="card-title">${activity.name }</h3>
					<h5 class="card-text">${activity.shortDescription }</h5>
					<p class="card-text">${activity.longDescription }</p>
				<div class="section text-center">
				<h5>Destinations:</h5>
					<c:forEach var="point" items="${activity.points}">
						<a href="viewDestination.do?id=${point.destination.id }" style="margin-left:10px">
							<span>${point.address.city }</span>
						</a>
					</c:forEach>
				</div>
					<h5>Points of Interest:</h5>
					<c:forEach var="point" items="${activity.points }">
						<h6>
							<a href="viewPoint.do?id=${point.id }">${point.name }</a>
						</h6>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
	</body>
</html>