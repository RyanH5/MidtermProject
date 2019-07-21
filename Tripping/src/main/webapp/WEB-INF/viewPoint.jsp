<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
</head>
<body>
	<c:forEach var="p" items="${allpoints}">
		<button type="button" class="btn btn-danger">Remove Point</button>
		<h4>Point of Interest ID ${p.id }</h4>
		<li><a href="getPoint.do?fid=${p.id }">${p.name }</a></li>
		<li><a href="getPoint.do?fid=${p.id }">${p.address }</a></li>
		<li><a href="getPoint.do?fid=${p.id }">${p.destination }</a></li>
		<li><a href="getPoint.do?fid=${p.id }">${p.shortDescription }</a></li>
		<li><a href="getPoint.do?fid=${p.id }">${p.longDescription }</a></li>
		<h2>Amenities:</h2>
		<c:forEach var="a" items="${p.getAmenities()}">
		<button type="button" class="btn btn-danger">Remove Amenity</button>
			<li><a href="getPoint.do?fid=${a.id }">${a.name }</a></li>
		</c:forEach>
		<h2>Activities:</h2>
		<c:forEach var="a" items="${p.getActivities()}">
		<button type="button" class="btn btn-danger">Remove Activity</button>
			<li><a href="getPoint.do?fid=${a.id }">${a.name }</a></li>
		</c:forEach>
		<h2>Comments:</h2>
		<c:forEach var="c" items="${p.getComments()}">
		<button type="button" class="btn btn-danger">Remove Comment</button>
