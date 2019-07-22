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
<!-- <body class="index-page sidebar-collapse"> -->
	<div class="main-section" style="height:150vh;background-color:
	#CCDAEF;">
<!-- 	#BBD2F4;"> -->
<!-- 	#F0FFFF;"> -->
		<!-- <div class="entity-container card"> -->
		<div class="card" style="height:fit-content;width: 20rem;margin-top:100px;">
			<div class="card-body">
				<h4 class="card-title">${event.name}</h4>
				<%-- <h2>${event.name}</h2> --%>
			<h6 class="card-subtitle mb-2 text-muted"${event.shortDescription}></h6>
			<p class="card-text">${event.longDescription }</p>
			<h5>From: <br>
			${event.startDate } - <br>
			${event.endDate }</h5>
			<h5">${event.eventDetails }</h5>
			<a href="#review" class="navbar-brand" rel="tooltip"
						title="login" data-placement="bottom" data-toggle="modal"
						data-target="#reviewModal" style="color:deepskyblue;"> Add To Trip Journal </a>
		</div>
	</div>
	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>