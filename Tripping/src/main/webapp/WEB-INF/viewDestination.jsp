<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Destination</title>
</head>
</head>
<body>
	<form action="getDestination.do" method="GET">
		Destination ID: <input type="text" name="pid" /> <input type="submit"
			value="Show Destination" />
		<hr>
		<c:forEach var="d" items="${destinations}">
			<li><a href="getDestination.do?fid=${d.id }">${d.name }</a></li>
		</c:forEach>
	</form>
</body>
</html>