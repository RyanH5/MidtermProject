<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

		<div class="page-header section-dark"
			style="background-image: url('${point.destination.image }')">
			<div class="filter"></div>

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
			
			
			<div class="card" style="height:fit-content;width: 20rem;margin-top:100px;">
			<div class="card-body">
				<h4 class="card-title">${point.name }</h4>
				<p class="card-text">${point.address.getCity() }</p>
			</div>
				<c:forEach var="amenity" items="${point.getAmenities()}">
					<a href="viewAmenity.do?id=${amenity.id }">
					${amenity.iconUrl }</a>
				</c:forEach>
				<p class="card-text">${point.address.getStreet1() }</p>
				<p class="card-text">${point.address.getCity() }</p>
				<p class="card-text">${point.address.getState() }</p>
				<p class="card-text"> ${point.address.getZipcode() }</p>
				<p class="card-text">${point.address.getPhone() }</p> 
				<p class="card-text">latitude :${point.address.latitude },</p>
				<p class="card-text">longitude : ${point.address.longitude }</p>
			<c:forEach var="activity" items="${point.getActivities()}">
				<a href="viewActivity.do?id=${activity.id }" class="card-link">
					${activity.iconUrl }</a>
			</c:forEach>
				<h3>
				<a class="navbar-brand" href="#login" rel="tooltip" title="login"
					data-placement="bottom" data-toggle="modal"
					data-target="#addCommentModal"><span><i class="fas fa-comments"></i></span></a>
				</h3>
				<a href="#review" class="navbar-brand" rel="tooltip"
						title="login" data-placement="bottom" data-toggle="modal"
						data-target="#tripModal" style="color:deepskyblue;"> Add To Trip Journal </a>
			</div>
		</div>

		<%-- <div class="entity-container card">
			<div class="mdl-card__title">
				<h3 class="mdl-card__title-text">${point.name }<br>${point.address.getCity() }</h3>
			</div>
			<div class="mdl-card__supporting-text center-text">
			<h3>
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
				<h3>
				<a class="navbar-brand" href="#login" rel="tooltip" title="login"
					data-placement="bottom" data-toggle="modal"
					data-target="#addCommentModal"><span><i class="fas fa-comments"></i></span></a>
				</h3>
				<a href="#review" class="navbar-brand" rel="tooltip"
						title="login" data-placement="bottom" data-toggle="modal"
						data-target="#reviewModal"> Add To Trip Journal </a>
			</div>
		</div>
	</div> --%>
	<jsp:include page="../modals.jsp" />
	<div class="modal fade" id="tripModal" tabindex="-1" role="dialog"
	aria-hidden="false">
	<div class="modal-dialog modal-register">
		<div class="modal-content">
			<div class="modal-header no-border-header text-center">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<form:form class="container" action="addTrip.do" modelAttribute="journalEntry">
					<h3>Add Trip to Bucket List</h3>
					<div>
						<div class="row">
							
							<div class="col-md-7 col-sm-7">
								<div class="form-group">
									<h6>
										Trip Name <span class="icon-danger">*</span>
									</h6>
									<form:input type="text" class="form-control border-input"
										placeholder="Trip to ${point.name }" name="title" path="title"/>
								</div>
								<div class="form-group">
									<h6>Bucket List Notes</h6>
									<form:textarea class="form-control textarea-limited" placeholder=""
										rows="13" maxlength="4500" path="entryText"></form:textarea>
									
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
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>