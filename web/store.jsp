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
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
    <div class = "toolbar">
        <a href = "userInfo.jsp"> Profile </a>
        <a href = "login.jsp"> Log Out</a>
    </div>
    <div id="store">
        <c:out value = "${sessionScope.Store.getName()}"></c:out><br/>
        <c:out value = "${sessionScope.Store.getStreetAddress()}"></c:out><br/>
        Hours: <c:out value = "${sessionScope.Store.getHours()}"></c:out>
    </div>
    <div id ="bikesTable">
        <table>
        <tr>
            <th align="center">Picture</th><th align="center">Model</th><th align="center">Type</th><th align="center" width="40">Seat Height</th><th align = "center" width = "40">Go To Bike</th>
        </tr>
        <c:forEach items = "${sessionScope.Bikes}" var = "bike">
            <tr onclick="location.reload();locaiton.href = '/bike.jsp?id=${bike.getBikeID()}'">
                <td align="center"><img src = "${bike.getPicture()}"></td>
                <td align = "center"><c:out value = "${bike.getModel()}"></c:out></td>
                <td align="center"><c:out value = "${bike.getType()}"></c:out></td>
                <td align = "center"><c:out value = "${bike.getSeatHeight()}"></c:out></td>
                <td align = "center"><a href = "/bike.jsp?id=${bike.getBikeID()}">Go</a></td>
            </tr>
        </c:forEach>
        </table>
    </div>

</body>
</html>
