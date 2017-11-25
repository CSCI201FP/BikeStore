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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
    <script type="text/javascript" src="js/datatables.min.js"></script>

    <script src="js/managerHomepage-reservations-table.js"></script>
    <script src="js/reservation-notify.js"></script>
    <script>
        var all_bikes_DataTable;
        $(function () {
            all_bikes_DataTable = $('#all-bikes-table').DataTable({
                "ajax": {
                    url: "/get-bikes?range=all",
                    dataSrc: ""
                },
                "columns": [
                    {
                        data: null,
                        className: 'details-control',
                        orderable: false,
                        searchable: false,
                        defaultContent: '<i class="fa fa-search-plus" aria-hidden="true"></i>'
                    },
                    {data: 'bikeID'},
                    {data: 'model'},
                    {data: 'type'},
                    {data: 'gender'},
                    {data: 'seatHeight'},
                    {data: 'availability'},
                    {
                        data: "currentHolderID",
                        render: function (data, type, row, meta) {
                            if (data === 0){
                                return "N/A";
                            }else {
                                return data;
                            }
                        }
                    },
                    {data: 'currentHolderName'},
                    {data: 'currentHolderEmail'},
                    {
                        data: 'bikeID',
                        searchable: false,
                        orderable: false,
                        render: function (data, type, row, meta) {
                            return "<button type='button' onclick= 'deleteBike(" + data + ")'>Delete</button>";
                        }
                    }
                ],
                "columnDefs": [
                    {
                        targets: '_all',
                        className: 'dt-center'
                    }
                ],
                "order": []
            });

            // Add event listener for opening and closing details
            $('#all-bikes-table tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = all_bikes_DataTable.row(tr);

                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                    $(this).html('<i class="fa fa-search-plus" aria-hidden="true"></i>');
                }
                else {
                    // Open this row
                    row.child(format(row.data())).show();
                    tr.addClass('shown');
                    $(this).html('<i class="fa fa-search-minus" aria-hidden="true"></i>');
                }
            });

        });

        //todo under what condition we can safely delete a bike?
        function deleteBike(bikeID) {
            //todo do a condition check, like this bike is not reserved now...
            $.ajax({
                url: '/delete-bike',
                method: 'POST',
                async: false,
                data: {
                    bikeID: bikeID
                },
                success: function (data) {
                    alert(data);
                    bikesDataTable.ajax.reload();
                }
            });
        }

        function format(d) {
            // `d` is the original data object for the row
            return  '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
                        '<tr>' +
                            '<td>Image:</td>' +
                            '<td><img class="bike-img-big" src="' + d.picture + '"></td>' +
                        '</tr>' +
                    '</table>';
        }

    </script>


</head>
<body>
<%@include file="part/alert-bar.html" %>
<div class="toolbar">
    <a href="addBike.jsp"> Add Bike </a>
    <a href="userInfo.jsp"> Profile </a>
    <a href="login.jsp"> Log Out</a>
</div>

<h2>Bikes List</h2>
<table id="all-bikes-table" class="display">
    <thead>
    <tr>
        <th></th>
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
<table id="reservations-table" class="display">
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
