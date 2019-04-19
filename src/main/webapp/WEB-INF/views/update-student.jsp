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
		<h2>&nbsp;&nbsp;&nbsp;Sửa thông tin</h2>
		<c:url value="/update-student" var="updateURL" />
		<a class="btn btn-light" href="<c:url value="/listStudent/1" />">&nbsp;&nbsp;Danh
			sách </a><br />
		<form:form action="${updateURL}" method="POST"
			modelAttribute="student" id="myform">
			<div class="form-group">
				<label>MaSV</label>
				<form:input type="text" class="form-control" path="masv"
					readonly="true" />
			</div>
			<div class="form-group">
				<label>Ho Ten</label>
				<form:input type="text" class="form-control" path="hoten" />
			</div>
			<div class="form-group">
				<label>Nam Sinh</label>
				<form:input type="text" class="form-control" path="namsinh" />
			</div>
			<div class="form-group">
				<label>Lop</label>
				<form:input type="text" class="form-control" path="lop" />
			</div>
			<div class="form-group">
				<label>Diem</label>
				<form:input type="text" class="form-control" path="diem" />
			</div>
			<button type="submit" class="btn btn-primary">Sửa</button>
		</form:form>
	</div>
</body>
</html>