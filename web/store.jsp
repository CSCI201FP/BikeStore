<%@ page import="util.StoreBackend" %>
<%@ page import="database.dao_impl.StoreDAOImpl" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %><%--
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

    <%
        String idstring = request.getParameter("id");
        int id = Integer.valueOf(idstring);
        StoreDAOImpl stdb = new StoreDAOImpl();
        session.setAttribute("Store", stdb.getStore(id));
        BikeDAOImpl bdb = new BikeDAOImpl();
        session.setAttribute("Bikes",bdb.getAllBikes());
    %>

</head>
<body>
<%
    StoreBackend.convertBikeToJson();
%>
</body>
</html>
