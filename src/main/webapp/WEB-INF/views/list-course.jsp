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

<title>List Course</title>
</head>
<body>
	<c:url value="/save-course" var="urlSave" />
	<c:url value="/update-course" var="urlUpdate" />
	<c:url value="/delete-course" var="urlDelete" />
	<c:url value="/search-course" var="urlSearch" />
	<c:url value="/course-detail" var="urlDetailCourse" />
	<c:url value="/list-course/sort-up/${pageid }" var="urlSortUp" />
	<c:url value="/list-course/sort-down/${pageid }" var="urlSortDown" />
	<c:url value="/register-course" var="urlRegisterCourse" />

	<h2>&nbsp;&nbsp;&nbsp;Danh sách khóa học</h2>

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
	<table class="table table-striped table-bordered " id="mytable">
		<thead>
			<tr>
				<th class="th-sm" width="15px">Mã KH</th>
				<th class="th-sm">Tên KH</th>
				<th class="th-sm">Giảng viên</th>

				<c:choose>
					<c:when test="${user.role.role_id == 3 || user.role.role_id ==2}">
						<th class="th-sm" width=30px>Trạng thái</th>
						<th class="th-sm" width="30px">Chi tiết</th>
					</c:when>
					<c:otherwise>

						<th class="th-sm" width="30px">Chi tiết</th>
						<th class="th-sm"></th>
						<th class="th-sm"></th>
					</c:otherwise>
				</c:choose>
			</tr>
		</thead>
		<tbody class="context-menu-one">
			<c:forEach items="${listCourse}" var="course">
				<c:choose>
					<c:when test="${user.role.role_id == 1}">
						<tr style="border: 1px solid black" class="data">
							<td width="15px">${course.course_id }</td>
							<td>${course.course_name}</td>
							<td>${course.teacher.teacher_name }</td>
							<td width="15px"><a class="btn btn-info"
								href="${urlDetailCourse}/${course.course_id}" role="button">Chi
									tiết</a></td>
							<td width="15px"><a class="btn btn-primary"
								href="${urlUpdate}/${course.course_id}" role="button">Sửa</a></td>
							<td width="15px"><a class="btn btn-danger"
								href="${urlDelete}/${course.course_id}" role="button"
								onclick="if (confirm('Chắc chắn xóa?')){return true;}else{event.stopPropagation(); event.preventDefault();};">Xóa</a></td>
						</tr>
					</c:when>
					<c:when test="${user.role.role_id == 2}">
						<tr style="border: 1px solid black" class="data">
							<td width="15px">${course.course_id }</td>
							<td>${course.course_name}</td>
							<td>${course.teacher.teacher_name }</td>
							<td width="30px"><span>Đang dạy</span></td>
							<td width="30px"><a class="btn btn-info"
								href="${urlDetailCourse}/${course.course_id}" role="button">Chi
									tiết</a></td>
						</tr>
					</c:when>
					<c:when test="${user.role.role_id == 3}">
						<tr style="border: 1px black solid" class="data">
							<td width="15px">${course.course_id}</td>
							<td>${course.course_name}</td>
							<td>${course.teacher.teacher_name}</td>
							<c:choose>
								<c:when test="${isCourseByStudent== true }">
									<td width="30px"><span>Đang học</span></td>
									<td width="30px"><a class="btn btn-info"
										href="${urlDetailCourse}/${course.course_id}" role="button">Chi
											tiết</a></td>
								</c:when>
								<c:otherwise>
									<%-- <c:forEach items="${listCourseLearning }" var="courseLearning">
										<c:choose>
											<c:when
												test="${course.course_id == courseLearning.course_id}">
												<td width="30px"><span>Đang học</span></td>
												<td width="30px"><a class="btn btn-info" href="#"
													role="button">Chi tiết</a></td>
											</c:when>
											<c:otherwise>
												<td width="30px"><a class="btn btn-success"
													href="${urlRegisterCourse }/${user.student.masv}/${course.course_id}"
													role="button">Đăng kí học</a></td>
												<td width="30px"><a class="btn btn-info" href="#"
													role="button" disabled>Chi tiết</a></td>
											</c:otherwise>
										</c:choose>
									</c:forEach> --%>
									<td width="30px"><a class="btn btn-success" href="${urlRegisterCourse }/${user.student.masv}/${course.course_id}"
									role="button">Đăng kí học</a></td>
									<td width="30px"><a class="btn btn-info" href="#"
									role="button" disabled>Chi tiết</a></td>  
								</c:otherwise>
							</c:choose>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">
		<a href="/springmvc/list-course/1">1</a> <a
			href="/springmvc/list-course/2">2</a> <a
			href="/springmvc/list-course/3">3</a>
	</div>




</body>
</html>