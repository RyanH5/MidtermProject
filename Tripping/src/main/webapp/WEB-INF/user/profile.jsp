<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
			<footer>
				<c:choose>
					<c:when test="${sessionScope.user.role.equals('admin')}">
						<ul class="nav nav-pills card-header-pills">
					      <li class="nav-item">
					        <a class="nav-link active" href="">Active</a>
					      <li class="nav-item">
					        <a class="nav-link disabled" href="#">Inactive</a>
					      </li>
					    </ul>
					    <ul class="nav nav-pills card-header-pills">
					      <li class="nav-item">
					        <a class="nav-link active" href="">Admin</a>
					      <li class="nav-item">
					        <a class="nav-link disabled" href="#">WebUser</a>
					      </li>
					    </ul>
					</c:when>			
				</c:choose>
	</footer>
</body>
</html>