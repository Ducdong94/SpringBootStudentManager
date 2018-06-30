
<%@page import="java.util.Locale"%>
<%@page import="com.seatech.student_manager.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Student</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
</head>
<body>
	<%
		String _locale = "/" + ((Locale) session.getAttribute("URL_LOCALE_ATTRIBUTE_NAME")).getLanguage();
	%>
	<%@ include file="../layout/navbar.jsp"%>
	<div class="container">
		<h1><spring:message  code="header.edit"/></h1>
		<hr>
		<%
			Student student = (Student) request.getAttribute("student");
		%>
		<form method="POST" action="/edit/<%=student.getRollNumber()%>">
			<div class="form-group">
				<label><spring:message  code="table.rollnumber"/></label>
				 <input class="form-control"
					type="text" name="rollNumber" value="<%=student.getRollNumber()%>" disabled>
			</div>
			<div class="form-group">
				<label><spring:message  code="table.name"/></label> 
				<input class="form-control" type="text"
					name="name" value="<%=student.getName()%>">
			</div>
			<div class="form-group">
				<label><spring:message  code="table.age"/></label> 
				<input class="form-control" type="text"
					name="age" value="<%=student.getAge()%>">
			</div>
			<div class="form-group">
				<label><spring:message  code="table.email"/></label> 
				<input class="form-control" type="email"
					name="email" value="<%=student.getEmail()%>">
			</div>
			<div class="form-group">
				<label><spring:message  code="table.phone"/></label> 
				<input class="form-control" type="text"
					name="phone" value="<%=student.getPhone()%>">
			</div>
			<div class="form-group">
				<label><spring:message  code="status"/></label>
				 <input class="form-control" type="text"
					name="status" value="<%=student.getStatus()%>">
			</div>
			<div class="form-group">
				<label><spring:message  code="table.class"/></label> 
				<select class="form-control"
					name="classRoom">
					<option value="C1702M">C1702M</option>
					<option value="C1708M">C1708M</option>
					<option value="C1728M">C1728M</option>
				</select>
			</div>
			<button class="btn btn-primary" type="submit"><spring:message  code="action.update"/></button>
		</form>
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