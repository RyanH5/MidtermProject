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

	<nav class="navbar navbar-expand-lg fixed-top"
		color-on-scroll="300" style="background-color:#B0E0E6">
		<div class="container">	

			<div class="navbar-translate">
				<a href="viewProfile.do"><i class="fa fa-user-o" aria-hidden="true"></i></a> <a
					class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
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
				<a class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
					title="login" data-placement="bottom" data-toggle="modal"
					data-target="#registerModal"> register </a>
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-bar bar1"></span> <span
						class="navbar-toggler-bar bar2"></span> <span
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
	<!-- End Navbar -->

<div class="main-section">
	<c:forEach var="activity" items="${activities}">
		<div class="entity-container card">
			<div class="section text-center entity-card-image"
				href="viewActivity.do?id=${activity.id }"
				style="background-image: url('${activity.imageUrl}'); height: 230px;">
			</div>
			<div class="entity-content dest">
				<h6 class="entity-title">
					<a href="viewActivity.do?id=${activity.id }">${activity.name }</a>
				</h6>
			</div>
		</div>
	</c:forEach>
</div>
<!-- register modal -->
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
        <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog"
            aria-hidden="false">
            <div class="modal-dialog modal-register">
                <div class="modal-content">
                    <div class="modal-header no-border-header text-center">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="container">
          <h3>Trip to </h3>
          <div>
            <div class="row">
               <div class="col-md-5 col-sm-5">
              <!--  <h6>Upload Photo</h6>
                <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                  <div class="fileinput-new thumbnail img-no-padding" style="max-width: 370px; max-height: 250px;">
                    <img src="../assets/img/image_placeholder.jpg" alt="...">
                  </div>
                  <div class="fileinput-preview fileinput-exists thumbnail img-no-padding" style="max-width: 370px; max-height: 250px;"></div>
                  <div>
                    <span class="btn btn-outline-default btn-round btn-file">
                      <span class="fileinput-new">Select image</span>
                      <span class="fileinput-exists">Change</span>
                      <input type="file" name="...">
                    </span>
                    <a href="#paper-kit" class="btn btn-link btn-danger fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                  </div>
                </div> -->
                <h6>Privacy
                  <span class="icon-danger">*</span>
                </h6>
                <div class="form-check-radio">
                  <label class="form-check-label">
                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1"> Public
                    <span class="form-check-sign"></span>
                  </label>
                </div>
                <div class="form-check-radio">
                  <label class="form-check-label">
                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2" checked=""> Private
                    <span class="form-check-sign"></span>
                  </label>
                </div>
              </div>
              <div class="col-md-7 col-sm-7">
                <div class="form-group">
                  <h6>Trip Name
                    <span class="icon-danger">*</span>
                  </h6>
                  <input type="text" class="form-control border-input" placeholder="...">
                </div>
                <div class="form-group">
                  <h6>Trip Journal Entry</h6>
                  <textarea class="form-control textarea-limited" placeholder="" rows="13" maxlength="4500"></textarea>
                  <h5>
                    <small>
                      <span id="textarea-limited-message" class="pull-right">4500 characters left</span>
                    </small>
                  </h5>
                </div>
              </div>
            </div>
            <div class="row buttons-row">
              <div class="col-md-4 col-sm-4">
                <button class="btn btn-outline-danger btn-block btn-round" type="reset">Cancel</button>
              </div>
              <div class="col-md-4 col-sm-4">
                <button class="btn btn-outline-primary btn-block btn-round" type="submit">Save</button>
              </div>
            </div>
          </div>
        </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MODALS  -->
 
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