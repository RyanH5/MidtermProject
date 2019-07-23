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
<!--    navbar come here          -->
<!-- end navbar  -->
<div class="wrapper">
<div class="card card-raised card-form-horizontal no-transition">
                  <div class="card-body __web-inspector-hide-shortcut__">
                    <form method="" action="">
                      <div class="row">
                        <div class="col-md-3">
                          <div class="form-group">
                            <input type="text" value="" placeholder="Activity" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <input type="text" value="" placeholder="Destination" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <input type="text" value="" placeholder="Event Date" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-3">
                          <button type="button" class="btn btn-danger btn-block"><i class="nc-icon nc-zoom-split"></i> &nbsp; Search</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div></div>
                
                <br><br>
                
                
           <button type="button" class="btn btn-success btn-round" data-toggle="modal" data-target="#loginModal">
              Login
            </button>
    
    <br><br>
    
    
    
    
    <div class="comments media-area">
                    <h3 class="text-center">Comments</h3>
                    <div class="media">
                      <a class="pull-left" href="#paper-kit">
                        <div class="avatar">
                          <img class="media-object" alt="Tim Picture" src="../assets/img/faces/clem-onojeghuo-3.jpg">
                        </div>
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading">John Lincoln</h5>
                        <div class="pull-right">
                          <h6 class="text-muted">Sep 11, 11:54 AM</h6>
                          <a href="#paper-kit" class="btn btn-info btn-link pull-right "> <i class="fa fa-reply"></i> Reply</a>
                        </div>
                        <p>Hello guys, nice to have you on the platform! There will be a lot of great stuff coming soon. We will keep you posted for the latest news.</p>
                        <div class="media">
                          <a class="pull-left" href="#paper-kit">
                            <div class="avatar">
                              <img class="media-object" alt="64x64" src="../assets/img/faces/clem-onojeghuo-2.jpg">
                            </div>
                          </a>
                          <div class="media-body">
                            <h5 class="media-heading">Erik P.</h5>
                            <div class="pull-right">
                              <h6 class="text-muted">Sep 11, 11:56 AM</h6>
                              <a href="#paper-kit" class="btn btn-info btn-link pull-right "> <i class="fa fa-reply"></i> Reply</a>
                            </div>
                            <p>Hello guys, nice to have you on the platform! There will be a lot of great stuff coming soon. We will keep you posted for the latest news.</p>
                            <p> Don't forget, You're Awesome!</p>
                          </div>
                        </div>
                        <!-- end media -->
                      </div>
                    </div>
                    <!-- end media -->
                    <div class="media">
                      <a class="pull-left" href="#paper-kit">
                        <div class="avatar">
                          <img class="media-object" alt="64x64" src="../assets/img/faces/joe-gardner-2.jpg">
                        </div>
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading">Joe</h5>
                        <div class="pull-right">
                          <h6 class="text-muted">Sep 11, 11:57 AM</h6>
                          <a href="#paper-kit" class="btn btn-info btn-link pull-right "> <i class="fa fa-reply"></i> Reply</a>
                        </div>
                        <p>Hello guys, nice to have you on the platform! There will be a lot of great stuff coming soon. We will keep you posted for the latest news.</p>
                        <p> Don't forget, You're Awesome!</p>
                      </div>
                    </div>
                    <!-- end media -->
                  </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <div class="section">
        <div class="container">
          <h3>Trip to ${destination.name }</h3>
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
                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2" checked> Private
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
    
<!-- Modal Bodies come here -->
<!-- login modal -->
  <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="false">
    <div class="modal-dialog modal-register">
      <div class="modal-content">
        <div class="modal-header no-border-header text-center">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h6 class="text-muted">Tripping</h6>
          <h3 class="modal-title text-center">Plan your next trip!</h3>
          <p>Log in to your account</p>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Username</label>
            <input type="text" value="" placeholder="Email" class="form-control" />
          </div>
          <div class="form-group">
            <label>Password</label>
            <input type="password" value="" placeholder="Password" class="form-control" />
          </div>
          <button class="btn btn-block btn-round"> Log in</button>
        </div>
        <div class="modal-footer no-border-footer">
          <span class="text-muted  text-center">Looking
            <a href="#paper-kit">create an account</a> ?</span>
        </div>
      </div>
    </div>
  </div>
  <!-- register modal -->
  <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-hidden="false">
    <div class="modal-dialog modal-register">
      <div class="modal-content">
        <div class="modal-header no-border-header text-center">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h6 class="text-muted">Welcome</h6>
          <h3 class="modal-title">Paper Kit</h3>
          <p>Create your account free and secure</p>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer no-border-footer"></div>
      </div>
    </div>
  </div>
  <!-- END MODALS  -->
<!--   end modal -->
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
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDtGx7-G42wXChLrNgy4DXQxQRaUfEcl0Q "></script>
<!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/paper-kit.min.js" type="text/javascript"></script>
</html>