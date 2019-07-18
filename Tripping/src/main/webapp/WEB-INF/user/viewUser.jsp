<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tripping</title>
</head>
</head>
<body>
	<hr>
	<c:choose>
		<c:when test="${! empty user}">
			<h4>User Info</h4>
			<p>ID: ${user.id}</p>
			<p>Username: ${user.userName}</p>
			<p>First Name: ${user.firstName}</p>
			<p>Last Name: ${user.lastName}</p>
			<p>Don't look at this password: ${user.password}</p>
			<p>Create Date: ${user.createDate }</p>
			<p>Email: ${user.email }</p>
			<p>Image: ${user.imageURL }</p>
			<p>Role: ${user.role }</p>
			<p>Active: ${user.active }</p>
		</c:when>
		<c:otherwise> No User Here</c:otherwise>
	</c:choose>
</body>
</html>