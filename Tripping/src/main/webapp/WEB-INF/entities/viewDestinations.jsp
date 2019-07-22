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

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">
   
    <jsp:include page="../navbar.jsp" />


	<div class="main-section" style="background-color:#F0FFFF;">
		<c:forEach var="destination" items="${destinations}">
			<div class="entity-container card"><a href="viewDestination.do?id=${destination.id }">
				<div class="section text-center entity-card-image" style="background-image: url('${destination.image}'); height: 230px;">
				</div></a>
				<div class="entity-content dest">
					<h2 class="entity-title"><a href="viewDestination.do?id=${destination.id }">${destination.name }</a></h2>
					<br>
					<a href="createDestination.do">Create Destination</a><br>
					
					<a href="createReview"
                    class="navbar-brand" rel="tooltip"
                    title="login" data-placement="bottom" data-toggle="modal"
                    data-target="#reviewModal"> createDestinationReview </a>
					
					<a href="createDestinationReview.do?id=${destination.id }">FIX Create Destination Review</a><br>
					<a href="createPointComment.do?id=${point.id }">FIX Create Point Review</a><br>
					<a href="createEventReview.do?id=${event.id }">FIX Create Event Review</a><br>
					<a href="createEventReview.do?id=${event.id }">STRETCH GOALS FILE UPLOADS FOR IMG?</a><br>
					<a href="updateDestination.do?id=${destination.id }">FIX ME Update Destination</a><br>
					<a href="updateDestination.do?id=${destination.id }">FIX ME Update Point Add/Remove Activity</a><br>
					<a href="updateDestination.do?id=${destination.id }">FIX ME Add Point of Interest</a><br>
					<a href="removeDestination.do?id=${destination.id }">Remove Destination</a><br>
					<a href="removePointOfInterestComment.do?id=${destination.id }">Remove Point of Interest</a><br>
					<a href="removeDestinationReview.do?id=${destination.id }">Remove Destination Review</a><br>
					<a href="removePointOfInterestComment.do?id=${destination.id }">Remove Point of Interest Comment</a><br>
					<a href="removeEventReview.do?id=${destination.id }">Remove Event Review</a><br>
					<a href="removeEventReview.do?id=${destination.id }">Add/Remove Activity/Amenity</a><br>
					<p>FIX ME, NEED TWO COLUMNS  Points Of Interest:</p>
					<c:forEach var="p" items="${destination.getPoints()}">
						<a href="viewPoint.do?id=${p.id }"><h3>${p.name }</a></h3><br>

					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>

<!-- register modal -->
	<footer class="footer footer-black  footer-white ">
		<div class="container">
			<div class="row">
				<nav class="footer-nav"></nav>
			</div>
		</div>
	</footer>
		<jsp:include page="../modals.jsp" />
    <jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>
