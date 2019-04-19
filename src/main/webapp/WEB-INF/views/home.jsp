<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.phihung.springmvc.entities.Users"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>Đăng nhập</title>
</head>
<body>
	<c:url value="/logout" var="urlLogout" />
	<c:url value="/login" var="urlLogin" />
	<c:url value="/list-course" var="urlListCourse" />
	<c:url value="/list-teacher" var="urlListTeacher" />
	<c:url value="/listStudent" var="urlListStudent" />
	 <c:url value="/list-course/teacher/${user.teacher.teacher_id}" var="urlCourseTeaching" />
	<c:url value="/list-course/student/${user.student.masv}" var="urlCourseLearning"/> 
	<nav class="navbar navbar-default"> 
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<c:choose>
				<c:when test="${user.role.role_id == 1}">
					<li><a href="${urlListTeacher}">Danh sách giảng viên</a></li>
					<li><a href="${urlListCourse}">Danh sách khóa học</a></li>
					<li><a href="${urlListStudent }">Danh sách sinh viên</a></li>
				</c:when>
				<c:when test="${user.role.role_id == 2}">
					<li><a href="${urlListTeacher}">Danh sách giảng viên</a></li>
					<li><a href="${urlCourseTeaching}">Khóa học đang dạy</a></li>
				</c:when>
				<c:when test="${user.role.role_id == 3}">
					<li><a href="${urlListCourse}">Danh sách khóa học</a></li>
					<li><a href="${urlCourseLearning}">Khóa học đang học</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${urlLogin }"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${not empty user}">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							${user.username}</a></li>
					<li><a href="${urlLogout }"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${urlLogin }"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</c:otherwise>
			</c:choose>


		</ul>
	</div>
	</nav>

</body>
</html>