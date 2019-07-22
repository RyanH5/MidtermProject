<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        <!-- destination review modal -->
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