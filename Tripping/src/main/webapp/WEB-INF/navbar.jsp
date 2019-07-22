<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav id="navExample" class="navbar navbar-expand-lg fixed-top navbar-transpart" style="background-color:#B0E0E6;" color-on-scroll="300" >
        <a href="/" class="nav-link">tripping</a>
			<c:choose>
				<c:when test="${! empty sessionScope.user}">
					<form action="userLogout.do" method="GET">
						<input type="submit" value="Logout" class="nav btn link">
					</form>
					<!-- <a href="viewProfile.do">View My Profile</a><br> -->
					<a href="viewProfile.do"><i class="fa fa-user-o" aria-hidden="true"></i></a> 
			
					<c:if test="${sessionScope.user.role.equals('admin')}">
						<form action="viewUser.do" method="GET">
							View User by User ID: <input type="text" name="id" /> <input
								type="submit" value="Get User" />
						</form>
			
						<a href="viewUsers.do">FIX ME View All Users</a><br>
					</c:if>
				</c:when>
				<c:otherwise>
		            <div class="navbar-translate"> 
		            	<a
		                    class="navbar-brand" href="#login" rel="tooltip"
		                    title="login" data-placement="bottom" data-toggle="modal"
		                    data-target="#loginModal"> login </a>
		                <button class="navbar-toggler navbar-toggler" type="button"
		                    data-toggle="collapse" data-target="#navigation"
		                    aria-controls="navigation-index" aria-expanded="false"
		                    aria-label="Toggle navigation">
		                    <span class="navbar-toggler-bar bar1"></span> <span
		                        class="navbar-toggler-bar bar2"></span> <span
		                        class="navbar-toggler-bar bar3"></span>
		                </button>
		            </div>
		            <div class="navbar-translate">
		                <a class="navbar-brand" href="#register" rel="tooltip"
		                    title="login" data-placement="bottom" data-toggle="modal"
		                    data-target="#registerModal"> register </a>
		                <button class="navbar-toggler navbar-toggler" type="button"
		                    data-toggle="collapse" data-target="#navigation"
		                    aria-controls="navigation-index" aria-expanded="false"
		                    aria-label="Toggle navigation">
		                </button>
		            </div>
				</c:otherwise>
			</c:choose>
            <div class="collapse navbar-collapse justify-content-end"
                id="navigation">
                <ul class="navbar-nav">
                    <li class="nav-item"><a href="viewActivities.do"
                        class="nav-link"><i class="nc-icon nc-layout-11"></i>
                            Activities</a></li>
                    <li class="nav-item"><a href="viewDestinations.do"
                        class="nav-link"><i class="nc-icon nc-layout-11"></i>
                            Destinations</a></li>
                    <li class="nav-item"><a href="viewEvents.do" class="nav-link"><i
                            class="nc-icon nc-layout-11"></i> Events</a></li>
                    <li class="nav-item"><a class="nav-link" rel="tooltip"
                        title="Star on GitHub" data-placement="bottom"
                        href="https://github.com/RyanH5/MidtermProject"> <i
                            class="fa fa-github"></i>
                            <p class="d-lg-none">GitHub</p>
                    </a></li>
                </ul>
            </div>
        </div>
    </nav>
