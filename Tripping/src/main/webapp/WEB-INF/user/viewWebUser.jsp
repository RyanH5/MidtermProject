
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img//apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img//favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>tripping</title>

<jsp:include page="../bootstrapHead.jsp" />

</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />
	<!-- End Navbar -->
	<div class="page-header page-header-xs" data-parallax="true"
		style="background-image: url(https://www.thomasmangan.com/images/xl/LongsPeakGlacierGorge12.2.14.2.jpg); background-position-y: 42%; z-index: 0;">
		<div class="filter"></div>
	</div>
	<div class="section profile-content">
		<div class="container" style="margin-top: -150px;">
			<div class="owner">
				<div class="trippingAvatar">
					<div class="col-lg-2 col-md-4 col-4 ml-auto mr-auto">
						<img src="${user.imageURL }" alt="Circle Image"
							class="tripping-avatar"
							style="vertical-align: middle; border-style: none; height: 150px; width: 150px; border-radius: 50%; z-index: 1; border: 2px solid rgb(120, 68, 59);">
					</div>
				</div>
				<div class="name">
					<h4 class="title">${user.userName }
						<br />
					</h4>
					<h6 class="description">${user.role }</h6>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 ml-auto mr-auto text-center"></div>
			</div>
			<div class="nav-tabs-navigation">
				<div class="nav-tabs-wrapper">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#follows" role="tab">Future Trips</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#following" role="tab">Past Trips</a></li>
					</ul>
				</div>
			</div>
			<!-- Tab panes -->
			<div class="tab-content following">
				<div class="tab-pane active" id="follows" role="tabpanel">
					<div class="row">
						<div class="col-md-6 ml-auto mr-auto">
							<ul class="list-unstyled follows">
								<li>
									<div class="col-lg-7 col-md-4 col-4  ml-auto mr-auto">
										<c:forEach var="entry" items="${user.getJournalEntries() }">
											<div class="section text-center"
												style="font-weight: 400; color: orange; background-image: url()";>
												<div class="row text-center">
													<em><h2>${entry.getTitle() }</h2></em> <a
														href="viewDestination.do?id=${entry.id }">${entry.getCreateDate() }</a>
													<a href="viewDestination.do?id=${entry.id }">${entry.getEntryText() }</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>

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
		</c:choose> --%>
