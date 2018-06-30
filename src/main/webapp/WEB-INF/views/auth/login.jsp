<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>List Student</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

</head>
<body>
	<%
		String locale = "/" + ((Locale) session.getAttribute("URL_LOCALE_ATTRIBUTE_NAME")).getLanguage();
	%>
	<%@ include file="../layout/navbar.jsp"%>
	<div class="container">
		<h1 align="center">Please login for using our service</h1>
		<hr>
		<div class="col-md-6 offset-md-3 border p-4">
			<form action="/login" method="POST">
				<div class="form-group">
					<label>Username</label> <input class="form-control" type="text"
						name="username">
				</div>
				<div class="form-group">
					<label>Password</label> <input class="form-control" type="password"
						name="password">
				</div>
				<div class="form-group">
					<input class="btn btn-primary" type="submit" value="Login">
				</div>
			</form>
		</div>
	</div>
	<footer class="text-center fixed-bottom">
		<%@ include file="../layout/footer.jsp"%>
	</footer>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>