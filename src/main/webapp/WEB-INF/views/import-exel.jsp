<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
 
 <form:form action="" method="post"
 enctype="multipart/form-data">
 <div>Excel File 2003:</div>
 <input name="" type="file">
 <input type="submit" value="processExcel">
 </form:form>
 <hr>
 <form:form action="processExcel" method="post"
 enctype="multipart/form-data">
 <div>Excel File 2007:</div>
 <input name="excelfile" type="file"> 
 <input type="submit" value="processExcel2007">
 </form:form>
 <hr>

</body>
</html>