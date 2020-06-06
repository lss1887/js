<%--
  Created by IntelliJ IDEA.
  User: W9002575
  Date: 2019/12/18
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>保留2位小数</title>
</head>
<body>
<% request.setAttribute("num",33333);%>
<fmt:formatNumber type="number" value="${num/100}" pattern="0.00"></fmt:formatNumber>
${num}
</body>
</html>
