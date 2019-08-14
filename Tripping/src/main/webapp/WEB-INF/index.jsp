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
<link href="./assets/css/entitiesGrid.css" rel="stylesheet" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>tripping</title>

<jsp:include page="bootstrapHead.jsp" />

</head>

<body class="index-page sidebar-collapse">

	<jsp:include page="navbar.jsp" />

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
			</div>
		</div>
		<div class="moving-clouds"
			style="background-image: url('./assets/img/clouds.png');"></div>
		<a href="viewDestinations.do">
		<h5 class="category category-absolute">
		<strong>EXPLORE</strong>
		</a>
		</h5>
	</div>

	<jsp:include page="modals.jsp" />
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>