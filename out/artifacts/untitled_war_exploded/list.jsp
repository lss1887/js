<%@ page import="com.oppo.domain.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: W9002575
  Date: 2019/7/22
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>list_jsp</title>
</head>
<body>
<%
    User user= new User();
    user.setAge(777);
    user.setName("分公司");

    User user1=new User() ;
    user1.setAge(456);
    user1.setName("哈佛");
    List list=new ArrayList();
    list.add(user);
    list.add(user1);

    request.setAttribute("list",list);
%>

<c:forEach items="${list}" var="user" varStatus="vs">

</c:forEach>
</body>
</html>
