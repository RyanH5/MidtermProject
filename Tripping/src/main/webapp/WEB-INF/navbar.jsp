<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav id="tripping navExample"
	class="navbar navbar-expand-lg fixed-top"
	style="background-color: #B0E0E6 !important; padding-top: 0px;">
	<a class="navbar-brand" href="/" rel="tooltip" title="login"
		data-placement="bottom"> tripping </a>
	<c:choose>
		<c:when test="${! empty sessionScope.user}">
			<a href="userLogout.do" class="navbar-brand" >
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation"></button> 
					<i class="fas fa-sign-out-alt"></i>logout
			</a>
			<a href="viewProfile.do" name="user" value="${sessionScope.user}">
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation"></button>
					<i class="fas fa-user-circle"></i>
			</a>

			<c:if test="${sessionScope.user.role.equals('admin')}">
				<ul>
					<li class="nav-item">
						<form action="viewUser.do" method="GET">
							View User by User ID: <input type="text" name="id" /> <input
								type="submit" value="Get User" />
						</form>
					</li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="view users" data-placement="bottom" href="viewUsers.do">
							<i class="fas fa-users"></i>
							<p class="d-lg-none">Users</p>
					</a></li>
				</ul>
			</c:if>
		</c:when>
		<c:otherwise>
			<div class="navbar-translate">
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation"></button>
				<a class="navbar-brand" href="#login" rel="tooltip" title="login"
					data-placement="bottom" data-toggle="modal"
					data-target="#loginModal"> login </a>
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation"></button>
				<a class="navbar-brand" href="#register" rel="tooltip" title="login"
					data-placement="bottom" data-toggle="modal"
					data-target="#registerModal"> register </a>
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-bar bar1"></span><span
						class="navbar-toggler-bar bar2"></span><span
						class="navbar-toggler-bar bar3"></span>
				</button>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="collapse navbar-collapse justify-content-end"
		id="navigation">
		<ul class="navbar-nav">
			<li class="nav-item"><a href="viewActivities.do"
				class="nav-link"><span></span><i class="fas fa-hiking"></i></span> Activities
			</a></li>
			<li class="nav-item"><a href="viewDestinations.do"
				class="nav-link"><i class="fas fa-globe-americas"></i>
					Destinations</a></li>
			<li class="nav-item"><a href="viewEvents.do" class="nav-link"><i
					class="fas fa-calendar-week"></i> Events</a></li>
		</ul>
	</div>
	</div>
</nav>
