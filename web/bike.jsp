<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="database.dao.BikeDAO" %>
<%@ page import="objects.User" %>
<%@ page import="database.dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    BikeDAO bdb = new BikeDAOImpl();
    User user = (User) session.getAttribute("user");
    int bikeID = user.getCurrentBikeID();
    pageContext.setAttribute("bike", bdb.getBike(bikeID));
    String warnMessage = (String) request.getAttribute("warn");
%>

<html>
<head>
    <title>Bike</title>
    <%@include file="part/common-head-dependency.html" %>
    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;
        $(function () {
            if (warn !== '') {
                $('#warn-message-span').text(warn);
                $('.alert').removeClass("hidden");
            }
        });


        function return_bike(bikeID) {
            $.ajax({
                url: '/return-bike',
                method: 'POST',
                data: {
                    bikeID: bikeID
                },
                async: false,
                success: function (data) {
                    alert(data);
                    window.location.href="/customerHomepage.jsp";
                }
            });
        }
    </script>
    <link rel="stylesheet" type="text/css" href="css/bike.css">
</head>
<body style="margin: 0;">
<%@include file="part/alert-bar.html" %>

<div class="wrapper">
    <div class="topBar">
        <div id="navLogo" onclick="location.href='customerHomepage.jsp'"></div>
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
        <div class="loginButton" onclick="location.href='login.jsp'">Sign Out</div>

        <%--<div id = "userName">Profile</div>--%>
    </div>
    <div class="topBody" style="text-align:center; background-image: url('${bike.picture}');">
        <div class="topBodyContent" style="background:rgba(142, 136, 182, 0.8);">
            <c:out value="${bike.model}"/>
        </div>
    </div>

    <div class="bottomBody" style="text-align:center">
        <div class="bottomBodyContent" id="newestBikesTitle">
                Type: <c:out value="${bike.type}"/><br/>
                Gender: <c:out value="${bike.gender}"/><br/>
                Seat Height:<c:out value="${bike.seatHeight}"/><br/>


            <%
                if (user.isPending()) {
            %>
            <div style="color: #8e88b6;"><br>Pending</div>
            <%
            } else {

            %>
            <br><button onclick="return_bike(<%= bikeID%>)">Return</button>
            <%

                }
            %>


        </div>
    </div>

</div>
</body>
</html>