<div class="container tim-container">
      <div class="title">
        <h3>Comments Area Small</h3>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="media-area media-area-small">
            <h3>Comments · 10</h3>
            <div class="media">
              <a class="pull-left" href="#paper-kit">
                <div class="avatar">
                  <img class="media-object" src="./assets/img/faces/clem-onojeghuo-2.jpg" alt="...">
                </div>
              </a>
              <div class="media-body">
                <h5 class="media-heading">John Wayne</h5>
                <div class="pull-right">
                  <h6 class="text-muted">Sep 11, 11:53 AM</h6>
                  <a href="#paper-kit" class="btn btn-info btn-link pull-right "> <i class="fa fa-reply"></i> Reply</a>
                </div>
                <p>Hello guys, nice to have you on the platform! There will be a lot of great stuff coming soon. We will keep you posted for the latest news.</p>
                <div class="media-footer">
                  <a href="#paper-kit" class="btn btn-danger btn-link">
                    <i class="fa fa-thumbs-up" aria-hidden="true"></i> 243
                  </a>
                  <a href="#paper-kit" class="btn btn-link">
                    <i class="fa fa-thumbs-down" aria-hidden="true"></i> 2
                  </a>
                  <a href="#paper-kit" class="btn btn-link">
                    Follow · 3
                  </a>
                </div>
              </div>
            </div>
            <!-- end media -->
            <!--  Comment  -->
            <div class="media">
              <a class="pull-left" href="#paper-kit">
                <div class="avatar">
                  <img class="media-object" alt="Tim Picture" src="./assets/img/faces/kaci-baum-2.jpg">
                </div>
              </a>
              <div class="media-body">
                <h5 class="media-heading">Chet Faker</h5>
                <div class="pull-right">
                  <h6 class="text-muted">Sep 11, 11:54 AM</h6>
                  <a href="#paper-kit" class="btn btn-info btn-link pull-right "> <i class="fa fa-reply"></i> Reply</a>
                </div>
                <p>Hello guys, nice to have you on the platform!</p>
                <div class="media-footer">
                  <a href="#paper-kit" class="btn btn-danger btn-link">
                    <i class="fa fa-thumbs-up" aria-hidden="true"></i> 243
                  </a>
                  <a href="#paper-kit" class="btn btn-link">
                    <i class="fa fa-thumbs-down" aria-hidden="true"></i> 2
                  </a>
                  <a href="#paper-kit" class="btn btn-link">
                    Follow · 3
                  </a>
                </div>
                <div class="media">
                  <a class="pull-left" href="#paper-kit">
                    <div class="avatar">
                      <img class="media-object" alt="64x64" src="./assets/img/faces/erik-lucatero-2.jpg">
                    </div>
                  </a>
                  <div class="media-body">
                    <h5 class="media-heading">Flume</h5>
                    <div class="pull-right">
                      <h6 class="text-muted">Sep 11, 11:56 AM</h6>
                      <a href="#paper-kit" class="btn btn-info btn-link pull-right ">
                        <i class="fa fa-reply"></i> Reply</a>
                    </div>
                    <p> Don't forget, You're Awesome!</p>
                    <div class="media-footer">
                      <a href="#paper-kit" class="btn btn-danger btn-link">
                        <i class="fa fa-thumbs-up" aria-hidden="true"></i>243
                      </a>
                      <a href="#paper-kit" class="btn btn-link">
                        <i class="fa fa-thumbs-down" aria-hidden="true"></i> 2
                      </a>
                      <a href="#paper-kit" class="btn btn-info btn-link">
                        Follow · 3
                      </a>
                    </div>
                  </div>
                </div>
                <!-- end media -->
              </div>
            </div>
            <!-- end media -->
            <div class="media">
              <a class="pull-left" href="#paper-kit">
                <div class="avatar">
                  <img class="media-object" alt="64x64" src="./assets/img/faces/clem-onojeghuo-2.jpg">
                </div>
              </a>
              <div class="media-body">
                <h5 class="media-heading">Banks</h5>
                <div class="pull-right">
                  <h6 class="text-muted">Sep 11, 11:57 AM</h6>
                  <a href="#paper-kit" class="btn btn-info btn-link pull-right "> <i class="fa fa-reply"></i> Reply</a>
                </div>
                <p>Hello guys, nice to have you on the platform! There will be a lot of great stuff coming soon. We will keep you posted for the latest news.</p>
                <p> Don't forget, You're Awesome!</p>
                <div class="media-footer">
                  <a href="#paper-kit" class="btn btn-link">
                    <i class="fa fa-thumbs-up" aria-hidden="true"></i> 243
                  </a>
                  <a href="#paper-kit" class="btn btn-primary btn-link">
                    <i class="fa fa-thumbs-down" aria-hidden="true"></i> 2
                  </a>
                  <a href="#paper-kit" class="btn btn-link">
                    Follow · 3
                  </a>
                </div>
              </div>
            </div>
            <!-- end media -->
            <div class="pagination-area">
              <ul class="pagination pagination-primary justify-content-center">
                <li class="page-item">
                  <a href="#paper-kit" class="page-link"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                </li>
                <li class="page-item active">
                  <a href="#paper-kit" class="page-link">1</a>
                </li>
                <li class="page-item">
                  <a href="#paper-kit" class="page-link">2</a>
                </li>
                <li class="page-item">
                  <a href="#paper-kit" class="page-link">3</a>
                </li>
                <li class="page-item">
                  <a href="#paper-kit" class="page-link">4</a>
                </li>
                <li class="page-item">
                  <a href="#paper-kit" class="page-link">5</a>
                </li>
                <li class="page-item">
                  <a href="#paper-kit" class="page-link"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                </li>
              </ul>
            </div>
            <h3 class="text-center">Post your comment</h3>
            <div class="media media-post">
              <form class="form">
                <a class="pull-left author" href="#paper-kit">
                  <div class="avatar">
                    <img class="media-object" alt="64x64" src="./assets/img/faces/erik-lucatero-2.jpg">
                  </div>
                </a>
                <div class="media-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <input type="email" class="form-control" placeholder="Your Name">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <input type="email" class="form-control" placeholder="Your email">
                      </div>
                    </div>
                  </div>
                  <textarea class="form-control" placeholder="Write some nice stuff or nothing..." rows="6"></textarea>
                  <div class="media-footer">
                    <h6 class="text-muted">Sign in with</h6>
                    <a href="#twitter" class="btn btn-just-icon btn-round btn-twitter">
                      <i class="fa fa-twitter"></i>
                    </a>
                    <a href="#facebook" class="btn btn-round btn-just-icon btn-facebook">
                      <i class="fa fa-facebook"></i>
                    </a>
                    <a href="#google" class="btn btn-just-icon btn-round btn-google">
                      <i class="fa fa-google-plus"></i>
                    </a>
                    <a href="#paper-kit" class="btn btn-primary pull-right btn-round">Post Comment</a>
                  </div>
                </div>
                <!-- end media-body -->
              </form>
            </div>
            <!-- end media-post -->
          </div>
          <!-- end media-area-small -->
        </div>
        <!-- end col-md-8 -->
      </div>
      <!-- end row -->
    </div>
		</c:forEach>
		
		
		
		
		
		
		
		
		
		
		
		
		
	</c:forEach>
</body>
</html>