<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- Material Kit CSS -->
<link href="assets/css/material-kit.css?v=2.0.5" rel="stylesheet" />
<title>Events</title>
</head>
<body>

	<c:forEach var="e" items="${events}">
		<div class="section text-center">
			<h2>${e.name }</h2>
			<a href="viewEvent.do?id=${d.id }">${d.name }</a><br>
			<a href="viewEvent.do?id=${d.id }">${d.description }</a><br>
			
		
			<h4>Starting: ${e.startDate}</h4>
			<h4>Ending: ${e.endDate}</h4>
			<p>${e.eventDetails}</p>
			
		</div>
	</c:forEach>

</body>
</html>