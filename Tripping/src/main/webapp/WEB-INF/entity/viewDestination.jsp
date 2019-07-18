<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Destination: ${destination.name}</title>
<!-- Required meta tags -->
<meta charset="utf-8">
</head>
<body>
					<h4>Point of Interest ID ${dest.id }</h4>
					<li><a href="viewPoint.do?fid=${dest.id }">${dest.name }</a></li>
					<li><a href="viewPoint.do?fid=${dest.id }">${dest.description }</a></li>
					<h2>Amenities:</h2>
					<c:forEach var="p" items="${dest.getPoints()}">
						<li><a href="viewPoint.do?fid=${p.id }">${p.name }</a></li>
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
