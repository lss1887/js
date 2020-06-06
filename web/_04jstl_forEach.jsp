<%@ page import="com.oppo.domain.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CELTICS
  Date: 2019/07/20
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL：循环遍历</title>
    <script src="js/jquery-3.3.1.js"></script>
</head>
<body>
<%
    User u=new User("林时生",23);
    User u1=new User("林时要",21);
    List list = new ArrayList<>();
    list.add(u);
    list.add(u1);
    request.setAttribute("list1",list);
%>
<div id="tt">
    <select id="select">
        <option>3</option>
    </select>
</div>
<c:forEach items="${list1}" var="user" varStatus="vs">
    ${list1}1
    ${user.name}2
    序号：${vs.index+1}
    ${user.age}
    ${user.age/210}
</c:forEach>
<script type="text/javascript">
    <%--var a =[--%>
    <%--    <c:forEach items="${list1}" var="entity" varStatus="vs">--%>
    <%--    {name:${entity.name}}--%>
    <%--    </c:foreach>--%>
    <%--];--%>
    $(function () {
        var storage=window.localStorage;
        storage.setItem("rr","7777");
        alert(1);
        var a=storage.getItem("rr");
            $("#select").html("<option>"+a+"</option>")
    }
    )

</script>

</body>
</html>
