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
<link href="https://fonts.googleapis.com/css?family=Ranchers&display=swap" rel="stylesheet">
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="../navbar.jsp" />
	<div class="main-section" style="background-color: #F0FFFF;">
		<c:forEach var="destination" items="${destinations}">
			<div class="entity-container card" style="height: 310px;">
				<%-- <a href="viewDestination.do?id=${destination.id }"> --%>
					<div class="section text-center entity-card-image" style="background-image: url('${destination.image}'); height: 230px;">
					</div>
				<!-- </a> -->
				<div class="entity-content dest" style="z-index: 10; margin-top: -181px;">
					<h6 class="entity-title" style="font-family: 'Ranchers', cursive;
    color: orange;
    font-size: 36px;
    text-shadow: 1px 1px green;">${destination.name }</h6>
					<a href="#review" class="navbar-brand" rel="tooltip"
						title="login" data-placement="bottom" data-toggle="modal"
						data-target="#tripModal" style="margin-top: 133px;
					    width: 95%;
					    color: orange;
					    text-align: center;
					    font-weight: 400;"> Add To Trip Journal </a>
											
						<%-- <a href="viewDestination.do?id=${destination.id }">$</a> --%>
					<%-- <br> <a href="createDestination.do">Create Destination</a><br>

					<br> <a
						href="createPointComment.do?id=${point.id }">FIX Create Point
						Review</a><br> <a href="createEventReview.do?id=${event.id }">FIX
						Create Event Review</a><br> <a
						href="createEventReview.do?id=${event.id }">STRETCH GOALS FILE
						UPLOADS FOR IMG?</a><br> <a
						href="updateDestination.do?id=${destination.id }">FIX ME
						Update Destination</a><br> <a
						href="updateDestination.do?id=${destination.id }">FIX ME
						Update Point Add/Remove Activity</a><br> <a
						href="updateDestination.do?id=${destination.id }">FIX ME Add
						Point of Interest</a><br> <a
						href="removeDestination.do?id=${destination.id }">Remove
						Destination</a><br> <a
						href="removePointOfInterestComment.do?id=${destination.id }">Remove
						Point of Interest</a><br> <a
						href="removeDestinationReview.do?id=${destination.id }">Remove
						Destination Review</a><br> <a
						href="removePointOfInterestComment.do?id=${destination.id }">Remove
						Point of Interest Comment</a><br> <a
						href="removeEventReview.do?id=${destination.id }">Remove Event
						Review</a><br> <a
						href="removeEventReview.do?id=${destination.id }">Add/Remove
						Activity/Amenity</a><br>
					<p>FIX ME, NEED TWO COLUMNS Points Of Interest:</p> --%>
					<c:forEach var="p" items="${destination.getPoints()}">
						<h6 style="width: 95%; text-align: center; color: orange;"><a href="viewPoint.do?id=${p.id }" style="color: orange;">${p.name }</a></h6>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>

	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>