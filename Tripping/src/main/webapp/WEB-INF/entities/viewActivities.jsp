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
<meta
    content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
    name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">
   
    <jsp:include page="../navbar.jsp" />

	<div class="main-section" style="background-color: #F0FFFF;">
			<c:forEach var="activity" items="${activities}">
				<div class="entity-container card">
					<div class="section text-center entity-card-image"
						href="viewActivity.do?id=${activity.id }"
						style="background-image: url('${activity.imageUrl}'); height: 230px;">
						<h4 class="entity-title">
							<a href="viewActivity.do?id=${activity.id }" style="font-family: 'Ranchers', cursive;
    color: orange;
    font-size: 36px;
    text-shadow: 1px 1px green;">${activity.name }</a>
						</h4>
					</div>
				</div>
			</c:forEach>
		</div>
		
	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>