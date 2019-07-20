<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Points in ${point.destination.getName()</title>
</head>
</head>
<body>
	<div class="mdl-card">
		<c:forEach var="point" items="${allpoints}">
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
				<c:forEach var="amenity" items="${point.getAmenities()}">
					<li><a href="getPoint.do?id=${amenity.id }">${amenity.name }</a></li>
				</c:forEach>
				<h4>Activities:</h4>
				<c:forEach var="activity" items="${point.getActivities()}">
					<li><a href="getPoint.do?id=${activity.id }">${activity.name }</a></li>
				</c:forEach>
				<h4>Comments:</h4>
				<c:forEach var="comment" items="${point.getComments()}">
					<li><a href="viewUser.do?id=${comment.id }">${comment.commentText }</a></li>
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