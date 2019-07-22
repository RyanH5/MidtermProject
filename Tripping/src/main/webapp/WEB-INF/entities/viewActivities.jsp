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
<title>activities</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="../navbar.jsp" />
	<div class="wrapper">

		<div class="main-section" style="background-color: #F0FFFF;">
			<c:forEach var="activity" items="${activities}">
				<div class="entity-container card">
					<div class="section text-center entity-card-image"
						href="viewActivity.do?id=${activity.id }"
						style="background-image: url('${activity.imageUrl}'); height: 230px;">
					</div>
					<div class="entity-content dest">
						<h6 class="entity-title">
							<a href="viewActivity.do?id=${activity.id }">${activity.name }</a>
						</h6>
					</div>
				</div>
			</c:forEach>
		</div>


		<div class="container">
			<div class="row">
				<nav class="footer-nav"></nav>
			</div>
		</div>

		<jsp:include page="../modals.jsp" />
		<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>