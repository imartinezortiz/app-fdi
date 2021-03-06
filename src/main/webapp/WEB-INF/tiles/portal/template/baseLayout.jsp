<%--

    This file is part of Portal Web de la FDI.

    Portal Web de la FDI is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Portal Web de la FDI is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with Portal Web de la FDI.  If not, see <http://www.gnu.org/licenses/>.

--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
	session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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



<c:set var="titleKey">
	<tiles:insertAttribute name="title" />
</c:set>

<c:if test="${! empty titleKey}">
	<title><spring:message code="${titleKey}"></spring:message></title>
</c:if>




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
				<c:set var="headingKey">
					<tiles:insertAttribute name="heading" />
				</c:set>
				<spring:message code="${headingKey}"></spring:message>



			</h1>
			<p>
				<c:set var="taglineKey">
					<tiles:insertAttribute name="tagline" />
				</c:set>

				<c:choose>
					<c:when test="${not empty taglineKey}">
						<spring:message code="${taglineKey}"></spring:message>
					</c:when>
					<c:otherwise>
						${taglineKey}
					</c:otherwise>
				</c:choose>

			</p>

		</div>
		<div class="row">
			<tiles:insertAttribute name="content" />
		</div>
		<div class="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</body>
</html>