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
<title>${destination.name }</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="../navbar.jsp" />
	<div class="wrapper">
		<div class="main-section"
			style="background-image: url('${destination.image }')">
			<div class="filter"></div>
			<div class="entity-container card">
				<h3 class="presentation-title">${destination.name }</h1>
					<h6 class="presentation-subtitle text-center">${destination.shortDescription }</h2>
			</div>
		</div>
		<div class="entity-container card">
			<c:forEach var="point" items="${destination.points }">

				<div id="map"></div>
				<script>
      var map;
      function initMap() {
    	  
    	  var myLatLng = {lat: ${point.address.latitude }, lng: ${point.address.longitude }};
    	  
    
    	
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: ${point.address.latitude }, lng: ${point.address.longitude }},
          zoom: 8
        });
        
      }
    </script>
				
				<a href="viewPoint.do?id=${point.id }">${point.name }</a>
				<a href="viewPoint.do?id=${point.id }">${point.address.city }</a>
				<br>
			</c:forEach>
		</div>

		<div class="moving-clouds"
			style="background-image: url('./assets/img/clouds.png');"></div>
		<h6 class="category category-absolute"></h6>
	</div>
</head>
<body>


	<!-- Modal Bodies come here -->
	<!--   end modal -->
	<footer class="footer footer-black  footer-white ">
		<div class="container">
			<div class="row">
				<nav class="footer-nav"></nav>
			</div>
		</div>
	</footer>
</body>
</html>