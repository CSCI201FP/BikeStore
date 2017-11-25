<%@ page import="database.dao_impl.ReservationDAOImpl" %>
<%@ page import="objects.Reservation" %>
<%@ page import="database.dao_impl.UserDAOImpl" %>
<%@ page import="database.dao.UserDAO" %>
<%@ page import="database.dao.ReservationDAO" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="database.dao.BikeDAO" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ReservationDAO rdb = new ReservationDAOImpl();
    Set<Reservation> reservations = rdb.getAllReservation();
    pageContext.setAttribute("reservations", reservations);

    BikeDAO bdb = new BikeDAOImpl();
    pageContext.setAttribute("bikes", bdb.getAllBikes());
    pageContext.setAttribute("bikeDAO", bdb);

    UserDAO udb = new UserDAOImpl();
    pageContext.setAttribute("userDAO", udb);
%>

<html>
<head>
    <title>Manager Homepage </title>
    <%@include file="part/common-head-dependency.html" %>
    <!-- Notify plugin -->
    <link rel="stylesheet" type="text/css" href="css/notify.css">
    <script src="js/notify.min.js"></script>
    <!-- DataTable plugin -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/b-1.4.2/b-colvis-1.4.2/r-2.2.0/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/b-1.4.2/b-colvis-1.4.2/r-2.2.0/datatables.min.js"></script>


    <script src="js/managerHomepage-reservations-table.js"></script>
    <script src="js/managerHomepage-all-bikes-table.js"></script>
    <script src="js/reservation-notify.js"></script>


</head>
<body>
<%@include file="part/alert-bar.html" %>
<div class="toolbar">
    <a href="addBike.jsp"> Add Bike </a>
    <a href="userInfo.jsp"> Profile </a>
    <a href="/logout"> Log Out</a>
</div>

<h2>Bikes List</h2>
<table id="all-bikes-table" class="display" width="100%">
    <thead>
    <tr>
        <th>Bike ID</th>
        <th>Model</th>
        <th>Type</th>
        <th>Gender</th>
        <th>Seat Height</th>
        <th>Availability</th>
        <th>Current Holder ID</th>
        <th>Current Holder Name</th>
        <th>Current Holder Email</th>
        <th></th>
    </tr>
    </thead>
</table>

<h2>Reservations List</h2>
<table id="reservations-table" class="display" width="100%">
    <thead>
    <tr>
        <th>Reservation No.</th>
        <th>Customer ID</th>
        <th>Customer Name</th>
        <th>Customer Email</th>
        <th>Bike ID</th>
        <th>Bike Model</th>
        <th>Time</th>
        <th></th>
    </tr>
    </thead>
</table>


<%--
<div id="bikesTable">
    Your Bikes: <br>
    <table>
        <tr>
            <th align="center">Picture</th>
            <th align="center">Model</th>
            <th align="center">Type</th>
            <th align="center" width="40">Seat Height</th>
            <th align="center" width="40">Go To Bike</th>
        </tr>
        <c:forEach items="${bikes}" var="bike">
            <tr onclick="location.reload();locaiton.href = '/bike.jsp?id=${bike.getBikeID()}'">
                <td align="center"><img src="${bike.getPicture()}"></td>
                <td align="center"><c:out value="${bike.getModel()}"/></td>
                <td align="center"><c:out value="${bike.getType()}"/></td>
                <td align="center"><c:out value="${bike.getSeatHeight()}"/></td>
                <td align="center"><a href="/bike.jsp?id=${bike.getBikeID()}">Go</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
--%>

<%--<div id="reservationTable">
    Reservation Requests: <br>
    <table>
        <tr>
            <th align="center">Reservation No.</th>
            <th align="center">Renter</th>
            <th align="center">Bike</th>
            <th align="center" width="40">Time</th>
            <th align="center" width="40">Approve</th>
        </tr>
        <c:forEach items="${reservations}" var="res">
            <tr>
                <td align="center"><img src="${res.getReservationID()}"></td>
                <td align="center"><c:out value="${userDAO.getUser(res.getCustomerID())}"/></td>
                <td align="center"><c:out value="${bikeDAO.getBike(res.getBikeID()).getModel()}"/></td>
                <td align="center"><c:out value="${res.getReservationTime()}"/></td>
                <td align="center">Approve</td>
            </tr>
        </c:forEach>
    </table>
</div>--%>


</body>
</html>
