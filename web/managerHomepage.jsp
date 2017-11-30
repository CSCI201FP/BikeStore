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
    String warnMessage = (String) request.getAttribute("warn");

%>

<html>
<head>
    <title>Manager Homepage </title>
    <%@include file="part/common-head-dependency.html" %>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
            integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Open+Sans+Condensed:300" rel="stylesheet">

    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>



    <!-- Notify plugin -->
    <link rel="stylesheet" type="text/css" href="css/notify.css">
    <script src="js/notify.min.js"></script>
    <!-- DataTable plugin -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/b-1.4.2/b-colvis-1.4.2/r-2.2.0/datatables.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/managerHomepage.css">
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/b-1.4.2/b-colvis-1.4.2/r-2.2.0/datatables.min.js"></script>


    <script src="js/managerHomepage-reservations-table.js"></script>
    <script src="js/managerHomepage-all-bikes-table.js"></script>
    <script src="js/reservation-notify.js"></script>




    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;
        $(function () {
            if (warn!==''){
                $('#warn-message-span').text(warn);
                $('.alert').removeClass("hidden");
            }
        });
    </script>

    <style>
        .bike-img-big {
            margin: auto;
            height: 26em;
        }
    </style>

</head>
<body style = "margin: 0;">
    <%@include file="part/alert-bar.html" %>
    <div class="wrapper">
        <div class="topBar">
            <div id="navLogo"></div>
            <div id = "profilePicture" onclick="location.href='userInfo.jsp'" style="
    float: right;
    background-size: 60%;
    background-position: center;
    overflow: hidden;
    height: 1.85em;
    width: 1.85em;
    border-radius: 1.5em;
    margin-top: 0.5em;
    border: 1px solid white;
    background-image: url(https://i.imgur.com/VwKBYI3.png?1);
    background-repeat: no-repeat; margin-right: 0.68em;">

            </div>
            <div class="loginButton" onclick="location.href='addBike.jsp'">+<i class="fa fa-bicycle" aria-hidden="true"></i></div>
            <div class="loginButton" onclick="location.href='login.jsp'"><i class="fa fa-sign-out" aria-hidden="true"></i>Sign out</div>


            <%--<div id = "userName">Profile</div>--%>
        </div>
        <div class="topBody" style="text-align:center">
            <div class="topBodyContent">
                <div class="newestBikesTitle">Bikes List</div>
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

                <div class="newestBikesTitle">Reservations List</div>
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
            </div>
        </div>

    </div>





</body>
</html>
