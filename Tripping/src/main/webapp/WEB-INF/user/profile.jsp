<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header">
		<form action="/" method="GET">
  			<input type="submit" value="Tripping" class="btn"/>
		</form>
		<nav>
		<!--  MUST FIX::::: UPDATE TO USER LOGOUT -->
			<form action="userLogin.do" method="GET">
	  	<input type="submit" value="Logout" class="nav btn link"/>
	  </form>
		</nav>
	</header>
		<section>
			<h1>${user.userName}</h1>
			<h2>Welcome, ${user.firstName } ${user.lastName }</h2>
		</section>

</body>
</html>