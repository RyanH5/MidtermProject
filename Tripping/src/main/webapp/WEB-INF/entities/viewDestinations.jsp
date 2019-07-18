<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>
<title>Destination: ${destination.name}</title>
<!-- Required meta tags -->
<meta charset="utf-8">
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
</head>
<body>
	<c:forEach var="d" items="${dests}">
		<div class="section text-center">
			<h2>${d.name }</h2>
			<a href="viewDestination.do?id=${d.id }">${d.name }</a><br>
			<a href="viewDestination.do?id=${d.id }">${d.description }</a><br>
			<h4>Points Of Interest:</h4>
			<c:forEach var="p" items="${d.getPoints()}">
				<a href="viewPoint.do?id=${p.id }">${p.name }</a><br>
			</c:forEach>
		</div>
	</c:forEach>
</body>

</html>
