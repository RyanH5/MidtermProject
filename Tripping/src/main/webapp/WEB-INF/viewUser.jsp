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
	<header>
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
			        <a class="nav-link disabled" href="">Admin</a>
			      <li class="nav-item">
			        <a class="nav-link active" href="#">WebUser</a>
			      </li>
			    </ul>
			</c:when>			
		</c:choose>
	</header>
	
	<form action="showUser.do" method="GET">
		Film ID: <input type="text" name="pid" /> <input type="submit"
			value="Show User" />
			</form>
		<hr>
		<c:choose>
		<c:forEach var="u" items="${users}">
			<li><a href="showUser.do?fid=${u.id }">${u.userName }</a></li>
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
				<h2>Journal Entries:</h2>
					<c:forEach var="journalentry" items="${user.journalEntries}">
						<ul>
							<li>${user.journalentry }</li>
						</ul>
					</c:forEach>
				</c:when>
				</c:choose>
				<c:otherwise> No User Here</c:otherwise>
				
				<%-- 
				<h2>Event Reviews:</h2>
				<c:forEach var="a" items="${u.getEventReviews)}">
					<li><a href="showUser.do?fid=${a.id }">${a.userName }</a></li>
				</c:forEach>
				<h2>Activities:</h2>
				<c:forEach var="a" items="${u.getDestReviews()}">
					<li><a href="showUser.do?fid=${a.id }">${a.userName }</a></li>
				</c:forEach>
				<h2>Comments:</h2>
				<c:forEach var="c" items="${u.getPointComments()}">
					<li><a href="showUser.do?fid=${u.id }">${u.pointComments }</a></li>
					<br>
					<br>
				</c:forEach>
				</c:forEach>
				<form action="updateUser.do" method="GET">
					<input type="hidden" value="${user.id}" name="userId" /> <input
						type="submit" value="Update" />
				</form>
				<br>
				<form action="deleteUser.do" method="POST">
					<input type="hidden" value="${user.id}" name="userId" /> <input
						type="submit" value="Delete" />
				</form>
				<br>
			</c:when>
			<c:otherwise>
				<h4>No User found</h4>
			</c:otherwise>
		</c:choose> --%> --%>
	<form action="goHome.do">
		<input type="submit" value="Return Home" />
	</form>
	<div></div>
	<form action="goHome.do">
		<input type="submit" value="Return Home" />
	</form>

</body>
</html>