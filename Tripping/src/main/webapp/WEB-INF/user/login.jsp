<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tripper Login</title>
</head>
<body>
	<header class="header">
		<form action="/" method="GET">
  			<input type="submit" value="Tripping" class="btn"/>
		</form>
		<nav>
			<form action="userLogin.do" method="GET">
	  	<input type="submit" value="Login" class="nav btn link"/>
	  </form>
		</nav>
	</header>
		<h4>If you're already a user</h4>
		<form action="userLogin.do" method="GET" class="form form-login">
		<h2>Login</h2>
		<div>
			<div class="form-inputs-container">
				<label for="userName">Username: </label>
				<input type="text" name="userName" class="form-input" placeholder="jSmith99">		
			</div>
			<div>
				<label for="password">Password: </label>
				<input type="password" name="password" class="form-input" placeholder="Password">		
			</div>
			<input type="submit" value="LOGIN" class="btn form-submit"/>
		</div>
	</form>
	
	<h4>Otherwise, please create an account</h4>
	<form action="createUser.do" method="POST" modelAttribute="user" class="form form-register">
		<h2>Register</h2>
		<div>
			<div class="form-inputs-container">
				<label for="userName">Username: </label>
				<input type="text" name="userName" class="form-input" placeholder="jSmith99">		
			</div>
			<div>
				<label for="password">Password: </label>
				<input type="password" name="password" class="form-input" placeholder="Password">		
			</div>
			<div>
				<label for="email">Email: </label>
				<input type="text" name="email" class="form-input" placeholder="jSmith@gmail.com">		
			</div>
			<div>
				<label for="firstName">First name: </label>
				<input type="text" name="firstName" class="form-input" placeholder="John">		
			</div>
			<div>
				<label for="lastName">Last name: </label>
				<input type="text" name="lastName" class="form-input" placeholder="Smith">		
			</div>
			<input type="submit" value="Register" class="btn form-submit"/>
		</div>
	</form>
</body>
</html>