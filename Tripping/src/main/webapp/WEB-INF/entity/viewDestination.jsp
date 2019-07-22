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
<title>${destination.name}</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />
</head>
<div class="main-section"
	style="background-image: url('${destination.image }')">

	<div class="entity-container card">
		<div class="mdl-card__title">
			<h3 class="mdl-card__title-text">${destination.name }</h3>
		</div>
		<div class="mdl-card__supporting-text center-text">
			<h6 class="presentation-subtitle text-center">${destination.shortDescription }</h6>
			<%-- <h3>
				<c:forEach var="amenity" items="${point.getAmenities()}">
					<a href="viewAmenity.do?id=${amenity.id }">
					<span>${amenity.iconUrl }</span></a>
				</c:forEach><br>
					${point.address.getStreet1() } ${point.address.getCity() }
					${point.address.getState() } ${point.address.getZipcode() }<br>
					${point.address.getPhone() }<br> latitude :
					${point.address.latitude }, longitude : ${point.address.longitude }<br>
				<c:forEach var="activity" items="${point.getActivities()}">
					<a href="viewActivity.do?id=${activity.id }">
					<span>${activity.iconUrl }</span></a>
				</c:forEach>
				<br></h3> 
				
				<h3>Comments</h3>
				<c:forEach var="comment" items="${point.getComments()}">
					<a href="viewUser.do?id=${comment.user.id }">${comment.user.userName }</a>
				${comment.commentText }
			</c:forEach> --%>
			<h3>
				<a class="navbar-brand" href="#" rel="tooltip" title="login"
					data-placement="bottom" data-toggle="modal"
					data-target="reviewModal"><span><i
						class="fas fa-comments"></i></span></a>
			</h3>
		</div>
	</div>
	<c:forEach var="point" items="${destination.points }"></c:forEach>

	<div id="map" class="entity-container card"></div>
	<script>
      var map;
      function initMap() {

    	 
    	  
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: ${point.address.latitude }, lng: ${point.address.longitude }},
          zoom: 8
        });
        
        
        var points = [];
        points.push(marker)
        
        for (var i = 0; i < destination.points.length; i++) {
        	
        	var myLatLng = {lat: ${destination.points.get(i).address.latitude }, lng: ${destination.points.get(i).address.longitude }};
        	
        	var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                title: '${point.name}'
              });
        	
        }

      }
    </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE&callback=initMap"
		async defer></script>

</div>
<jsp:include page="../modals.jsp" />
<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>