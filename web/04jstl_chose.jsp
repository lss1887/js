<%@ page import="com.oppo.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: CELTICS
  Date: 2019/07/20
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>jstl标签-choose</title>
</head>
<body>
<%
//        User user= new User();
//        user.setAge(777);
//        user.setName("分公司");
//
//        User user1=new User() ;
//        user1.setAge(456);
//        user1.setName("哈佛");
    List list=new ArrayList();
    list.add(1);
    list.add(2);
    list.add(3);
    request.setAttribute("list",list);
    request.setAttribute("num",3);
    request.setAttribute("good","哈哈哈");

%>
<%--
choose,when,otherwise 相当javaswitch case,default
--%>

<c:choose>
    <c:when test="${num ==1}">星期一</c:when>
    <c:when test="${num ==2}">星期二</c:when>
    <c:when test="${num ==3}">星期三</c:when>
    <c:when test="${num ==4}">星期四</c:when>
    <c:when test="${num ==5}">星期五</c:when>
    <c:when test="${num ==6}">星期六</c:when>
    <c:when test="${num ==7}">星期日</c:when>
    <c:otherwise>参数不合法</c:otherwise>

</c:choose>

<c:if test="${num == 1 }">星期一</c:if>
<c:if test="${num == 2 }">星期二</c:if>
<c:if test="${num == 3 }">星期三</c:if>
<c:if test="${num == 4 }">星期四</c:if>
<c:if test="${num == 5 }">星期五</c:if>
<c:if test="${num == 6 }">星期六</c:if>
<c:if test="${num == 7 }">星期日</c:if>

<c:forEach items="${list}" var="tt">${tt}</c:forEach>11
22

33
<c:if test="${good.equals('哈哈哈') }">牛逼</c:if>
</body>
</html>
