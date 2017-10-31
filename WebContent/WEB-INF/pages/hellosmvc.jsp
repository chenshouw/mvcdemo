<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   //使用base标签解决页面跳转的路径问题
      String basePath = request.getContextPath()+"/";
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href = "<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试页面</title>
</head>
<body>
<a href="index.jsp">返回首页</a><br>
<hr>

  测试spring mvc
  在jsp页面中获取Contrallor传递的数据
  <%
    //1.方法1使用小脚本获取
    //把父类对象Object转换成子类对象String，需要进行类型强制转换,类型强转使用小括号运算符号
    String  msg = (String)request.getAttribute("msg");//获取服务器本页或其它页面(servlet)，传递来的数据.返回Object
    //request.getParameter(arg0); - 获取用户从浏览器或客户端发送的参数,返回String
    //向页面输出内容主要有三种方法：
    //1).使用out对象进行输出，
    out.append(msg);
  %>  <br>
     2).使用表达式进行输出
    <%= msg%>
     <br>
    3).使用标签进行输出
     <br>
    //2. 方法2.使用el表达式获取数据
    ${msg} - ${sessionScope.msg2}
</body>
</html>