
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
<title>events</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />

	<div class="main-section" style="background-color: #F0FFFF;">
		<c:forEach var="event" items="${events}">
			<div class="entity-container card" style="position: relative;
    													height: 230px;">
				<div class="section text-center entity-card-image"
					href="viewEvent.do?id=${event.id }"
					style="background-image: url('${event.images.get(0).imageUrl}'); height: 230px;">
				</div>
				<h6 class="entity-title" style="position: absolute;
											    top: 82px;
											    width: 100%;
											    z-index: 1;">
					<a href="viewEvent.do?id=${event.id }" style="font-family: 'Ranchers', cursive;
    color: orange;
    font-size: 36px;
    text-shadow: 1px 1px green;">${event.name }</a>
				</h6>
				<%-- <c:choose>
					<c:when test="${! empty sessionScope.user}">
						<a href="#review" class="navbar-brand" rel="tooltip"
								title="login" data-placement="bottom" data-toggle="modal"
								data-target="#reviewModal" style="margin-top: 8px;
								    width: 95%;
								    color: orange;
								    text-align: center;
								    font-weight: 400;"> Add To Trip Journal </a>
					</c:when>
					<c:otherwise>
						<a class="navbar-brand" href="#register" rel="tooltip" title="login"
					data-placement="bottom" data-toggle="modal"
					data-target="#registerModal" style="margin-top: 8px;
								    width: 95%;
								    color: orange;
								    text-align: center;
								    font-weight: 400;"> Register to Create a trip </a>
					
					</c:otherwise>
				</c:choose> --%>
			</div>
		</c:forEach>
	</div>

	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>