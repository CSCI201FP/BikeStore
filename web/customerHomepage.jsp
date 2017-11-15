<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="database.dao.StoreDAO" %><%--
  Created by IntelliJ IDEA.
  User: johndwyer
  Date: 11/14/17
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Home</title>
    <%
        StoreDAOImpl st = new StoreDAOImpl();
        session.setAttribute("Stores", StoreDAO.getAllStores());

    %>
</head>
<body>
    <div class = "toolbar">
        <a href = "userInfo.jsp"> Profile </a>
        <a href = "login.jsp"> Log Out</a>
    </div>

    <table>
        <tr>
            <th align="center">Name </th><th align="center">Location</th><th align="center" width="40">Hours</th>
        </tr>
    <c:forEach items = "${sessionScope.Stores}" var = "store">
        <tr>
            <td align="center"> <c:out value = "${store.getName()}"/></td>
            <td align ="center"><c:out value = "${store.getLocation()}"/></td>
            <td align = "center"><c:out value = "${store.getTime()}"/></td>
        </tr></c:forEach>
    </table>
</body>
</html>
