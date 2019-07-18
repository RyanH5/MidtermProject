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
			<form action="userLogout.do" method="GET">
	  	<input type="submit" value="logout" class="nav btn link"/>
	  </form>
		</nav>
	</header>
		<section>
			
			<h2>Welcome, ${sessionScope.user.userName }</h2>
		</section>

</body>
</html>