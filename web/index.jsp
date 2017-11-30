<%@ page import="database.dao.BikeDAO" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="objects.Bike" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    BikeDAO bdb = new BikeDAOImpl();
    Set<Bike> bikes = bdb.getAllBikes();
    pageContext.setAttribute("bikes", bikes);
    String warnMessage = (String) request.getAttribute("warn");
%>

<html>
<head>
    <%@include file="part/common-head-dependency.html" %>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Open+Sans+Condensed:300" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/landingPage.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;

        $(function () {
            if (warn!==''){
                $('#warn-message-span').text(warn);
                $('.alert').removeClass("hidden");
            }
        });

        $(function () {
            $(".single-item").slick({
                dots: true
            });
        });
    </script>

    <title>BikeUp</title>


</head>
<body style="margin: 0;">

<%@include file="part/alert-bar.html" %>

<div class="wrapper">
    <div class="topBar">
        <div id="navLogo" onclick="location.href='index.jsp'"></div>
        <div class="loginButton" onclick="location.href='login.jsp'"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign in</div>
        <%--<div id = "profilePicture" style="    float: right; background-size: 100%; overflow:hidden; height: 3em; width: 3em; border-radius: 0.5em; background-image: url("bikeUp.ico"); background-repeat: no-repeat;"></div>--%>
        <%--<div id = "userName">Manager Mike</div>--%>
    </div>
    <div class="topBody" style="text-align:center">
        <div class="topBodyContent">B I K E U P</div>
    </div>
    <div class="filterBar" style=""></div>
    <div class="bottomBody" style="text-align:center">
        <div class="bottomBodyContent">
            <div id="newestBikesTitle">Newest bikes</div>
            <div id="newestBikesCarousel">

                <div class='single-item'>

                    <c:forEach items="${bikes}" var="bike">
                        <div class="bike" style="
                                border-radius: 1em;
                                background: url(<c:out value="${bike.picture}"/>), no-repeat;
                                background-size: 100%;
                                overflow:hidden;">
                        </div>
                    </c:forEach>

                    <%--<div class="bike" id="bike1" style="--%>
                        <%--border-radius: 1em;--%>
                        <%--background: url(fe57636da257581cff02f5846e845138.jpg), no-repeat;--%>
                        <%--background-size: 100%;--%>
                        <%--overflow:hidden;">--%>
                    <%--</div>--%>

                    <%--<div class="bike" id="bike2" style="--%>
                        <%--border-radius: 1em;--%>
                        <%--background: url(https://i.imgur.com/dSCj6Rj.jpg), no-repeat;--%>
                        <%--background-size: 100%;--%>
                        <%--overflow:hidden;">--%>
                    <%--</div>--%>

                </div>


            </div>
        </div>
    </div>
</div>
</body>

</html>
