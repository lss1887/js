<%--
  Created by IntelliJ IDEA.
  User: CELTICS
  Date: 2019/07/20
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>导入标签库</title>
</head>
<body>
<%
    request.setAttribute("num",20);
    request.setAttribute("num2",106.425);
%>
<c:if test="${num == 20}"><span><fmt:formatNumber type="number" value="${num2/10+num/10}" pattern="0.00"></fmt:formatNumber>
    <hr>
    <fmt:formatNumber type="number" maxFractionDigits="2" value="${num2+0.0001}" pattern="0.00"/>
</span></c:if>

</body>
</html>
