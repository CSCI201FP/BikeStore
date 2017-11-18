<%@ page import="database.dao_impl.ReservationDAOImpl" %>
<%@ page import="java.util.Queue" %>
<%@ page import="objects.Reservation" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="database.dao_impl.UserDAOImpl" %>
<%@ page import="database.dao.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: johndwyer
  Date: 11/14/17
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Manager Homepage </title>

    <%
        ReservationDAOImpl rdb = new ReservationDAOImpl();
        Queue<Reservation> reservations = rdb.getAllReservations();
        pageContext.setAttribute("reservations",reservations);

        BikeDAOImpl bdb = new BikeDAOImpl();
        pageContext.setAttribute("bikes", bdb.getAllBikes());
        pageContext.setAttribute("bikeDAO",bdb);

        UserDAOImpl udb = new UserDAOImpl();
        pageContext.setAttribute("userDAO", udb);

    %>

</head>
<body>
        <div class = "toolbar">
            <a href = "addBike.jsp"> Add Bike </a>
            <a href = "userInfo.jsp"> Profile </a>
            <a href = "login.jsp"> Log Out</a>
        </div>

        <div id ="bikesTable">
            Your Bikes: </br>
            <table>
                <tr>
                    <th align="center">Picture</th><th align="center">Model</th><th align="center">Type</th><th align="center" width="40">Seat Height</th><th align = "center" width = "40">Go To Bike</th>
                </tr>
                <c:forEach items = "${bikes}" var = "bike">
                    <tr onclick="location.reload();locaiton.href = '/bike.jsp?id=${bike.getBikeID()}'">
                        <td align="center"><img src = "${bike.getPicture()}"></td>
                        <td align = "center"><c:out value = "${bike.getModel()}"/></td>
                        <td align="center"><c:out value = "${bike.getType()}"/></td>
                        <td align = "center"><c:out value = "${bike.getSeatHeight()}"/></td>
                        <td align = "center"><a href = "/bike.jsp?id=${bike.getBikeID()}">Go</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div id ="reservationTable">
            Reservation Requests: </br>
            <table>
                <tr>
                    <th align="center">Reservation No.</th><th align="center">Renter</th><th align="center">Bike</th><th align="center" width="40">Time</th><th align = "center" width = "40">Approve</th>
                </tr>
                <c:forEach items = "${reservations}" var = "res">
                    <tr>
                        <td align="center"><img src = "${res.getReservationID()}"></td>
                        <td align = "center"><c:out value = "${udb.getUser(res.getCustomerID())}"/></td>
                        <td align="center"><c:out value = "${bikeDAO.getBike(res.getBikeID()).getModel()}"/></td>
                        <td align = "center"><c:out value = "${res.getReservationTime()}"/></td>
                        <td align = "center">Approve </td>
                    </tr>
                </c:forEach>
            </table>
        </div>


</body>
</html>
