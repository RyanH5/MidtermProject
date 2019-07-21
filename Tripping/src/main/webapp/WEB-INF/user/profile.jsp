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
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./assets/css/paper-kit.css" rel="stylesheet" />
<link href="./assets/css/entitiesGrid.css" rel="stylesheet" />

</head>

<body class="index-page sidebar-collapse">

	<nav class="navbar navbar-expand-lg fixed-top navbar-transparent "
		color-on-scroll="300">
		<div class="container">	
			<!-- <div class="navbar-translate">
				<a href="viewProfile.do"><i class="fa fa-user-o" aria-hidden="true"></i></a> 
				
				<a class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
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
		
				<a class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
					title="login" data-placement="bottom" data-toggle="modal"
					data-target="#registerModal"> register </a>
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
				</button> -->
				<a href="/" class="nav-link">tripping</a>
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
					<li class="nav-item"><a href="viewEvents.do" class="nav-link"><i
							class="nc-icon nc-layout-11"></i> Events</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="Star on GitHub" data-placement="bottom"
						href="viewUsers.do"> <i
							class="fa fa-github"></i>
							<p class="d-lg-none">GitHub</p>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	<div class="page-header page-header-xs" data-parallax="true"
		style="background-image: url(https://www.thomasmangan.com/images/xl/LongsPeakGlacierGorge12.2.14.2.jpg); background-position-y: 42%;">
		<div class="filter"></div>
	</div>
	<div class="section profile-content"
		style="background-image: linear-gradient(120deg, #fccb90 0%, #d57eeb 100%);">
		<div class="container">
			<div class="owner">
				<div class="trippingAvatar">
					<img src="${sessionScope.user.imageURL }" alt="Circle Image"
						class="tripping-avatar">
				</div>
				<div class="name">
					<h4 class="username">${sessionScope.user.userName }
						<br />
					</h4>
					<h6 class="role">${sessionScope.user.role }</h6>
				</div>
			</div>
			<br />
			<div class="nav-tabs-navigation">
				<div class="nav-tabs-wrapper">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#follows" role="tab">Bucket List</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#following" role="tab">Complete</a></li>
					</ul>
				</div>
			</div>
			<!-- Tab panes -->
			<div class="tab-content following">
				<div class="tab-pane active" id="follows" role="tabpanel">
					<div class="row">
						<div class="col-md-6 ml-auto mr-auto">
							<ul class="list-unstyled follows">
								<c:forEach var="entry"
									items="${sessionScope.user.getJournalEntries() }">
									<li>
										<div class="row">
											<div class="col-lg-7 col-md-4 col-4  ml-auto mr-auto">
												<div class="section text-center"
													style="background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);">
													<h4>${entry.getTitle() }</h4>
													<div class="form-check">
														<label class="form-check-label"> <input
															class="form-check-input" type="checkbox" value="unchecked" checked>
															<span class="form-check-sign"></span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			<div class="tab-pane text-center" id="following" role="tabpanel">
				<h3 class="text-muted"></h3><a href="viewActivies.do">
				<button class="btn btn-warning btn-round">Find Things to Do</button></a>
			</div>
			</div>
		</div>
	</div>
	<footer class="footer footer-black  footer-white ">
		<div class="container">
			<div class="row">
				<nav class="footer-nav"></nav>
			</div>
		</div>
	</footer>
	<!-- Modal Bodies come here -->
	<!-- login modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-hidden="false">
		<div class="modal-dialog modal-register">
			<div class="modal-content">
				<div class="modal-header no-border-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h6 class="text-muted">Tripping</h6>
					<h3 class="modal-title text-center">Plan your next trip!</h3>
					<p>Log in to your account</p>
				</div>

				<form class="login-form" action="userLogin.do">
					<div class="modal-body">
						<div class="form-group">
							<label>Username</label> <input type="text" value=""
								name="userName" placeholder="username" class="form-control" />
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password" value=""
								name="password" placeholder="password" class="form-control" />
						</div>
						<button class="btn btn-block btn-round">Log in</button>
					</div>
					<div class="modal-footer no-border-footer">
						<span class="text-muted  text-center">Looking <a href="">create
								an account</a> ?
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- register modal -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-hidden="false">
		<div class="modal-dialog modal-register">
			<div class="modal-content">
				<div class="modal-header no-border-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h6 class="text-muted">Tripping</h6>
					<h3 class="modal-title text-center">Register</h3>
										<p>Create an account account</p>
					
				</div>
				<form class="register-form" action="createUser.do">
					<div class="modal-body">
						<div class="form-group">
							<label>Username</label> <input type="text" value=""
								name="userName" placeholder="username" class="form-control" />
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password" value=""
								name="password" placeholder="password" class="form-control" />
						</div>
						<button class="btn btn-block btn-round">Register</button>
				</form>
			</div>
		</div>
	</div>
	</div>
	<!-- END MODALS  -->
	<!--   end modal -->
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

</body>

</html>