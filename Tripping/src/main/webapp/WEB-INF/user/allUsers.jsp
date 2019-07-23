<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img//apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img//favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>${event.name}</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<jsp:include page="../bootstrapHead.jsp" />
</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="../navbar.jsp" />
</head>

<div class="wrapper" style="background-color:#B0E0E6; margin-top:72px;">
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th class="text-center">#</th>
					<th>User</th>
					<th>Role</th>
					<th>Since</th>
					<th class="text-right">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<tr>
						<td class="text-center">${user.id }</td>
						<td>${user.userName }</td>
						<td>${user.role }</td>
						<td>${user.createDate }</td>
						<td class="td-actions text-right"><a
							href="viewUser.do?id=${user.id }">
								<button type="button" rel="tooltip" title="View Profile"
									class="btn btn-info btn-simple btn-xs">
									<i class="fas fa-user"></i>
								</button>
						</a><a href="updateProfile.do?id=${user.id }">
								<button type="button" rel="tooltip" title="Update Profile"
									class="btn btn-success btn-simple btn-xs">
									<i class="fas fa-edit"></i>
								</button>
						</a><a href="markInactive.do?id=${user.id }">
								<button type="button" rel="tooltip" title="Mark Inactive"
									class="btn btn-danger btn-simple btn-xs">
									<i class="fas fa-times"></i>
								</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th class="text-center">#</th>
					<th>Activity</th>
					<th class="text-right">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="activity" items="${activities}">
					<tr>
						<td class="text-center">${activity.id }</td>
						<td>${activity.name }</td>
						<td class="td-actions text-right"><a
							href="viewActivity.do?id=${activity.id }">
								<button type="button" rel="tooltip" title="View Activity"
									class="btn btn-info btn-simple btn-xs">
									<i class="fas fa-map-pin"></i>
								</button>
						</a><a href="updateActivity.do?id=${activity.id }">
								<button type="button" rel="tooltip" title="Update Activity"
									class="btn btn-success btn-simple btn-xs">
									<i class="fas fa-edit"></i>
								</button>
						</a><a href="deleteActivity.do?id=${activity.id }">
								<button type="button" rel="tooltip" title="Remove Activity"
									class="btn btn-danger btn-simple btn-xs">
									<i class="fas fa-times"></i>
								</button>
						</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th class="text-center">#</th>
					<th>Destinations</th>
					<th class="text-right">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="destination" items="${destinations}">
					<tr>
						<td class="text-center">${destination.id }</td>
						<td>${destination.name }</td>
						<td class="td-actions text-right"><a
							href="viewDestination.do?id=${destination.id }">
								<button type="button" rel="tooltip" title="View Destination"
									class="btn btn-info btn-simple btn-xs">
									<i class="fas fa-map-pin"></i>
								</button>
						</a><a href="updateDestination.do?id=${destination.id }">
								<button type="button" rel="tooltip" title="Update Destination"
									class="btn btn-success btn-simple btn-xs">
									<i class="fas fa-edit"></i>
								</button>
						</a><a href="deleteDestination.do?id=${destination.id }">
								<button type="button" rel="tooltip" title="Remove Destination"
									class="btn btn-danger btn-simple btn-xs">
									<i class="fas fa-times"></i>
								</button>
						</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<jsp:include page="../modals.jsp" />
	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>
