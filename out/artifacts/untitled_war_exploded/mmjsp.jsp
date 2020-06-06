<%@ page import="com.oppo.domain.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: W9002575
  Date: 2019/8/8
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>图片jsp</title>
    <!--    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!--    <script type="text/javascript" src="/jquery-1.11.3.min.js"></script>-->
    <script src="js/jquery-3.3.1.js"></script>
    <!--    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>-->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>


<%
    User user1 = new User();
    user1.setName("img/t1.jpg");
    User user2 = new User();
    user2.setName("img/t2.jpg");
    User user3 = new User();
    user3.setName("img/t3.jpg");

    List list = new ArrayList<>();
    list.add(user1);
    list.add(user2);
    list.add(user3);

    request.setAttribute("list",list);
%>
<!-- Button trigger modal -->
<button type="button" onclick="fn1()">
    Launch demo modal
</button>
<c:forEach items="${list}" var="ed" >
    ${ed.name}
</c:forEach>

<input type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"value="Launch demo modal">

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="img/t4.jpg" alt="...">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        <div class="item">
                            <img src="img/t3.jpg" alt="...">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        ...
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">《《</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">》》</span>
                    </a>
                </div>
            </div>
            <div class="modal-footer">
                总共${fn:length(list)}张
                <button type="button" id="lss" onclick="fn1()">审核通过</button>
                <button type="button" id="lss2">审核不通过</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
</script>
</body>
</html>
