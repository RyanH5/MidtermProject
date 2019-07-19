<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tripping</title>
<link rel="stylesheet" type="text/css" href="styles/index.css">
</head>
<body>
	<header class="header">
		<form action="/" method="GET">
			<input type="submit" value="Tripping" class="btn" />
		</form>
		<nav>
			<c:choose>
				<c:when test="${ empty sessionScope.user}">
					<form action="loginOrRegister.do" method="GET">
						<input type="submit" value="Login" class="nav btn link">
					</form>
				</c:when>
				<c:otherwise>
					<form action="userLogout.do" method="GET">
						<input type="submit" value="Logout" class="nav btn link">
					</form>
				</c:otherwise>
			</c:choose>
			<a href="userRegister.do">User Registration</a><br> <a
				href="loginOrRegister.do">User Login</a><br> <a
				href="viewProfile.do">User Profile</a><br> <a
				href="indexWIP.do">View New Index Work in Progress</a> <br> <a
				href="viewDestinations.do">View All Destinations</a><br> <a
				href="viewPoints.do">View All Points</a><br>
			<form action="viewDestination.do" method="GET">
				Get Destination by Destination ID: <input type="text" name="id" />
				<input type="submit" value="Get Destination" />
			</form>
			<form action="viewPoint.do" method="GET">
				Get Point by Point ID: <input type="text" name="id" /> <input
					type="submit" value="Get Point" />
			</form>
			<form action="viewUser.do" method="GET">
				Get User Profile by User ID: <input type="text" name="id" /> <input
					type="submit" value="Get User" />
			</form>
			<form action="viewEvent.do" method="GET">
				Get Event by Event ID: <input type="text" name="id" /> 
				<input type="submit" value="Get Event" />
			</form>
		</nav>
	</header>

</body>
</html>
