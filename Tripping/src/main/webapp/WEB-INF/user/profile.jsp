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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>profile</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="../navbar.jsp" />

	<div class="page-header page-header-xs" data-parallax="true"
		style="background-image: url(https://www.thomasmangan.com/images/xl/LongsPeakGlacierGorge12.2.14.2.jpg); background-position-y: 42%; z-index: 0;">
		<div class="filter"></div>
	</div>
	<div class="section profile-content"
		style="background-image: linear-gradient(120deg, #fccb90 0%, #d57eeb 100%);">
		<div class="container" style="margin-top: -150px;">
			<div class="owner">
				<div class="trippingAvatar">
					<img src="${sessionScope.user.imageURL }" alt="Circle Image"
						class="tripping-avatar"
						style="vertical-align: middle; border-style: none; height: 150px; width: 150px; border-radius: 50%; z-index: 1; border: 2px solid rgb(120, 68, 59);">
				</div>
				<div class="name">
					<h4 class="username">${sessionScope.user.userName }
						<br />
					</h4>
					<h6 class="role">${sessionScope.user.role }</h6>
				</div>
				<!-- <div class="row">
					<div class="col-md-6 ml-auto mr-auto text-center">
						<btn class="btn btn-outline-default btn-round"> <i
							class="fa fa-cog"></i> Settings</btn>
					</div>
				</div> -->
			</div>
			<br />
			<div class="nav-tabs-navigation">
				<div class="nav-tabs-wrapper">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#follows" role="tab">Trips in
								Progress</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#following" role="tab">Complete Trips</a></li>
					</ul>
				</div>
			</div>
			<div class="tab-content following">
				<div class="tab-pane active" id="follows" role="tabpanel">
					<div class="row">
						<!-- 						<div class="col-md-6 ml-auto mr-auto">
 -->
						<!-- <ul class="list-unstyled follows"> -->
						<c:forEach var="entry" items="${futureTrips}">
							<div class="entity-container card">
								<div class="card-body text-center"
									style="background-image: url('${entry.destination.image}');">
									<h4>${entry.getTitle() }</h4>
									<div class="form-check">
										<!-- <label class="form-check-label"> <input
															class="form-check-input" type="checkbox" value="unchecked" checked>
															<span class="form-check-sign"></span>
														</label> -->
										<form action="completeTrip.do" method="GET">
											<button type="submit" name="tripId" value="${entry.getId()}">Complete
												Trip</button>
										</form>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="tab-pane text-center" id="following" role="tabpanel">
					<div class="row">
						<c:forEach var="entry" items="${pastTrips}">
							<div class="entity-container card">
								<div class="card-body text-center"
									style="background-image: url('${entry.destination.image}');">
									<h4>${entry.getTitle() }</h4>
									<div class="form-check">
										<!-- 				<label class="form-check-label"> <input
															class="form-check-input" type="checkbox" value="unchecked" checked>
															<span class="form-check-sign"></span>
														</label> -->
										<form action="didNotCompleteTrip.do" method="GET">
											<button type="submit" name="tripId" value="${entry.getId()}">Didn't
												complete trip</button>
										</form>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- VIEW THINGS BTN -->
				</div>
					<h3 class="text-muted"></h3>
					<a href="viewActivities.do">
						<button class="btn btn-warning btn-round">Find Things to
							Do</button>
					</a>
			</div>
		</div>
	</div>
	<footer class="footer footer-black  footer-white ">
		<div class="container">
			<div class="row">
				<nav class="footer-nav"></nav>
			</div>
		</div>
	</footer>

	<%-- <jsp:include page="../modals.jsp" /> --%>
	<jsp:include page="../bootstrapFoot.jsp" />
</body>

</html>