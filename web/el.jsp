<%--
  Created by IntelliJ IDEA.
  User: CELTICS
  Date: 2019/07/18
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>从域里取数据</title>
</head>
<body>
<%request.setAttribute("username","tom_request");

pageContext.setAttribute("username","tom_page");

%>

<%= (String) request.getAttribute("username") %>

el:表达式
${requestScope.username}
${userename}
</body>
</html>
