<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>destinations</title>
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
<link href="./assets/css/entitiesGrid.css" rel="stylesheet" />

</head>

<nav id="navExample" class="navbar navbar-expand-lg fixed-top"
	color-on-scroll="300">
	<div class="container">
		<div class="navbar-translate">
		<i class="fa fa-user-o" aria-hidden="true"></i>
			<a class="navbar-brand" href="loginOrRegister.do" rel="tooltip"
				title="loginOrRegister.do" data-placement="bottom">login</a>
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
				<li><a class="navbar-brand" href="/" rel="tooltip"
					title="tripping" data-placement="bottom"> tripping </a></li>
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
					href="https://github.com/RyanH5/MidtermProject" target="_blank">
						<i class="fa fa-github"></i>
						<p class="d-lg-none">GitHub</p>
				</a></li>
			</ul>
		</div>
	</div>
</nav>

<div class="main-section" style="background-image: url('https://www.outtherecolorado.com/wp-content/uploads/2017/03/65c35611befe96d3a3f0f010e1e74fcd-1024x683.jpg')">
	<div class="fog-low">
					<img src="./assets/img/fog-low.png" alt="">
				</div>
				<div class="fog-low right">
					<img src="./assets/img/fog-low.png" alt="">
				</div>
	<div class="moving-clouds"
		style="background-image: url('./assets/img/clouds.png');"></div>
	<c:forEach var="destination" items="${destinations}">
<%-- 		<div class="entity-container card" href="viewDestination.do?id=${destination.id }">
			<div class="section text-center entity-card-image"
				>
			</div>
			<h6 class="entity-title text-block">
				
			</h6>
		</div> --%>
		<div class="entity-container card card-body" style="background-color:#00000;">
              <label class="badge badge-pill badge-info">Web Design</label>
              <a href="#pablo">
                <h3 class="card-title" style="color:black"><a href="viewDestination.do?id=${destination.id }">${destination.name }</a></h3>
              </a>
              <p class="card-description">Nothing must be arbitrary or left to chance. Care and accuracy in the design process show respect towards the consumer.
              </p>
              <div class="card-footer">
                <a href="AddToBucketList.do?id=${destination.id }" class="btn btn-link btn-neutral">
                  <i class="fa fa-plus" aria-hidden="true"></i> Add to Bucket List
                </a>
             <!--    <a href="#pablo" class="btn btn-link btn-neutral">
                  <i class="fa fa-minus" aria-hidden="true"></i> Delete
                </a> -->
              </div>
            </div>
		
		
		
		
		
	</c:forEach>
</div>
<footer class="footer footer-black  footer-white ">
	<div class="container">
		<div class="row">
			<nav class="footer-nav"></nav>
		</div>
	</div>
</footer>
</body>
</html>
