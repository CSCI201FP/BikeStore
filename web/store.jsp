<%@ page import="util.StoreBackend" %>
<%@ page import="database.dao_impl.StoreDAOImpl" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="database.dao.StoreDAO" %><%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/14/17
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String idstring = request.getParameter("id");
    int id = Integer.valueOf(idstring);

    StoreDAO stdb = new StoreDAOImpl();
    pageContext.setAttribute("store", stdb.getStore(id));
    BikeDAOImpl bdb = new BikeDAOImpl();
    pageContext.setAttribute("bikes", bdb.getAllBikes());
%>

<html>
<head>
    <title>Store</title>
    <%@include file="part/common-head-dependency.html" %>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

    <style>
        .bike-img-clip{
            clip-path: circle(60px at center);
            margin: auto;
            height: 120px;
            width: 120px;
        }

        .bike-img-big{
            margin: auto;
            height: 300px;
        }

        td.details-control {
            cursor: pointer;
        }
        tr.shown td.details-control {
        }

    </style>
    <script>
        $(function () {
            $('#bikes-table').DataTable({
                "ajax": {
                    "url": "/get-available-bikes",
                    "dataSrc": ""
                },
                "columns": [
                    {
                        "className": 'details-control',
                        "orderable": false,
                        "data": null,
                        "searchable": false,
                        "defaultContent": '<i class="fa fa-search-plus" aria-hidden="true"></i>'
                    },
                    {data: 'picture'},
                    {data: 'model'},
                    {data: 'type'},
                    {data: 'gender'},
                    {data: 'seatHeight'},
                    {
                        data: 'bikeID',
                        searchable: false,
                        orderable: false
                    }
                ],
                "columnDefs": [
                    {
                        targets: 1,
                        render: function (data, type, row, meta) {
                            return "<img class='bike-img-clip' src=" + data + ">";
                        },
                        searchable: false
                    },
                    {
                        targets: 6,
                        searchable: false,
                        render: function (data, type, row, meta) {
                            return "<button type='button'>Reserve</button>";
                        }
                    },
                    {
                        targets: '_all',
                        className: 'dt-center'
                    }
                ],
                "order": []
            });

            // Add event listener for opening and closing details
            $('#bikes-table tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = $('#bikes-table').DataTable().row(tr);

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



        function format(d) {
            // `d` is the original data object for the row
            return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
                        '<tr>' +
                            '<td>Image:</td>' +
                            '<td><img class="bike-img-big" src="' + d.picture +'"></td>' +
                        '</tr>' +
                    '</table>';
        }

    </script>
</head>
<body>
<div class="toolbar">
    <a href="userInfo.jsp"> Profile </a>
    <a href="login.jsp"> Log Out</a>
</div>
<div id="store">
    <c:out value="${store.name}"/><br/>
    <c:out value="${store.streetAddress}"/><br/>
    Hours: <c:out value="${store.hours}"/>
</div>
<%--
<div id="bikesTable">
    <table>
        <tr>
            <th align="center">Picture</th>
            <th align="center">Model</th>
            <th align="center">Type</th>
            <th align="center" width="40">Seat Height</th>
            <th align="center" width="40">Go To Bike</th>
        </tr>
        <c:forEach items="${bikes}" var="bike">
            <tr onclick="location.reload(); locaiton.href = '/bike.jsp?id=${bike.getBikeID()}'">
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

<table id="bikes-table" class="display">
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


</body>
</html>
