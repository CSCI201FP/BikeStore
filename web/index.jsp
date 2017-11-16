<%@ page import="database.dao.BikeDAO" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %>
<%@ page import="objects.Bike" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: roker99
  Date: 11/14/17
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <%
        BikeDAOImpl bdb = new BikeDAOImpl();
        Set<Bike> bikes = bdb.getAllBikes();
    %>
    <link rel=icon href=/bikeUp.ico>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Open+Sans+Condensed:300" rel="stylesheet">
    <link rel = "stylesheet" type = "text/css" href = "/css/landingPage.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css"/>


    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>--%>



    <script>
        $(document).ready(function()
        {
            $(".single-item").slick({
                dots: true
            });

        });


    </script>

    <title>BikeUp</title>


</head>
<body style="margin: 0;">
    <div class = "wrapper">
        <div class = "topBar">
            <div id="navLogo"></div>
            <div class = "loginButton" onclick="location.href='login.jsp'">Sign in</div>
            <%--<div id = "profilePicture" style="    float: right; background-size: 100%; overflow:hidden; height: 3em; width: 3em; border-radius: 0.5em; background-image: url("bikeUp.ico"); background-repeat: no-repeat;"></div>--%>
            <%--<div id = "userName">Manager Mike</div>--%>
        </div>
        <div class = "topBody" style = "text-align:center" >
            <div class = "topBodyContent">B I K E U P</div>
        </div>
        <div class = "filterBar" style = ""></div>
        <div class = "bottomBody" style = "text-align:center" >
            <div class = "bottomBodyContent">
                <div id = "newestBikesTitle">Newest bikes</div>
                <div id = "newestBikesCarousel">

                    <div class='single-item'>

                        <%--<c:forEach items = <%bikes%> var = "bike">--%>
                        <%
                            for(Bike bike : bikes)
                            {
                                %>
                        <div class="bike" style = "
                        border-radius: 1em;
                        background-image: url(<%= bike.getPicture()%>);
                        background-repeat: no-repeat;
                        background-size: 100%;
                        overflow:hidden;
                        "></div>
                        <%
                            }
                        %>
                        <%--</c:forEach>--%>



                        <div class= "bike" id="bike1" style = "
                        border-radius: 1em;
                        background-image: url(fe57636da257581cff02f5846e845138.jpg);
                        background-repeat: no-repeat;
                        background-size: 100%;
                        overflow:hidden;
                        "></div>

                        <div class= "bike" id="bike2" style = "
                        border-radius: 1em;
                        background-image: url(https://i.imgur.com/dSCj6Rj.jpg);
                        background-repeat: no-repeat;
                        background-size: 100%;
                        overflow:hidden;
                        "></div>





                    </div>


                </div>
            </div>
        </div>
    </div>
</body>

</html>
