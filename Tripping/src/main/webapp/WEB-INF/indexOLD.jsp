<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tripping</title>
</head>
<body>
	<header class="header">
		<form action="/" method="GET">
			<input type="submit" value="Tripping" class="btn" />
		</form>
		<nav>
			<!--  ************** when: IF LOGGED IN  **********************-->
			<!--  ************** if: IF ADMIN      *************-->
			<!--  ************** otherwise: IF VISITOR *************-->
			<!--  ************** outside choose: ALL  **************-->
			<c:choose>
				<c:when test="${! empty sessionScope.user}">
					<form action="userLogout.do" method="GET">
						<input type="submit" value="Logout" class="nav btn link">
					</form>
					<a href="viewProfile.do">View My Profile</a><br>

					<c:if test="${sessionScope.user.role.equals('admin')}">
						<form action="viewUser.do" method="GET">
							View User by User ID: <input type="text" name="id" /> <input
								type="submit" value="Get User" />
						</form>

						<a href="viewUsers.do">FIX ME View All Users</a><br>
					</c:if>
				</c:when>
				<c:otherwise>
					<a href="userRegister.do">View User Registration</a><br>
					<a href="loginOrRegister.do">View User Login</a><br>
				</c:otherwise>
			</c:choose>
			<a href="shellTemplate.do">View Shell Template</a><br>
				href="viewProfile.do">View User Profile</a><br> <a
				href=indexOLD.jsp>View Index Old</a> <br> <a
				href="viewUsers.do">View All Users</a><br>
			
			<form action="viewDestination.do" method="GET">
				View Destination by ID: <input type="text" name="id" />
				<input type="submit" value="Get Destination" />
			</form>
			<form action="viewPoint.do" method="GET">
				View PoI by ID: <input type="text" name="id" /> <input
					type="submit" value="Get Point" />
			</form>
			<form action="viewEvent.do" method="GET">
				Get Event by Event ID: <input type="text" name="id" />
				<input type="submit" value="Get Event" />
			</form>
			<form action="viewEventsByDestination.do" method="GET">
				Get All Event by Destination ID: <input type="text" name="id" />
				<input type="submit" value="Get Events" />
			</form>
			<form action="viewActivity.do" method="GET">
				View Activity by Activity ID: <input type="text" name="id" /> <input
					type="submit" value="Get Event" />
			</form>
			<form action="viewAmenity.do" method="GET">
				View Amenity by Amenity ID: <input type="text" name="id" /> <input
					type="submit" value="Get Amenity" />
			</form>
		</nav>
	</header>


</body>
</html>
