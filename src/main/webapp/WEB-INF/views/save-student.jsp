<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm mới</title>
<link rel="stylesheet"
	href="<c:url value="/resourcess/bootstrap3/css/bootstrap.min.css"/>">
<link href="<c:url value="/resourcess/custom.css"/>" rel="stylesheet"
	type="text/css">
</head>
<body>
	<c:url value="/save-student" var="saveStudent" />
	<c:url value="/save-custom-student" var="saveCustomStudent" />
	<div id="info">
		<h2>&nbsp;&nbsp;&nbsp;Thêm mới sinh viên</h2>
		<a class="btn btn-light" href="<c:url value="/listStudent/1" />">&nbsp;&nbsp;&nbsp;Danh
			sách </a><br />

		<c:if test="${order == null}">
			<form:form action="${saveStudent }" method="POST"
				modelAttribute="student" id="myform">
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
				<button type="submit" class="btn btn-primary">Thêm</button>
			</form:form>
		</c:if>

		<c:if test="${order != null}">
			<form:form action="${saveCustomStudent }/${order }" method="POST"
				modelAttribute="student" id="myform">
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
				<button type="submit" class="btn btn-primary">Thêm</button>
			</form:form>
		</c:if>




	</div>
</body>
</html>