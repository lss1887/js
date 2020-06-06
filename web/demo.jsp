<%--
  Created by IntelliJ IDEA.
  User: W9002575
  Date: 2019/8/2
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%request.setAttribute("auditStatus",5655);%>
<select class="form-control" id="auditStatus" name="auditStatus">

    <option value="">全部</option>
    <option value="${auditStatus}">
    ${auditStatus}
    </option>
    </select>

</body>
</html>
