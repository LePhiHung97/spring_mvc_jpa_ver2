<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<c:url value="/login" var="urlLogin" />
	<div class="login-form">
		<form action="${urlLogin }" method="post">
			<h2 class="text-center">Log in</h2>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Username"
					required="required" name="username">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="Password"
					required="required" name="password">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block">Login</button>
			</div>
			<div class="form-group">
				<div class="row">
					<label style="color: red;text-align:center;font-size:small;">${msgLogin}</label>
				</div>
			</div>
			<div class="clearfix">
				<label class="pull-left checkbox-inline"><input
					type="checkbox"> Remember me</label> <a href="#" class="pull-right">Forgot
					Password?</a>
			</div>
		</form>
	</div>
</body>
</html>