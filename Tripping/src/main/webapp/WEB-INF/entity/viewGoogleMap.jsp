<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
</head>
</head>
<body>

<iframe width="600" height="450" frameborder="0" style="border:0"
src="https://www.google.com/maps/embed/v1/undefined?origin=...&q=...&destination=...&center=...&zoom=...&key=..." allowfullscreen></iframe>

	<div class="mdl-card">
		<div class="mdl-card__title">
			<h2 class="mdl-card__title-text">${point.name }<br>${point.destination.getName() }</h2>
		</div>
		<div class="mdl-card__media">
			<img src="skytower.jpg" width="173" height="157" border="0" alt=""
				style="padding: 10px;">
		</div>
		<div class="mdl-card__supporting-text">
			${point.address.getStreet1() } ${point.address.getCity() }
			${point.address.getState() } ${point.address.getZipcode() }
			${point.address.getPhone() }
			<h4>Amenities:</h4>
			<c:forEach var="a" items="${point.getAmenities()}">
				<li><a href="viewAmenity.do?id=${a.id }">${a.name }</a></li>
			</c:forEach>
			<h4>Activities:</h4>
			<c:forEach var="a" items="${point.getActivities()}">
				<li><a href="viewActivity.do?id=${a.id }">${a.name }</a></li>
			</c:forEach>
			<h4>Comments:</h4>
			<c:forEach var="c" items="${point.getComments()}">
				<li><a href="viewComment.do?id=${c.id }">${c.commentText }</a></li>
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
	</div>
</body>
</html>