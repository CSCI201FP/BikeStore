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
    <link rel="stylesheet" type="text/css" href="css/userInfo.css">
    <script src="js/notify.min.js"></script>

    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;
        $(function () {
            if (warn !== '') {
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
                        $.notify("A Bike Has Been Added", "info")
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
<body style = "margin:0;">
<%@include file="part/alert-bar.html" %>


<div class="wrapper">
    <div class="topBar">
        <div id="navLogo" onclick="location.href='managerHomepage.jsp'"></div>
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
    background-repeat: no-repeat; margin-right: 0.68em;"></div>
        <div class="loginButton" onclick="location.href='login.jsp'">Sign Out</div>
    </div>
    <div class="topBody" style="text-align:left; height:auto; padding-bottom:3em;">
        <div class="topBodyContent">

            Add bike<br>
            <div style="padding:0.5em; border:1px solid white; border-radius: 0.5em; width: 68%; margin-bottom: 1em; margin-top: 1em;">
            <form id="addBikeForm" onsubmit="return addBike();">
                Gender<br>
                <input type="radio" name="gender" value="male"> Male<br>
                <input type="radio" name="gender" value="female"> Female<br>
                <input type="radio" name="gender" value="neutral"> Neutral<br><br>
                Type<br>
                <input type="radio" name="type" value="mountain"> Mountain<br>
                <input type="radio" name="type" value="road"> Road<br>
                <input type="radio" name="type" value="other"> Other<br><br>
                Seat height <input type='text' name="seatHeight"><br>
                Model <input type="text" name="model"><br>
                Picture URL <input type='text' name="picture"><br><br>
                <input type="submit"></form>
            </form>
            <div id="info"></div>
            </div>
        </div>
    </div>




</body>
</html>
