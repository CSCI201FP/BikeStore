<%@ page import="util.StoreBackend" %><%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/14/17
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Store</title>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
    <script src="jquery-3.2.1.min.js"></script>
</head>
<body>
<%
    StoreBackend.convertBikeToJson();
%>
</body>
</html>
