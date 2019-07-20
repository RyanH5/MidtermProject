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
					<h4>Destination ID ${destination.id }</h4>
					<li><a href="viewPoint.do?fid=${destination.id }">${destination.name }</a></li>
					 <li><a href="viewPoint.do?fid=${destination.id }">${destination.description }</a></li>
					<h2>Points of Interest:</h2>
					<c:forEach var="poinr" items="${destination.getPoints()}">
						<li><a href="viewPoint.do?fid=${point.id }">${point.name }</a></li>
					</c:forEach> 
			</div>
		</div>
	</div>
	<footer class="footer footer-default">

	</footer>
</body>

</html>
