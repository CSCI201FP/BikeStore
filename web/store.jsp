<%@ page import="database.dao_impl.StoreDAOImpl" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="database.dao.StoreDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String idstring = request.getParameter("id");
    int id = Integer.valueOf(idstring);

    StoreDAO stdb = new StoreDAOImpl();
    pageContext.setAttribute("store", stdb.getStore(id));
    BikeDAOImpl bdb = new BikeDAOImpl();
    pageContext.setAttribute("bikes", bdb.getAllBikes());

    String warnMessage = (String) request.getAttribute("warn");
%>

<html>
<head>
    <title>${store.name}</title>

    <%@include file="part/common-head-dependency.html" %>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/v/dt/dt-1.10.16/b-1.4.2/b-colvis-1.4.2/r-2.2.0/datatables.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/store.css">
    <script type="text/javascript"
            src="https://cdn.datatables.net/v/dt/dt-1.10.16/b-1.4.2/b-colvis-1.4.2/r-2.2.0/datatables.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Open+Sans+Condensed:300" rel="stylesheet">

    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
            integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>

    <style>
        .bike-img-clip {
            clip-path: circle(60px at center);
            -webkit-clip-path: circle(60px at center);
            margin: auto;
            height: 10em;
        }

        .bike-img-big {
            margin: auto;
            height: 26em;
        }
    </style>

    <script>
        var dataTable;
        $(function () {
            dataTable = $('#bikes-table').DataTable({
                "ajax": {
                    url: "/get-bikes?range=available",
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
                    {
                        data: 'picture',
                        render: function (data, type, row, meta) {
                            return "<img class='bike-img-clip' src=" + data + ">";
                        },
                        searchable: false
                    },
                    {data: 'model'},
                    {data: 'type'},
                    {data: 'gender'},
                    {data: 'seatHeight'},
                    {
                        data: 'bikeID',
                        searchable: false,
                        orderable: false,
                        render: function (data, type, row, meta) {
                            return "<button type='button' class ='button' onclick= 'reserveBike(" + data + ")'>Reserve</button>";
                        }

                    }
                ],
                "columnDefs": [
                    {
                        targets: '_all',
                        className: 'dt-center'
                    }
                ],
                "dom": "frtp",
                "order": []
            });

            // Add event listener for opening and closing details
            $('#bikes-table tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = dataTable.row(tr);

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

        function reserveBike(bikeID) {
            $.ajax({
                url: '/reserve-bike',
                method: 'POST',
                async: false,
                data: {
                    bikeID: bikeID
                },
                success: function () {
                    alert("Your Bike Has Been Reserved. Please Wait For The Email Confirmation From Our Manager");
                    window.location.href = "/bike.jsp";
                }
            });
        }

        function format(d) {
            // `d` is the original data object for the row
            return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
                '<tr>' +
                '<td></td>' +
                '<td><img class="bike-img-big" src="' + d.picture + '"></td>' +
                '</tr>' +
                '</table>';
        }
    </script>

    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;
        $(function () {
            if (warn !== '') {
                $('#warn-message-span').text(warn);
                $('.alert').removeClass("hidden");
            }
        });
    </script>
</head>
<body style="margin:0;">
<%@include file="part/alert-bar.html" %>
<div class="wrapper">
    <div class="topBar">
        <div id="navLogo" onclick="location.href='customerHomepage.jsp'"></div>
        <div id="profilePicture" onclick="location.href='userInfo.jsp'" style="
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
        <div class="loginButton" onclick="location.href='login.jsp'">Sign Out</div>

        <%--<div id = "userName">Profile</div>--%>
    </div>
    <div class="topBody" style="text-align:center">
        <div class="topBodyContent">
            <div id="store">
                <c:out value="${store.name}"/><br/>
                <c:out value="${store.streetAddress}"/><br/>
                Hours: <c:out value="${store.hours}"/>
            </div>
        </div>
    </div>
    <div class="filterBar" style=""></div>
    <div class="bottomBody" style="text-align:center">
        <div class="bottomBodyContent">
            <div id="newestBikesTitle">All stores</div>
            <table id="bikes-table" class="display compact order-column" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th></th>
                    <th>Picture</th>
                    <th>Model</th>
                    <th>Type</th>
                    <th>Gender</th>
                    <th>Seat Height</th>
                    <th></th>
                </tr>
                </thead>
            </table>
        </div>
    </div>


</div>
</body>
</html>
