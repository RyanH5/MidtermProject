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

<!-- <iframe width="600" height="450" frameborder="0" style="border:0"
src="https://www.google.com/maps/embed/v1/undefined?origin=...&q=...&destination=...&center=...&zoom=...&key=..." allowfullscreen></iframe> -->

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d97339.57009080713!2d-105.73085884535733!3d40.
323229800042505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x5045e02d2e61a31b!2sBear+Lake+Trailhead!5e0!
3m2!1sen!2sus!4v1563643146148!5m2!1sen!2sus" width="500" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12689.841880512107!2d-108.42451856512204!3d37
.331605889380675!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x87395d65f60244d5%3A0x49eea8f56e31083b
!2sMesa+Verde+Entrance%2C+Mancos%2C+CO+81328!5e0!3m2!1sen!2sus!4v1563644107298!5m2!1sen!2sus"
 width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
 
<!-- <iframe src="https://www.google.com/maps/@?api=1&map_action=map&parameters" allowfullscreen></iframe> -->
 
 
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