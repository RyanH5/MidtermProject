<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

			<a href="viewProfile.do">User Profile</a><br> 
		</nav>
	</header>
	<main>
		<h1>${event.name}</h1>
		<br>
		<span>${event.shortDescription}</span>
		<br>
		<p>${event.longDescription }</p>
		<br>
		<h3>From: ${event.startDate } - ${event.endDate }</h3>
		<br>
		<h3>${event.endDate }</h3>
		<br>
		<p>${event.eventDetails }</p>
		<br>
		
		
	
			<a href="viewPoints.do">Return to Destination</a><br>
	</main>

</body>
</html>