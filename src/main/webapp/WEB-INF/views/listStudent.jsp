<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8; X-Content-Type-Options=nosniff"
	http-equiv="Content-Type" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  Bootstrap -->
<link rel="stylesheet"
	href="<c:url value="/resourcess/bootstrap3/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resourcess/bootstrap3/js/bootstrap.min.js"/>">

<!--  Jquery -->
<script type="text/javascript"
	src="<c:url value="/resourcess/jquery/jquery-3.3.1.min.js"/>"></script>

<!-- My Custom css , js -->
<link href="<c:url value="/resourcess/custom.css"/>" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="<c:url value="/resourcess/custom.js"/>"></script>

<!-- Context menu -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

<title>List Student</title>
</head>
<body>
	<c:url value="/save-student" var="urlSave" />
	<c:url value="/update-student" var="urlUpdate" />
	<c:url value="/delete-student" var="urlDelete" />
	<c:url value="/search-student" var="urlSearch" />
	<c:url value="/listStudent/sort-up/${pageid }" var="urlSortUp" />
	<c:url value="/listStudent/sort-down/${pageid }" var="urlSortDown" />

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
					name="hoten"></li>
				<li><button type="submit" class="btn btn-info">Tìm
						kiếm</button></li>
			</ul>
		</div>
		</nav>
	</form>
	<br>

	<table class="table table-striped table-bordered " id="mytable">
		<thead>
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
				<c:choose>
					<c:when test="${user.role.role_id ==2 }">
						<th class="th-sm" width="15px"></th>
						<th class="th-sm" width="15px"></th>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</tr>
		</thead>
		<tbody class="context-menu-one">
			<c:if test="${not empty listStudent}">
				<c:forEach var="student" items="${listStudent}">
					<tr style="border: 1px black solid" class="data">
						<td>${student.masv}<span style="visibility: hidden;">${student.numorder }</span></td>
						<td>${student.hoten}</td>
						<td>${student.namsinh}</td>
						<td>${student.lop}</td>
						<td>${student.diem}</td>
						<c:choose>
							<c:when test="${user.role.role_id ==2 }">
								<td width="15px"><a class="btn btn-primary"
									href="${urlUpdate}/${student.masv}" role="button">Sửa</a></td>
								<td width="15px"><a class="btn btn-danger"
									href="${urlDelete}/${student.masv}" role="button"
									onclick="if (confirm('Chắc chắn xóa?')){return true;}else{event.stopPropagation(); event.preventDefault();};">Xóa</a></td>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>

					</tr>
				</c:forEach>
			</c:if>
		</tbody>

	</table>
	<div class="pagination">
		<a href="/springmvc/listStudent/1">1</a> 
		<a href="/springmvc/listStudent/2">2</a>
		<a href="/springmvc/listStudent/3">3</a>
	</div>




</body>
</html>