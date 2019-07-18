<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  			<input type="submit" value="Tripping" class="btn"/>
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
		
		</nav>
	</header>
	
	
	<!-- Admin btn to login or just regular login but slightly different views -->
	<!-- <footer>
		<form action="adminLogin.do" method="GET">
	  		<input type="submit" value="Admin" class="nav btn link">
	  	</form>
	</footer> -->

</body>
</html>