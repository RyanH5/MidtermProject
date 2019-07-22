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
<title>${event.name}</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />
</head>
<body class="index-page sidebar-collapse">
	<div class="main-section" style="background-color: #F0FFFF;">
		<div class="entity-container card">
			<h2>${event.name}</h2>
			<br> <span>${event.shortDescription}</span> <br>
			<p>${event.longDescription }</p>
			<br>
			<h3>From: ${event.startDate } - ${event.endDate }</h3>
			<br>
			<h3>${event.endDate }</h3>
			<br>
			<p>${event.eventDetails }</p>
			<br>
		</div>
	</div>
	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>