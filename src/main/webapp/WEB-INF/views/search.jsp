<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  Bootstrap -->
<link rel="stylesheet"
	href="<c:url value="/resourcess/bootstrap3/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resourcess/bootstrap3/js/bootstrap.min.js"/>">

<!-- My Custom css , js -->
<link href="<c:url value="/resourcess/custom.css"/>" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="<c:url value="/resourcess/custom.js"/>"></script>

<title>List Student</title>
</head>
<body>
	<c:url value="/save-student" var="urlSave" />
	<c:url value="/update-student" var="urlUpdate" />
	<c:url value="/delete-student" var="urlDelete" />
	<c:url value="/search-student" var="urlSearch" />
	<c:url value="/search-student/${hoten}/sort-up" var="urlSortUp" />
	<c:url value="/search-student/${hoten}/sort-down" var="urlSortDown" />

	<h2>&nbsp;&nbsp;&nbsp;Danh sách sinh viên</h2>

	<br>
	<form method="get" action="${urlSearch }">
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value="/save-student"/>">Thêm mới</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right" style="margin-top: 7px;">
				<li><input type="text" class="form-control" id="usr"
					name="hoten" value="<c:out value="${hoten}"/>"></li>
				<li><button type="submit" class="btn btn-info">Tìm
						kiếm</button></li>
			</ul>
		</div>
		</nav>
	</form>
	<br>
	<table class="table table-striped table-bordered" id="mytable">
		<tr>
			<th class="th-sm">MaSV</th>
			<th class="th-sm">HoTen</th>
			<th class="th-sm">NamSinh</th>
			<th class="th-sm">Lop</th>
			<th class="th-sm">Diem <a href="${urlSortUp }"><span
					class="glyphicon glyphicon-arrow-up"></span></a> <a
				href="${urlSortDown }"><span
					class="glyphicon glyphicon-arrow-down"></span></a>
			</th>
			<th class="th-sm"></th>
			<th class="th-sm"></th>
		</tr>
		<c:if test="${not empty listStudent}">
			<c:forEach var="student" items="${listStudent}">
				<tr style="border: 1px black solid">
					<td>${student.masv}</td>
					<td>${student.hoten}</td>
					<td>${student.namsinh}</td>
					<td>${student.lop}</td>
					<td>${student.diem}</td>
					<td><a class="btn btn-primary"
						href="${urlUpdate}/${student.masv}" role="button">Sửa</a></td>
					<td><a class="btn btn-danger"
						href="${urlDelete}/${student.masv}" role="button"
						onclick="if (confirm('Chắc chắn xóa?')){return true;}else{event.stopPropagation(); event.preventDefault();};">Xóa</a></td>
				</tr>
			</c:forEach>


		</c:if>
	</table>
</body>
</html>