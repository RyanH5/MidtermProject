<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
</head>
<body>
	<c:forEach var="p" items="${allpoints}">
		<button type="button" class="btn btn-danger">Remove Point</button>
		<h4>Point of Interest ID ${p.id }</h4>
		<li><a href="getPoint.do?fid=${p.id }">${p.name }</a></li>
		<li><a href="getPoint.do?fid=${p.id }">${p.address }</a></li>
		<li><a href="getPoint.do?fid=${p.id }">${p.destination }</a></li>
		<li><a href="getPoint.do?fid=${p.id }">${p.shortDescription }</a></li>
		<li><a href="getPoint.do?fid=${p.id }">${p.longDescription }</a></li>
		<h2>Amenities:</h2>
		<c:forEach var="a" items="${p.getAmenities()}">
		<button type="button" class="btn btn-danger">Remove Amenity</button>
			<li><a href="getPoint.do?fid=${a.id }">${a.name }</a></li>
		</c:forEach>
		<h2>Activities:</h2>
		<c:forEach var="a" items="${p.getActivities()}">
		<button type="button" class="btn btn-danger">Remove Activity</button>
			<li><a href="getPoint.do?fid=${a.id }">${a.name }</a></li>
		</c:forEach>
		<h2>Comments:</h2>
		<c:forEach var="c" items="${p.getComments()}">
		<button type="button" class="btn btn-danger">Remove Comment</button>
			<li><a href="getPoint.do?fid=${c.id }">${c.commentText }</a></li>
			<br>
			<br>
		</c:forEach>
	</c:forEach>
</body>
</html>