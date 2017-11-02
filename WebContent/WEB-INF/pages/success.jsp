<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>
</head>
<body>

   注册成功！
   用户编号：${userinfo.uid }
	<br> 用户帐号： ${userinfo.userName }<br>
	<c:forEach items="${userinfo.hobby }"  var="hb">
	   <c:out value="${hb }" />&nbsp;&nbsp;
	</c:forEach>
	<br>
	${userinfo.birthDay }
	<br>
	<c:forEach items="${userinfo.orderList }"  var="od">
	   <c:out value="${od.oid }" />&nbsp;&nbsp;<c:out value="${od.price}" />
	</c:forEach>
	
	<img src="<%=request.getContextPath()+"/" %>${userinfo.headURL }" width="100px">

</body>
</html>