<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="index.jsp">返回首页</a>
	<br>
	<hr>
	用户编号：${user.uid }
	<br> 用户帐号： ${user.userName }<br>
	<c:forEach items="${user.hobby }"  var="hb">
	   <c:out value="${hb }" />&nbsp;&nbsp;
	</c:forEach>
	<br>
	${user.birthDay }
</body>
</html>