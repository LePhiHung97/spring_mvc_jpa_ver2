<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello World</title>
</head>
<body>
	<h3>Users List</h3>
	<c:if test="${!empty lstTeacher}">
		<table class="tg">
			<tr>
				<th width="80">User ID</th>
				<th width="120">UserName</th>
			
			</tr>
			<c:forEach items="${lstTeacher}" var="teacher">
				<tr>
					<td>${teacher.teacher_id}</td>
					<td>${teacher.teacher_name}</td>
					
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>

</html>
