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
    <link rel="stylesheet" type="text/css" href="css/notify.css" >
    <script src="js/notify.min.js"></script>
    <script src="js/reservation-notify.js"></script>

    <script>
        var socket;

        $.notify.defaults({ className: "success" });

        $.notify.addStyle('notification', {
            html:   "<div>" +
            "<div class='hidden reservationID' data-notify-text='reservationID'></div>"+
            "<div class='message' data-notify-text='messageStr'/>" +
            "<i class='fa fa-times ignore' aria-hidden='true'></i>"+
            "<div class='buttons'>" +
            "<button class='refuse'>Refuse</button>" +
            "<button class='approve'>Approve</button>" +
            "</div>" +
            "</div>"
        });

        $.notify.addStyle('information', {
            html:   "<div><i class=\"fa fa-info\" aria-hidden=\"true\"></i><span data-notify-text/></div>"
        });

        $.notify.addStyle('warning', {
            html:   "<div><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i><span data-notify-text/></div>"
        });

        $(function () {
            socket = new WebSocket("ws://" + window.location.hostname + ":"+window.location.port+"/rs");

            socket.onopen = function () {
                $.notify("Link Start", {
                    style: 'information',
                    showDuration: 400
                });
            };

            socket.onmessage = function (event) {
                var reservationJSON = JSON.parse(event.data);
                $.notify({
                    messageStr: reservationJSON.messageStr,
                    reservationID: reservationJSON.reservationID
                }, {
                    style: 'notification',
                    autoHide: false,
                    clickToHide: false
                });
            };

            socket.onclose = function () {
                $.notify("The server is not reachable", {
                    style: 'warning',
                    autoHide: false
                });
            };
        });

        $(document).on('click', '.notifyjs-notification-base .refuse', function () {
            $.ajax({
                url: "/decide-reservation",
                method: "POST",
                data: {
                    reservationID: $(this).parent().siblings('.reservationID').text(),
                    decision: "refuse"
                }
            });
            $(this).trigger('notify-hide');

        });

        $(document).on('click', '.notifyjs-notification-base .approve', function () {
            $.ajax({
                url: "/decide-reservation",
                method: "POST",
                data: {
                    reservationID: $(this).parent().siblings('.reservationID').text(),
                    decision: "approve"
                }
            });
            $(this).trigger('notify-hide');
        });

        $(document).on('click', '.notifyjs-notification-base .ignore', function () {
            $(this).trigger('notify-hide');
        });
    </script>

</head>
<body>
<%@include file="part/alert-bar.html" %>
<div class="toolbar">
    <a href="addBike.jsp"> Add Bike </a>
    <a href="userInfo.jsp"> Profile </a>
    <a href="login.jsp"> Log Out</a>
</div>

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
<div id="reservationTable">
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
</div>


</body>
</html>
