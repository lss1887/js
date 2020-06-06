<%--
  Created by IntelliJ IDEA.
  User: CELTICS
  Date: 2019/07/20
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="dateValue" class="java.util.Date"/>
<html>
<head>
    <title>jstl_if:判断</title>
</head>
<body>
<%request.setAttribute("age",12);%>
<%request.setAttribute("time",1554083426);%>

<c:if test="${age<18}">
    <span style="color: red">未成年</span>

</c:if>

<jsp:setProperty name="dateValue" property="time" value="${time*1000}"/>
<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm:ss"/>

</body>
</html>
