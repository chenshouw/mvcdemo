<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<base  href="<%=request.getContextPath()+"/"%>"/>
</head>
<body>

<!--  校验失败后，由spring mvc 返回错误信息到jsp页面，
       在进行信息显示一般有两种方法:
         1.把所有的错误信息显示到一起
         2.把错误信息显示到对应的表单项中--
 -->
<c:if test="${errors !=null }">
     表单 信息填写有误，请检查：<br>
	<c:forEach items="${errors }" var="error">
		${error.defaultMessage } <br>
	</c:forEach>
</c:if>

	<form name="regForm" action="user/register.do"   method="post">
		<table>
			<tr>
				<td colspan="3">用户注册</td>
			</tr>
			<tr>
				<td>用户编号：</td>
				<td><input name="uid" type="text" /></td>
				<td></td>
			</tr>
			<tr>
				<td>用户帐号：</td>
				<td><input name="userName" type="text" /></td>
				<td>
				<!-- 使用错误对象的属性进行判断，根据判断结果显示错误信息 -->
				<c:if test="${errors[0].field  == 'userName' }">
				    ${errors[0].defaultMessage}
				</c:if></td>
			</tr>
			<tr>
				<td>出生日期：</td>
				<td><input name="birthDay" type="text" /></td>
				<td></td>
			</tr>

			<tr>
				<td>爱好：</td>
				<td><input name="hobby" type="checkbox" value="music" />音乐 <input
					name="hobby" type="checkbox" value="movie" />电影 <input
					name="hobby" type="checkbox" value="read" />阅读</td>
				<td></td>
			</tr>

			<tr>
				<td>你的订单：</td>
				<td><input name="orderList[0].oid" type="checkbox" value="1" />ppTV会员订购单
					<input name="orderList[1].oid"   type="checkbox" value="2" />百度云会员订购单
					<input name="orderList[2].oid"   type="checkbox" value="3" />爱奇艺会员订购单
				</td>
				<td></td>
			</tr>

			<tr>
				<td><input type="reset" value="重填" /></td>
				<td><input type="submit" value="提交注册" /></td>
				<td></td>
			</tr>

		</table>
	</form>
</body>
</html>