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
			<a href="userRegister.do">View User Registration</a><br> <a
				href="loginOrRegister.do">View User Login</a><br> <a
				href="viewProfile.do">View User Profile</a><br> <a
				href="indexWIP.do">View Index Work in Progress</a> <br> <a
				href="viewDestinations.do">View All Destinations</a><br> <a
				href="viewEvents">FIX ME: View All Events</a><br><a
				href="viewActivities.do">View All Activities</a><br><a
				href="viewUsers.do">FIX ME View All Users</a><br>
			<form action="viewDestination.do" method="GET">
				View Destination by ID: <input type="text" name="id" />
				<input type="submit" value="Get Destination" />
			</form>
			<form action="viewPoint.do" method="GET">
				View PoI by ID: <input type="text" name="id" /> <input
					type="submit" value="Get Point" />
			</form>
			
			<form action="viewUser.do" method="GET">
				FIXME: View Profile by User ID: <input type="text" name="id" /> <input
					type="submit" value="Get User" />
			</form>
			
			<form action="viewEvent.do" method="GET">
				Get Event by Event ID: <input type="text" name="id" /> 
				<input type="submit" value="Get Event" />
			</form>
			<form action="viewEvents.do" method="GET">
				Get All Event by Destination ID: <input type="text" name="id" /> 
				<input type="submit" value="Get Events" />
			
			<form action="viewActivity.do" method="GET">
				FIXME: View Activity by Activity ID: <input type="text" name="id" /> <input
					type="submit" value="Get Event" />
			</form>
			
			<form action="viewAmenity.do" method="GET">
				FIXME: View Amenity by Amenity ID: <input type="text" name="id" /> <input
					type="submit" value="Get Amenity" />
			</form>
			
			
		</nav>
	</header>

</body>
</html>
