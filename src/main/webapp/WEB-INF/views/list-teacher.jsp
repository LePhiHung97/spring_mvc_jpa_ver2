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

<title>List Teacher</title>
</head>
<body>
	<c:url value="/save-teacher" var="urlSave" />
	<c:url value="/update-teacher" var="urlUpdate" />
	<c:url value="/delete-teacher" var="urlDelete" />
	<c:url value="/search-teacher" var="urlSearch" />
	<c:url value="/list-teacher/sort-up/${pageid }" var="urlSortUp" />
	<c:url value="/list-teacher/sort-down/${pageid }" var="urlSortDown" />

	<h2>&nbsp;&nbsp;&nbsp;Danh sách giảng viên</h2>

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
				<th class="th-sm" width="20px">Ma GV</th>
				<th class="th-sm">Ten Giang Vien</th>

				<c:choose>
					<c:when test="${user.role.role_id == 1 }">
						<th class="th-sm"></th>
						<th class="th-sm"></th>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>

			</tr>
		</thead>
		<tbody class="context-menu-one">
			<c:if test="${not empty teachers}">
				<c:forEach var="teacher" items="${teachers}">
					<tr style="border: 1px black solid" class="data">
						<td width="20px">${teacher.teacher_id}</td>
						<td>${teacher.teacher_name}</td>
						<c:choose>
							<c:when test="${user.role.role_id == 1 }">
								<td width="15px"><a class="btn btn-primary"
									href="${urlUpdate}/${course.course_id}" role="button">Sửa</a></td>
								<td width="15px"><a class="btn btn-danger"
									href="${urlDelete}/${course.course_id}" role="button"
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
	<c:import url="footer.jsp"></c:import>
	




</body>
</html>