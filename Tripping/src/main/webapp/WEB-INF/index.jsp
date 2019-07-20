<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">



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
				> login </a>
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
<div class="page-header section-dark"
	style="background-image: url('https://www.outtherecolorado.com/wp-content/uploads/2017/03/65c35611befe96d3a3f0f010e1e74fcd-1024x683.jpg')">
	<div class="filter"></div>
	<div class="content-center">
		<div class="container">
			<div class="title-brand">
				<h1 class="presentation-title">tripping</h1>
				<div class="fog-low">
					<img src="./assets/img/fog-low.png" alt="">
				</div>
				<div class="fog-low right">
					<img src="./assets/img/fog-low.png" alt="">
				</div>
			</div>
			<h2 class="presentation-subtitle text-center"></h2>
		</div>
	</div>
	<div class="moving-clouds"
		style="background-image: url('./assets/img/clouds.png');"></div>
	<!-- <h6 class="category category-absolute">EXPLORE</h6> -->
	<h6 class="category category-absolute" style="color:#FFFFFF;font-size:160%;">
	<a href="viewDestinations.do"><b>EXPLORE</b></h6>
</div>

	</body>
</html>
