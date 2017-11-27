<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String warnMessage = (String) request.getAttribute("warn");
%>

<html>
<head>
    <title>${sessionScope.user.getName()}</title>


    <%@include file="part/common-head-dependency.html" %>

    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;
        $(function () {
            if (warn !== '') {
                $('#warn-message-span').text(warn);
                $('.alert').removeClass("hidden");
            }
        });
    </script>
    <link rel="stylesheet" type="text/css" href="css/userInfo.css">
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
    background-repeat: no-repeat; margin-right: 0.68em;"></div>
        <div class="loginButton" onclick="location.href='login.jsp'">Sign Out</div>
    </div>
    <div class="topBody" style="text-align:left">
        <div class="topBodyContent">

            Your profile<br>

            <form id="updateProfileForm" action="update-user" method="post">
                Email <input type="text" placeholder="${sessionScope.user.getEmail()}" name="email" readonly
                             style="
                                margin-top:2.5em;
                                padding: 1em;
                                border: 1px solid white;
                                color: rgba(142, 136, 182, 1);
                                border-radius: 0.5em;
                                overflow: hidden;
                                margin-bottom:1em;
                    "><br>
                Name <input type="text" value="${sessionScope.user.getName()}" name="name"
                            style="
                                padding: 1em;
                                border: 1px solid white;
                                color: rgba(142, 136, 182, 1);
                                border-radius: 0.5em;
                                overflow: hidden;
                                margin-bottom:1em;
                               "><br>
                Phone Number <input type="number" name="phone" value="${sessionScope.user.getPhone()}"
                                    style="
                                padding: 1em;
                                border: 1px solid white;
                                color: rgba(142, 136, 182, 1);
                                border-radius: 0.5em;
                                overflow: hidden;
                                margin-bottom:1em;
                                "><br>
                <input type="submit" value="Update profile"
                       style="
                            padding: 1em;
                            border: 1px solid white;
                            color: rgba(142, 136, 182, 1);
                            border-radius: 0.5em;
                            overflow: hidden;
                            margin-top:1em;
                    ">
            </form>
        </div>
    </div>

</body>
</html>
