<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
