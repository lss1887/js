<%@ page import="com.oppo.domain.User" %>
<%@ page import="com.oppo.domain.Address" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CELTICS
  Date: 2019/07/18
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>el复杂表达式</title>

</head>
<body>
<%
    Address address1 = new Address("广东省", "深圳市");
     User user1 = new User("小王", 23, address1);

    Address address2 = new Address("广东省", "湛江市");
    User user2 =new User("小鱼",22,address2);

    ArrayList<User> list = new ArrayList<>();
        list.add(user1);
        list.add(user2);

        request.setAttribute("list",list);

%>
Java脚本：<%=((List<User>)request.getAttribute("list")).get(0).getName()%>
${list[0].name}
<c:forEach items="${list}" var="ed" >
${ed.name}
</c:forEach>



</body>
</html>
