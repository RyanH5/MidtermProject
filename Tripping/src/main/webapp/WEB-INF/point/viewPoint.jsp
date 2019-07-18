<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
	integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
	crossorigin="anonymous"></script>
<script
	src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
	integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.brown-orange.min.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
</head>
</head>
<body>
	<div class="mdl-card">
		<c:forEach var="p" items="${allpoints}">
			<div class="mdl-card__title">
				<h2 class="mdl-card__title-text">${p.name }<br>${p.destination.getName() }</h2>
			</div>
			<div class="mdl-card__media">
				<img src="skytower.jpg" width="173" height="157" border="0" alt=""
					style="padding: 10px;">
			</div>
			<div class="mdl-card__supporting-text">
				${p.address.getStreet1() } ${p.address.getCity() }
				${p.address.getState() } ${p.address.getZipcode() }
				${p.address.getPhone() }
				<h4>Amenities:</h4>
				<c:forEach var="a" items="${p.getAmenities()}">
					<li><a href="getPoint.do?fid=${a.id }">${a.name }</a></li>
				</c:forEach>
				<h4>Activities:</h4>
				<c:forEach var="a" items="${p.getActivities()}">
					<li><a href="getPoint.do?fid=${a.id }">${a.name }</a></li>
				</c:forEach>
				<h4>Comments:</h4>
				<c:forEach var="c" items="${p.getComments()}">
					<li><a href="getPoint.do?fid=${c.id }">${c.commentText }</a></li>
					<br>
					<br>
				</c:forEach>
			</div>
			<div class="mdl-card__actions">
				<button
					class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
					Button</button>
				<!-- Colored FAB button -->
				<button
					class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
					<i class="material-icons">add</i>
				</button>
			</div>
		</c:forEach>
	</div>
</body>
</html>