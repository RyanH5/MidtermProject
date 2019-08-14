<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg fixed-top" style="background-color: #F0FFFF; height:74px">

    <c:choose>
        <c:when test="${! empty sessionScope.user}">
            <a href="userLogout.do" class="navbar-brand"> <span><i class="fas fa-sign-out-alt"></i></span></a>
            <a href="viewProfile.do" name="user" value="${sessionScope.user}" style="margin: 9px 43% 0% 0%;">
                <img src="${sessionScope.user.imageURL }" alt="${sessionScope.user.userName }" class="img-circle img-no-padding img-responsive" width="45" height="45">
            </a>
            <c:if test="${sessionScope.user.role.equals('admin')}">
                <ul>
                    <li class="dropdown nav-item"><a href="#"
                        class="dropdown-toggle nav-link" id="navbarDropdownMenuLink"
                        data-toggle="dropdown"> Admin </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-danger"
                            aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" data-scroll="true"
                                data-id="#destinations" href="modal"> <i
                                class="nc-icon nc-tile-56"></i> Add Destination
                            </a> <a class="dropdown-item" data-scroll="true" data-id="#points"
                                href="modal"> <i class="nc-icon nc-settings"></i> Add Point
                            </a> <a class="dropdown-item" data-scroll="true" data-id="#events"
                                href="modal"> <i class="nc-icon nc-bullet-list-67"></i> Add
                                Event
                            </a> <a class="dropdown-item" data-scroll="true" data-id="#users"
                                href="viewUsers.do"> <i class="fas fa-users"></i> View All
                                Users
                            </a>
                        </div>
                    </li>
                </ul>
            </c:if>
        </c:when>
        <c:otherwise>
            <ul class="navbar-nav" id="navbar-login-links" style="flex-direction: row; padding-left: 15px;">
	            <li class="nav-item">
		        	<a class="navbar-brand" href="/" rel="tooltip" title="tripping" data-placement="bottom" style="width: 95%; color: orange; text-align: center; font-weight: 800;"> tripping </a>
		        </li>
                <li class="nav-item">
                <a class="navbar-brand" href="#login" style="width: 95%; color: orange; text-align: center; font-weight: 800;" rel="tooltip" title="login" data-placement="bottom" data-toggle="modal" data-target="#loginModal"> login </a>
                </li>
                <li>
                <!-- a class="navbar-brand" href="#register" rel="tooltip"
                    title="register" data-placement="bottom" data-toggle="modal"
                    data-target="#registerModal"
                    style="width: 95%; color: orange; text-align: center; font-weight: 800;">
                    Register </a> -->
                </li>
            </ul>
        </c:otherwise>
    </c:choose>
    <div class="collapse navbar-collapse justify-content-end"
        id="navigation">
        <ul class="navbar-nav">
            <li class="nav-item"><a href="viewActivities.do"
                class="nav-link"><span><i class="fas fa-hiking"></i></span> Activities </a></li>
            <li class="nav-item"><a href="viewDestinations.do" class="nav-link"><i class="fas fa-globe-americas"></i>  Destinations</a></li>
            <li class="nav-item"><a href="viewEvents.do" class="nav-link"><i class="fas fa-calendar-week"></i> Events</a></li>
        </ul>
    </div>
    <div class="navbar-translate" style="justify-content: flex-end !important; display: flex !important; bottom: 49px; z-index: -1;">
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar bar1"></span>
            <span class="navbar-toggler-bar bar2"></span>
            <span class="navbar-toggler-bar bar3"></span>
        </button>
    </div>
</nav>