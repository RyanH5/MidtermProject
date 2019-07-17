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
			<form action="loginOrRegister.do" method="GET">
			<c:if test="${ empty sessionScope.user}">
	  			<input type="submit" value="Login" class="nav btn link">
	  		</c:if>
	  		<c:othewise>
	  			<input type="submit" value="Logout" class="nav btn link">
	  		</c:othewise>
	  </form>
		</nav>
	</header>

</body>
</html>