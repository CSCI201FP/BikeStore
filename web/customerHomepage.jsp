<%@ page import="database.dao_impl.StoreDAOImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    StoreDAOImpl st = new StoreDAOImpl();
    pageContext.setAttribute("stores", st.getAllStores());
%>

<html>
<head>
    <title>All Stores</title>

    <%@include file="part/common-head-dependency.html"%>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Open+Sans+Condensed:300" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/customerHomepage.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

</head>
<body style = "margin: 0;">
<%@include file="part/alert-bar.html" %>

<div class="wrapper">
    <div class="topBar">
        <div id="navLogo" onclick="location.href='index.jsp'"></div>
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
    <div class="topBody" style="text-align:center">
        <div class="topBodyContent">

            <div id="map"></div>
            <script>
                function initMap() {
                    var uluru = {lat: 34.0509, lng: -118.2424};
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 11,
                        center: uluru
                    });

                    <c:forEach items="${stores}" var="store">
                        $.get('https://maps.googleapis.com/maps/api/geocode/json?address=<c:out value="${store.getStreetAddress()}"/>&key=AIzaSyDAjop6lBrt7sE8fPOr9LdE37QSYYF5TaQ', function( data ) {
                            var uluru2;
                            var lng;
                            var lat;
                            console.log(data);
                            lat = data.results["0"].geometry.location.lat;
                            lng = data.results["0"].geometry.location.lng;
                            console.log("LAT: " + lat);
                            console.log("LONG: " + lng);
                            uluru2 = {lat : lat, lng : lng};

                            var marker = new google.maps.Marker({
                                position: new google.maps.LatLng(uluru2.lat, uluru2.lng),
                                map: map
                            });
                            console.log("Added a marker");
                        });
                    </c:forEach>
                }
            </script>
            <script async defer
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKxXdiAFt2epM7Sjodt0urEEoW4ij1hmA&callback=initMap">
            </script>


        </div>
    </div>
    <div class="filterBar" style=""></div>
    <div class="bottomBody" style="text-align:center">
        <div class="bottomBodyContent">
            <div id="newestBikesTitle">All stores</div>

                    <ol id="selectable">


                    <c:forEach items="${stores}" var="store" varStatus="loop">


                        <li class="ui-widget-content" onclick="location.reload();location.href = '/store.jsp?id=${store.getStoreID()}'"
                        style = '
                            <%--${loop.index}--%>
                            <c:choose>
                                <c:when test="${loop.first}">
                                    background: url("https://i.imgur.com/nnwTSdy.jpg");
                                    background-position-y: -434px;
                                    border-top-left-radius: 0.5em;
                                    border-top-right-radius: 0.5em;
                                </c:when>
                                <c:when test="${loop.index == 1}">
                                    background: url("https://i.imgur.com/iaCTN3Y.jpg");
                                    background-position-y: -462px;
                                </c:when>
                                <c:otherwise>
                                    background: url("https://i.imgur.com/FqZeXld.jpg");

                                </c:otherwise>
                            </c:choose>
                            <c:if test="${loop.last}">
                                    border-bottom-left-radius: 0.5em;
                                    border-bottom-right-radius: 0.5em;
                            </c:if>
                            ,no-repeat;
                            background-size: 100%;
                            overflow:hidden;
                            padding:1em;
                            padding-bottom: 3.2em;
                            padding-top: 2em;
                            color:white;
                            font-family: "Dosis", sans-serif;
                            font-weight: 100;
                            font-size: 1.5em;
                            text-align: center;

                        '><div style="text-shadow: 0 0 20px black">
                            <c:out value="${store.getName()}"/> | <c:out value="${store.getStreetAddress()}"/> |
                            <c:out value="${store.getHours()}"/>
                        </div>
                        </li>
                    </c:forEach>

                    </ol>
                </div>
    </div>
</div>
</body>

</html>



