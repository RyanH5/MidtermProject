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
<title>${destination.name}</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="../navbar.jsp" />
	<div class="wrapper">

		<div class="page-header section-dark"
			style="background-image: url('${destination.image }')">
			<div class="filter"></div>
			<div class="content-center">
				<div class="container">
					<div class="title-brand">
						<h3 class="presentation-title">${destination.name }</h3>
						<h6 class="category category-absolute">${destination.description }</h6>
						<h2 class="presentation-subtitle text-center"></h2>
					</div>
				</div>
				<div class="moving-clouds"
					style="background-image: url('./assets/img/clouds.png');"></div>
				<h6 class="category category-absolute text-center"></h6>
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
				<c:forEach var="activity" items="${point.getActivities()}">
					<a href="viewActivity.do?id=${activity.id }">
					<span>${activity.iconUrl }</span></a>
				</c:forEach>
				<br></h3> 
				
				<h3>Comments</h3>
				<c:forEach var="comment" items="${point.getComments()}">
					<a href="viewUser.do?id=${comment.user.id }">${comment.user.userName }</a>
				${comment.commentText }
	<c:forEach var="point" items="${destination.points }"></c:forEach>
			</c:forEach> --%>

<jsp:include page="../modals.jsp" />
<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>