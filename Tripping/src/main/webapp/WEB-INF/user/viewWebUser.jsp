<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
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
			<h2>Welcome, ${user.userName }</h2>
		</section>
	<c:choose>
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
		</c:when>
		<c:otherwise> No User Here</c:otherwise>
	</c:choose>
</body>
--%>

<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img//apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img//favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Tripping User Profile
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
 
</head>

<body class="profile-page sidebar-collapse">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="/" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom">
          tripping
        </a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar bar1"></span>
          <span class="navbar-toggler-bar bar2"></span>
          <span class="navbar-toggler-bar bar3"></span>
        </button>
      </div>
      		<div class="collapse navbar-collapse justify-content-end"
			id="navigation">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="viewActivities.do"
						class="nav-link"><i class="nc-icon nc-layout-11"></i>
							Activities</a></li>
					<li class="nav-item"><a href="viewDestinations.do"
						class="nav-link"><i class="nc-icon nc-layout-11"></i>
							Destinations</a></li>
					<li class="nav-item"><a href="viewEvents.do" 
					class="nav-link"><i class="nc-icon nc-layout-11"></i>
							Events</a></li>
				<li class="nav-item"><a class="nav-link" rel="tooltip"
					title="Star on GitHub" data-placement="bottom"
					href="https://github.com/RyanH5/MidtermProject" >
						<i class="fa fa-github"></i>
						<p class="d-lg-none">GitHub</p>
				</a></li>
			</ul>
		</div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div class="page-header page-header-xs" data-parallax="true" style="background-image: url(https://www.thomasmangan.com/images/xl/LongsPeakGlacierGorge12.2.14.2.jpg);
    background-position-y: 42%;">
    <div class="filter"></div>
  </div>
  <div class="section profile-content">
    <div class="container">
      <div class="owner">
        <div class="avatar">
          <img src="${user.imageURL }" alt="Circle Image" class="img-circle img-no-padding img-responsive">
        </div>
        <div class="name">
          <h4 class="title">${user.userName }
            <br />
					</h4>
					<h6 class="description">${user.role }</h6>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 ml-auto mr-auto text-center">
					<p>Biography Placeholder?</p>
					<br />
					<btn class="btn btn-outline-default btn-round"> <i
						class="fa fa-cog"></i> Settings</btn>
				</div>
			</div>
			<br />
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
									<div class="row">
<!-- 							<div class="col-lg-2 col-md-4 col-4 ml-auto mr-auto">
											<img src="../assets/img/faces/clem-onojeghuo-2.jpg"
												alt="Circle Image"
												class="img-circle img-no-padding img-responsive">
										</div> -->
										<div class="col-lg-7 col-md-4 col-4  ml-auto mr-auto">
											<div class="section text-center">
												<c:forEach var="entry"
													items="${user.getJournalEntries() }">
													<em><h2>${entry.getTitle() }</h2></em>
													<a href="viewDestination.do?id=${entry.id }">${entry.getCreateDate() }</a>
													<a href="viewDestination.do?id=${entry.id }">${entry.getEntryText() }</a>
													<h4>Event:</h4>
													<a href="viewEvent.do?id=${entry.getEvent().getId() }">${entry.getEvent().getName() }</a>
													<h4>Destination:</h4>
													<a
														href="viewDestination.do?id=${entry.getDestination().getId() }">${p.getDestination().getName() }</a>
													<br>
													<h4>Activity:</h4>
													<a
														href="viewActivity.do?id=${entry.getActivity().getId() }">${p.getActivity().getName() }</a>
													<br>
												</c:forEach>
											</div>
										</div>
										<div class="col-lg-3 col-md-4 col-4  ml-auto mr-auto">
											<div class="form-check">
												<label class="form-check-label"> <input
													class="form-check-input" type="checkbox" value="" checked>
													<span class="form-check-sign"></span>
												</label>
											</div>
										</div>
									</div>
								</li>
								<hr />
								<li>
									<div class="row">
										<div class="col-lg-2 col-md-4 col-4 mx-auto ">
											<img src="./assets/img/faces/ayo-ogunseinde-2.jpg"
												alt="Circle Image"
												class="img-circle img-no-padding img-responsive">
										</div>
										<div class="col-lg-7 col-md-4 col-4">
											<h6>
												Banks <br /> <small>Singer</small>
											</h6>
										</div>
										<div class="col-lg-3 col-md-4 col-4">
											<div class="form-check">
												<label class="form-check-label"> <input
													class="form-check-input" type="checkbox" value="">
													<span class="form-check-sign"></span>
												</label>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="tab-pane text-center" id="following" role="tabpanel">
					<h3 class="text-muted">You havent tripped yet! :(</h3>
					<button class="btn btn-warning btn-round">Find Things to
						Do</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<footer class="footer    ">
		<div class="container">
			<div class="row">
				<nav class="footer-nav">
					<ul>
						<li><a href="/" >Trip Blog</a></li>
						<li><a href="https://www.creative-tim.com/license"
							>Licenses</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</footer>
	<!--   Core JS Files   -->
	<script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="./assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="./assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
	<script src="./assets/js/plugins/moment.min.js"></script>
	<script src="./assets/js/plugins/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
	<script src="./assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
	<!--  Google Maps Plugin    -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<script>
		$(document).ready(function() {

			if ($("#datetimepicker").length != 0) {
				$('#datetimepicker').datetimepicker({
					icons : {
						time : "fa fa-clock-o",
						date : "fa fa-calendar",
						up : "fa fa-chevron-up",
						down : "fa fa-chevron-down",
						previous : 'fa fa-chevron-left',
						next : 'fa fa-chevron-right',
						today : 'fa fa-screenshot',
						clear : 'fa fa-trash',
						close : 'fa fa-remove'
					}
				});
			}

			function scrollToDownload() {

				if ($('.section-download').length != 0) {
					$("html, body").animate({
						scrollTop : $('.section-download').offset().top
					}, 1000);
				}
			}
		});
	</script>
	</body>
</html>
