<%@ page import="util.StoreBackend" %>
<%@ page import="database.dao_impl.StoreDAOImpl" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="database.dao.StoreDAO" %><%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/14/17
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String idstring = request.getParameter("id");
    int id = Integer.valueOf(idstring);

    StoreDAO stdb = new StoreDAOImpl();
    pageContext.setAttribute("store", stdb.getStore(id));
    BikeDAOImpl bdb = new BikeDAOImpl();
    pageContext.setAttribute("bikes", bdb.getAllBikes());
%>

<html>
<head>
    <title>Store</title>
    <%@include file="part/common-head-dependency.html" %>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script>
        $(function () {
            $('#bikes-table').DataTable({
                "ajax": {
                    "url": "/get-available-bikes",
                    "dataSrc": ""
                },
                "columns": [
                    {data: 'picture'},
                    {data: 'model'},
                    {data: 'type'},
                    {data: 'seatHeight'},
                    {data: 'bikeID'}
                ]
            });
        })
    </script>
</head>
<body>
<div class="toolbar">
    <a href="userInfo.jsp"> Profile </a>
    <a href="login.jsp"> Log Out</a>
</div>
<div id="store">
    <c:out value="${store.name}"/><br/>
    <c:out value="${store.streetAddress}"/><br/>
    Hours: <c:out value="${store.hours}"/>
</div>
<div id="bikesTable">
    <table>
        <tr>
            <th align="center">Picture</th>
            <th align="center">Model</th>
            <th align="center">Type</th>
            <th align="center" width="40">Seat Height</th>
            <th align="center" width="40">Go To Bike</th>
        </tr>
        <c:forEach items="${bikes}" var="bike">
            <tr onclick="location.reload(); locaiton.href = '/bike.jsp?id=${bike.getBikeID()}'">
                <td align="center"><img src="${bike.getPicture()}"></td>
                <td align="center"><c:out value="${bike.getModel()}"/></td>
                <td align="center"><c:out value="${bike.getType()}"/></td>
                <td align="center"><c:out value="${bike.getSeatHeight()}"/></td>
                <td align="center"><a href="/bike.jsp?id=${bike.getBikeID()}">Go</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<table id="bikes-table">
    <thead>
    <tr>
        <th align="center">Picture</th>
        <th align="center">Model</th>
        <th align="center">Type</th>
        <th align="center" width="40">Seat Height</th>
        <th align="center" width="40">Go To Bike</th>
    </tr>
    </thead>
</table>


</body>
</html>
