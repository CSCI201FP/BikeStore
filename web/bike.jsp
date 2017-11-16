<%@ page import="database.dao_impl.BikeDAOImpl" %><%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/12/17
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Bike</title>

    <%
        String idstring = request.getParameter("id");
        int bikeId = Integer.valueOf(idString);
        BikeDAOImpl bdb = new BikeDAOImpl();
        session.setAttribute("Bike",bdb.getBike(bikeId));
    %>
</head>
<body>
    <div id = "header">
        <img src = "${sessionScope.Bike.getImage()}"><br/>
        <c:out value = "${bike.getModel()}"></c:out><br />
    </div>
    <div id = "bikeInfo">
        Type: <c:out value = "${bike.getType()}"></c:out><br/>
        Gender: <c:out value = "${bike.getGender()}"></c:out><br/>
        Seat Height:<c:out value = "${bike.getSeatHeight()}"></c:out><br/>
    </div>
    <button value = "Reserve"></button>
</body>
</html>
