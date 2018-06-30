<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    		<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String locale_ = "/"+((Locale)session.getAttribute("URL_LOCALE_ATTRIBUTE_NAME")).getLanguage();%>
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
		<a class="navbar-brand" href="<%=locale_%>/">
		 <spring:message  code="brand" />
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav">
				<a class="nav-item nav-link" href="<%=locale_%>/"><spring:message  code="navbar.class"/></a>
			</div>
			<hr />
			<ul class="navbar-nav ml-auto">
				<li class="nav-item text-light"><a class="nav-link disabled text-light">
				<spring:message  code="navbar.greeting" />
				<%=session.getAttribute("msg")%>
				</a></li>
				<li><a class="nav-link text-danger" href="/signout">
				<small class="bg-light p-1 rounded"><spring:message  code="navbar.logout" /></small>
				</a>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>