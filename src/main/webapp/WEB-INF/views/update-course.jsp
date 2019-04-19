<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resourcess/bootstrap3/css/bootstrap.min.css"/>">
<link href="<c:url value="/resourcess/custom.css"/>" rel="stylesheet"
	type="text/css">
<script src="/resourcess/jquery/jquery-3.3.3.min.js/"></script>
<title>Sửa thông tin</title>
</head>
<body>
	<div id="info">
		<h2>&nbsp;&nbsp;&nbsp;</h2>
		<c:url value="/test" var="urlUpdateCourse" />
		
		<a class="btn btn-light" href="<c:url value="/listStudent/1" />">&nbsp;&nbsp;Danh
			sách </a><br />
		<form:form action="${urlUpdateCourse}" method="POST" modelAttribute="course" id="myform">
			<div class="form-group">
				<label>Ma KH</label>
				<form:input type="text" class="form-control" path="course_id"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Tên khóa học</label>
				<form:input type="text" class="form-control" path="course_name" />
			</div>
			<div class="form-group">
				<label>Giảng viên</label>
				<br>
				<form:select path="teacher">
					<c:forEach items="${listTeacher}" var="teacher">
						<form:option items="A" value="${teacher.teacher_name}"></form:option>
					</c:forEach>
				</form:select>
			</div>
			<button type="submit" class="btn btn-primary">Sửa</button>				
		</form:form>
	</div>
</body>
</html>