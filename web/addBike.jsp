<%@ page import="database.dao.BikeDAO" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %><%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/15/17
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String warnMessage = (String) request.getAttribute("warn");
%>
<html>
<head>
    <title>Add Bike</title>

    <%@include file="part/common-head-dependency.html" %>

    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;

        function addBike() {
            $.ajax({
                url: '/addBike',
                type: 'post',
                dataType: 'text',
                data: $('#addBikeForm').serialize(),
                success: function (response) {
                    if (response === "success") {
                        $('#info').html("Successfully added!")
                    } else if (response === "gender") {
                        showWarn("The gender input is wrong");
                    } else if (response === "type") {
                        showWarn("The type input is wrong");
                    } else if (response === "seatHeight") {
                        showWarn("The seat height input is wrong");
                    }
                }
            });
            return false;
        }
    </script>
</head>
<body>

<%@include file="part/alert-bar.html" %>

<h1>Add Bike</h1>
<form id="addBikeForm" onsubmit="return addBike();">
    Gender <input type='text' name="gender"><br>
    Seat Height <input type='text' name="seatHeight"><br>
    Type <input type='text' name="type"><br>
    Picture <input type='text' name="picture"><br>
    Model <input type="text" name="model"><br>
    <input type="submit"></form>
</form>
<div id="info"></div>
</body>
</html>
