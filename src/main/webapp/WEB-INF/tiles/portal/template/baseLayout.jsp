<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initialscale=1.0">
	<!-- CSS -->
	<link rel="stylesheet"
		href="<spring:url value="/webjars/bootstrap/3.0.0/css/bootstrap.min.css"/>">
	<link rel="stylesheet"
		href="<spring:url value="/static/css/globalStyle.css" />">
	
	<!-- JS -->
	<script src="<spring:url value="/webjars/jquery/2.1.1/jquery.min.js" />"></script>
	<script type="text/javascript"
		src="<spring:url value="/webjars/bootstrap/3.0.0/js/bootstrap.min.js" />"></script>

	<tiles:insertAttribute name="resources" />

	<title><tiles:insertAttribute name="title" /></title>

</head>
<body>
	<div class="container">
		<div class="header">
			<ul class="nav nav-pills pull-right">
				<tiles:insertAttribute name="navigation" />
			</ul>

		</div>
		<div class="jumbotron">
			<h1>
				<tiles:insertAttribute name="heading" />
			</h1>
			<p>
				<tiles:insertAttribute name="tagline" />
			</p>
		</div>
		<div class="row">
			<tiles:insertAttribute name="content" />
		</div>
		<div class="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>


	<!-- JS -->
</body>
</html>