<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
</head>
<body>
	<form action="getPoint.do" method="GET">
		Film ID: <input type="text" name="pid" /> <input type="submit"
			value="Show Point" />
		<hr>
		<c:forEach var="p" items="${points}">
			<li><a href="getPoint.do?fid=${p.id }">${p.name }</a></li>
		</c:forEach>
	</form>
</body>
</html>