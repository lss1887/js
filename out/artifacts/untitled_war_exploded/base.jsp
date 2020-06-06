<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: CELTICS
  Date: 2019/07/17
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>基本jsp页面示例</title>
</head>
<body>
<h2>林时生牛逼</h2>
<%=new Date().toString()%>

<% for (int i = 0; i < 5; i++) {
    %>
<h3>林林林<%=i %></h3>
<%
}
%>


<%!
    public int add(int i,int j){
        return i+j;
    }
%>
<%= add(1,2)
%>
</body>
</html>
