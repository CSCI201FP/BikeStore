<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="database.dao.BikeDAO" %>
<%@ page import="objects.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    int bikeId = ((User) session.getAttribute("user")).getCurrentBikeID();
    BikeDAO bdb = new BikeDAOImpl();
    pageContext.setAttribute("bike", bdb.getBike(bikeId));
%>

<html>
<head>
    <title>Bike</title>
    <%@include file="part/common-head-dependency.html"%>


</head>
<body>
<%@include file="part/alert-bar.html" %>
<div id="header">
    <img src="${bike.picture}"><br/>
    <c:out value="${bike.model}"/><br/>
</div>
<div id="bikeInfo">
    Type: <c:out value="${bike.type}"/><br/>
    Gender: <c:out value="${bike.gender}"/><br/>
    Seat Height:<c:out value="${bike.seatHeight}"/><br/>
</div>
<button value="Reserve"></button>
</body>
</html>
