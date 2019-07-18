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