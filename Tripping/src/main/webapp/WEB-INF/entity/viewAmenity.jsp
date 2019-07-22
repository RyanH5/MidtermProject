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
<title>${amenity.name }</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="../navbar.jsp" />
	<div class="wrapper">

		<div class="page-header section-dark"
			style="background-image: url('${amenity.iconUrl }')">
			<div class="filter"></div>
			<div class="content-center">
				<div class="container">
					<div class="title-brand">
						<h3 class="presentation-title">${amenity.name }</h3>
						<h6 class="category category-absolute">${amenity.longDescription }</h6>
						<h2 class="presentation-subtitle text-center"></h2>
					</div>
				</div>
				<div class="moving-clouds"
					style="background-image: url('./assets/img/clouds.png');"></div>
				<h6 class="category category-absolute text-center">${amenity.shortDescription }</h6>
			</div>
		</div>

		<div class="section text-center">
			<c:forEach var="point" items="${amenity.points }">
				<a href="viewPoint.do?id=${point.id }">${point.name }</a>
				<a href="viewPoint.do?id=${point.id }">${point.address.city }</a>
				<br>
			</c:forEach>
		</div>
	</div>
	<footer class="footer footer-black  footer-white ">
		<div class="container">
			<div class="row">
				<nav class="footer-nav"></nav>
			</div>
		</div>
	</footer>
	modals.jsp" /> bootstrapFoot.jsp" />
</body>
</html>