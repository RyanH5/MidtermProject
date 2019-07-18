<!--
 =========================================================
 * Material Kit - v2.0.5
 =========================================================

 * Product Page: https://www.creative-tim.com/product/material-kit
 * Copyright 2019 Creative Tim (http://www.creative-tim.com)
   Licensed under MIT (https://github.com/creativetimofficial/material-kit/blob/master/LICENSE.md)


 =========================================================

 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Destination: ${destination.name}</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- Material Kit CSS -->
<link href="assets/css/material-kit.css?v=2.0.5" rel="stylesheet" />
</head>

<body>
	<nav
		class="navbar navbar-color-on-scroll navbar-transparent fixed-top navbar-expand-lg"
		color-on-scroll="100">
		<div class="container">
			<div class="navbar-translate">
				<a class="navbar-brand"
					href="https://demos.creative-tim.com/material-kit/index.html">
					Material Kit </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon"></span> <span
						class="navbar-toggler-icon"></span> <span
						class="navbar-toggler-icon"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="material-icons">apps</i> Template
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('assets/img/bg3.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand text-center">
						<h1>Your title here</h1>
						<h3 class="title text-center">Subtitle</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="container">
			<div class="section text-center">
					<h4>Point of Interest ID ${dest.id }</h4>
					<li><a href="getPoint.do?fid=${dest.id }">${dest.name }</a></li>
					<li><a href="getPoint.do?fid=${dest.id }">${dest.description }</a></li>
					<h2>Amenities:</h2>
					<c:forEach var="p" items="${dest.getPoints()}">
						<li><a href="getPoint.do?fid=${p.id }">${p.name }</a></li>
					</c:forEach>
			</div>
		</div>
	</div>
	<footer class="footer footer-default">
		<div class="container">
			<nav class="float-left">
				<ul>
					<li><a href="https://www.creative-tim.com/"> Creative Tim
					</a></li>
				</ul>
			</nav>
			<div class="copyright float-right">
				&copy;
				<script>
					document.write(new Date().getFullYear())
				</script>
				, made with <i class="material-icons">favorite</i> by <a
					href="https://www.creative-tim.com/" target="blank">Creative
					Tim</a> for a better web.
			</div>
		</div>
	</footer>
</body>

</html>