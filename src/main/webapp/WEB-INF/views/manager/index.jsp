<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.seatech.student_manager.entity.Student"%>
<%@page import="antlr.collections.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>List Student</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
</head>
<body>
	<%
		String locale = "/" + ((Locale) session.getAttribute("URL_LOCALE_ATTRIBUTE_NAME")).getLanguage();
	%>
	<%@ include file="../layout/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<h1 class="col-sm-7"><spring:message  code="header.list"/></h1>
			<div class="col-sm-5 py-2 forn-group" align="right">
				<input id="search_box" class="form-control" type="text"
					placeholder="Search">
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-hover" id="studentTable">
				<thead>
					<th><spring:message  code="table.rollnumber"/></th>
					<th><spring:message  code="table.name"/></th>
					<th><spring:message  code="table.age"/></th>
					<th><spring:message  code="table.class"/></th>
					<th><spring:message  code="table.email"/></th>
					<th><spring:message  code="table.phone"/></th>
					<th><spring:message  code="table.action"/></th>
				</thead>
				<tbody>
					<%
						ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("Students");
						for (Student student : students) {
					%>
					<tr id="<%=student.getRollNumber()%>">
						<td><%=student.getRollNumber()%></td>
						<td><%=student.getName()%></td>
						<td><%=student.getAge()%></td>
						<td><%=student.getClassRoom()%></td>
						<td><%=student.getEmail()%></td>
						<td><%=student.getPhone()%></td>
						<td><a class="btn btn-outline-info btn-sm"
							href="<%=locale%>/edit/<%=student.getRollNumber()%>">Edit</a>
							<button class="btn btn-outline-danger btn-sm "
								onclick="del('<%=student.getRollNumber()%>')">Delete</button></td>
					</tr>
					<%
						} ;
					%>
				</tbody>
			</table>
		</div>
		<div class="row">
		<div class="col">
		<a class="btn btn-success" href="/?export=xls"><spring:message  code="export"/></a>
		</div>
		<div class="col text-right">
			<a class="btn btn-info" href="<%=locale%>/create"><spring:message  code="action.create"/></a>
		</div>
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
	<script>
		/* delete student */
		function del(rollNumber) {
			if (confirm("This going to delete student with RollNumber - "
					+ rollNumber + "\nAre you sure?")) {
				var url = "/delete/" + rollNumber;
				$.get(url, function(data, status) {
					if (status === "success") {
						var id = "#" + rollNumber;
						$(id).remove();
					}
				});
			}
		}
		/* filter table*/
		$(document)
				.ready(
						function() {
							$("#search_box")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#studentTable tbody tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
</body>
</html>