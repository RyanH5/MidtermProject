<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Tripping Login</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

    <!-- CSS Files -->
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./assets/css/paper-kit.css" rel="stylesheet" />

  </head>
  <body>
	<div class="section section-image section-login"
		style="background-image: url('./assets/img/login-image.jpg');">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 mx-auto">
					<div class="card card-register">
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
							<label>Email</label>
							<div class="input-group form-group-no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="nc-icon nc-email-85"></i>
									</span>
								</div>
								<input type="text" name="userName" class="form-control" placeholder="Username">
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
							<button class="btn btn-danger btn-block btn-round">Login</button>
						</form>
						<div class="forgot">
							<a href="#" class="btn btn-link btn-danger">Forgot password?</a>
						</div>
					</div>
					<div class="col text-center">
						<a href="userRegister.do"
							class="btn btn-outline-neutral btn-round btn-lg" target="_blank">View
							Register Page</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="/" method="GET">
		<input type="submit" value="Tripping" class="btn" />
	</form>
	<nav></nav>
	</header>
	<h4>If you're already a user</h4>
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
	</form>
</body>
<!--   Core JS Files   -->
<script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>

<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="./assets/js/plugins/bootstrap-switch.js"></script>

<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="./assets/js/plugins/nouislider.min.js" type="text/javascript"></script>

<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="./assets/js/plugins/moment.min.js"></script>
<script src="./assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

<!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/paper-kit.min.js" type="text/javascript"></script>
</html>



