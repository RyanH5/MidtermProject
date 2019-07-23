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
<title>${destination.name}</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />
</head>

<div class="page-header section-dark"
	style="background-image: url('${destination.image }')">
	<div class="filter"></div>
	<div class="moving-clouds"
		style="background-image: url('./assets/img/clouds.png');"></div>
	<h6 class="category category-absolute text-center"></h6>

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

	<div class="entity-container card" style="margin-top: 50px;">
		<div class="card-body" style="background-color: #F0FFFF;">
			<h3 class="card-title" style="color: orange; font-weight: 400;">${destination.name }</h3>
			<h5 class="card-text" style="font-weight: 400;">${destination.shortDescription }</h5>
			<h5 style="color: orange; font-weight: 400;">Events:</h5>
			<c:forEach var="event" items="${destination.events}">
				<a href="viewEvent.do?id=${event.id }"
					style="margin-left: 10px; color: deepskyblue; font-weight: 400;">
					<span>${event.name }<br> ${event.startDate } -
						${event.endDate }<br></span>
				</a>
			</c:forEach>
			<br>
			<h5 style="color: orange; font-weight: 400;">Points of Interest:</h5>
			<c:forEach var="point" items="${destination.points }">
				<h6>
					<a href="viewPoint.do?id=${point.id }"
						style="color: deepskyblue; font-weight: 400;">${point.name }</a>
					<%-- <c:forEach var="activity" items="${point.getActivities()}">
						<a href="viewActivity.do?id=${activity.id }"> <span>${activity.iconUrl }</span></a>
					</c:forEach> --%>
					<%-- <c:forEach var="amenity" items="${point.getAmenities()}">
						<a href="viewAmenity.do?id=${amenity.id }"> <span>${amenity.iconUrl }</span></a>
					</c:forEach> --%>
					<br>
				</h6>
			</c:forEach>
			<h3>
			<!-- 	<a class="navbar-brand" href="#login" rel="tooltip" title="login"
					data-placement="bottom" data-toggle="modal"
					data-target="#addCommentModal"
					style="margin-left: 20px; color: deepskyblue; font-weight: 400;"><span><i
						class="fas fa-comments"></i></span></a> -->
				<c:choose>
					<c:when test="${! empty sessionScope.user}">
						<a href="#review" class="navbar-brand" rel="tooltip" title="login"
							data-placement="bottom" data-toggle="modal"
							data-target="#tripModal"
							style="color: orange; margin-left: 20px; font-weight: 400"><span></span><i
							class="fas fa-map-pin"></i></span></a>
					</c:when>
				</c:choose>
			</h3>
		</div>
	</div>
</div>
<%-- <h3>
				<c:forEach var="amenity" items="${point.getAmenities()}">
					<a href="viewAmenity.do?id=${amenity.id }">
					<span>${amenity.iconUrl }</span></a>
				</c:forEach><br>
					${point.address.getStreet1() } ${point.address.getCity() }
					${point.address.getState() } ${point.address.getZipcode() }<br>
					${point.address.getPhone() }<br> latitude :
					${point.address.latitude }, longitude : ${point.address.longitude }<br>
				<c:forEach var="destination" items="${point.getActivities()}">
					<a href="viewActivity.do?id=${destination.id }">
					<span>${destination.iconUrl }</span></a>
				</c:forEach>
				<br></h3>

				<h3>Comments</h3>
				<c:forEach var="comment" items="${point.getComments()}">
					<a href="viewUser.do?id=${comment.user.id }">${comment.user.userName }</a>
				${comment.commentText }
	<c:forEach var="point" items="${destination.points }"></c:forEach>
			</c:forEach> --%>
<div class="modal fade" id="tripModal" tabindex="-1" role="dialog"
	aria-hidden="false">
	<div class="modal-dialog modal-register">
		<div class="modal-content">
			<div class="modal-header no-border-header text-center">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<form:form class="container text-center" action="addTrip.do"
					modelAttribute="journalEntry">
					<h3>Add Trip to Journal</h3>
					<div>
						<div class="row">

							<div class="col-md-7 col-sm-7">
								<div class="form-group">
									<h6>New Trip</h6>
									<h6>
										Trip Name
										<!-- <span class="icon-danger">*</span> -->
									</h6>
									<form:input type="text" class="form-control border-input"
										placeholder="Trip to ${point.name }" name="title" path="title" />
								</div>
								<div class="form-group">
									<h6>Notes</h6>
									<form:textarea class="form-control textarea-limited"
										placeholder="" rows="13" maxlength="4500" path="entryText"></form:textarea>

								</div>
							</div>
						</div>
						<div class="row buttons-row">
							<div class="col-md-4 col-sm-4">
								<button class="btn btn-outline-danger btn-block btn-round"
									type="reset">Cancel</button>
							</div>
							<div class="col-md-4 col-sm-4">
								<button class="btn btn-outline-primary btn-block btn-round"
									type="submit">Save</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<!-- addComment modal -->
<div class="modal fade" id="addCommentModal" tabindex="-1" role="dialog"
	aria-hidden="false">
	<div class="modal-dialog modal-register">
		<div class="modal-content">
			<div class="modal-header no-border-header text-center">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<form class="container" action="addComment.do">
					<h3>New Comment ${point.name }</h3>
					<div>
						<div class="row">
							<div class="col-md-7 col-sm-7">
								<div class="form-group">
									<h6>Comment Text</h6>
									<textarea class="form-control textarea-limited" placeholder=""
										rows="13" maxlength="300"></textarea>
									<h5>
										<small> <span id="textarea-limited-message"
											class="pull-right">300 characters left</span>
										</small>
									</h5>
								</div>
							</div>
						</div>
						<div class="row buttons-row">
							<div class="col-md-4 col-sm-4">
								<button class="btn btn-outline-danger btn-block btn-round"
									type="reset">Cancel</button>
							</div>
							<div class="col-md-4 col-sm-4">
								<button class="btn btn-outline-primary btn-block btn-round"
									type="submit">Save</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../modals.jsp" />
<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>
