<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>Tripping Login</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<!-- CSS Files -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./assets/css/paper-kit.css" rel="stylesheet" />

</head>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img//apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img//favicon.png">
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
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="../assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
</head>

<nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
	<div class="container">
		<div class="navbar-translate">
		<i class="fa fa-user-o" aria-hidden="true"></i>
			<a class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
				title="loginOrRegister.do" data-placement="bottom"
				target="_blank">login</a>
			<button class="navbar-toggler navbar-toggler" type="button"
				data-toggle="collapse" data-target="#navigation"
				aria-controls="navigation-index" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-bar bar1"></span><span
					class="navbar-toggler-bar bar2"></span><span
					class="navbar-toggler-bar bar3"></span>
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
					href="https://github.com/RyanH5/MidtermProject" target="_blank">
						<i class="fa fa-github"></i>
						<p class="d-lg-none">GitHub</p>
				</a></li>
			</ul>
		</div>
	</div>
</nav>
	<div class="section section-image section-login"
		style="background-image: url('https://i1.wp.com/www.borrowlenses.com/blog/wp-content/uploads/2016/06/String-Lake-at-Night.jpg?resize=1080%2C720&ssl=1');">
<!-- 	<div class="section section-image section-login"
		style="background-image: url('./assets/img/login-image.jpg');"> -->
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 mx-auto">
					<div class="card card-register" style="background-image: url('./assets/img/login-image.jpg');">
						<h3 class="title mx-auto">Welcome</h3>
						<div class="social-line text-center">
							<a href="#pablo"
								class="btn btn-neutral btn-facebook btn-just-icon mt-0"> <i
								class="fa fa-facebook-square"></i>
							</a> <a href="#pablo"
								class="btn btn-neutral btn-google btn-just-icon mt-0"> <i
								class="fa fa-google-plus"></i>
							</a> <a href="#pablo"
								class="btn btn-neutral btn-twitter btn-just-icon mt-0"> <i
								class="fa fa-twitter"></i>
							</a>
						</div>
						<form class="login-form" action="userLogin.do">
							<label>Username</label>
							<div class="input-group form-group-no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="nc-icon nc-email-85"></i>
									</span>
								</div>
								<input type="text" name="userName" class="form-control"
									placeholder="Username">
							</div>
							<label>Password</label>
							<div class="input-group form-group-no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="nc-icon nc-key-25"></i>
									</span>
								</div>
								<input type="text" name="password" class="form-control"
									placeholder="Password">
							</div>
							<button class="btn btn-primary btn-block btn-round" style="background-color: #563C77">Login</button>
						</form>
						<!-- <div class="forgot">
							<a href="#" class="btn btn-link btn-danger">Forgot password?</a>
						</div> -->
					</div>
					<div class="col text-center">
						<a href="userRegister.do"
							class="btn btn-outline-neutral btn-round btn-lg" target="_blank">View
							Register Page</a>
<!-- 					<div class="container">
 						<div class="row">
							<div class="col-lg-4 col-md-6 ml-auto mr-auto">
								<div class="card card-login">
									<form class="form" method="" action="">
										<div class="card-header card-header-primary text-center">
											<h4 class="card-title">Login</h4>
											<div class="social-line">
												<a href="#pablo" class="btn btn-just-icon btn-link"> <i
													class="fa fa-facebook-square"></i>
												</a> <a href="#pablo" class="btn btn-just-icon btn-link"> <i
													class="fa fa-twitter"></i>
												</a> <a href="#pablo" class="btn btn-just-icon btn-link"> <i
													class="fa fa-google-plus"></i>
												</a>
											</div>
										</div>
										<p class="description text-center">Or Be Classical</p>
										<div class="card-body">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">face</i>
													</span>
												</div>
												<input type="text" class="form-control"
													placeholder="First Name...">
											</div>
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">mail</i>
													</span>
												</div>
												<input type="email" class="form-control"
													placeholder="Email...">
											</div>
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">lock_outline</i>
													</span>
												</div>
												<input type="password" class="form-control"
													placeholder="Password...">
											</div>
										</div>
										<div class="footer text-center">
											<a href="#pablo"
												class="btn btn-primary btn-link btn-wd btn-lg">Get
												Started</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
 -->				</div>
		</div>
	</div>
	<!-- <h4>If you're already a user</h4>
	<form action="/" method="GET">
		<input type="submit" value="Tripping" class="btn" />
	</form>
	<nav></nav>
	<form action="userLogin.do" method="GET" class="login-"
		name="logInOrOut" value="login">
		<h2>Login</h2>
		<input type="hidden" value="login" />
		<div>
			<div class="form-inputs-container">
				<label for="userName">Username: </label> <input type="text"
					name="userName" class="form-input" placeholder="jSmith99">
			</div>
			<div>
				<label for="password">Password: </label> <input type="password"
					name="password" class="form-input" placeholder="Password">
			</div>
			<input type="submit" value="LOGIN" class="btn form-submit" />
		</div>
	</form>

	<h4>Otherwise, please create an account</h4>
	<form action="createUser.do" method="POST" modelAttribute="user"
		class="register-form">
		<h2>Register</h2>
		<div>
			<div class="form-inputs-container">
				<label for="userName">Username: </label> <input type="text"
					name="userName" class="form-input" placeholder="jSmith99">
			</div>
			<div>
				<label for="password">Password: </label> <input type="password"
					name="password" class="form-input" placeholder="Password">
			</div>
			<div>
				<label for="email">Email: </label> <input type="text" name="email"
					class="form-input" placeholder="jSmith@gmail.com">
			</div>
			<div>
				<label for="firstName">First name: </label> <input type="text"
					name="firstName" class="form-input" placeholder="John">
			</div>
			<div>
				<label for="lastName">Last name: </label> <input type="text"
					name="lastName" class="form-input" placeholder="Smith">
			</div>
			<input type="submit" value="Register" class="btn form-submit" />
		</div>
	</form> -->
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


