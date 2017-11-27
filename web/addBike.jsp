<%@ page import="database.dao.BikeDAO" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %>
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
        $(function () {
            if (warn!==''){
                $('#warn-message-span').text(warn);
                $('.alert').removeClass("hidden");
            }
        });


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
    Gender
    <input type="radio" name="gender" value="male"> Male
    <input type="radio" name="gender" value="female"> Female<br>
    Type
    <input type="radio" name="type" value="mountain"> Mountain
    <input type="radio" name="type" value="road"> Road
    <input type="radio" name="type" value="other"> Other<br>
    <%--<input type='text' name="seatHeight"><br>--%>
    Seat height <input type='text' name="seatHeight"><br>
    Model <input type="text" name="model"><br>
    Picture URL <input type='text' name="picture"><br>
    <input type="submit"></form>
</form>
<div id="info"></div>
</body>
</html>
