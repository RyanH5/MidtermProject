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
<title>amenities</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />

	<div class="main-section" style="background-color: #F0FFFF;">
		<c:forEach var="a" items="${amenities}">
			<div class="section text-center">
				<h2>${a.name }</h2>
				<a href="viewDestination.do?id=${a.id }">${a.name }</a><br> <a
					href="viewDestination.do?id=${a.id }">${a.iconUrl }</a><br>
				<h4>Points Of Interest:</h4>
				<c:forEach var="p" items="${a.getPoints()}">
					<a href="viewPoints.do?id=${p.id }">${p.name }</a>
					<br>
				</c:forEach>
			</div>
		</c:forEach>

	</div>
		<div class="container">
			<div class="row">
				<nav class="footer-nav"></nav>
			</div>
		</div>
	</footer>
	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>