<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    String warnMessage = (String) request.getAttribute("warn");
%>

<html>
<head>
    <title>User Information</title>
    <%@include file="part/common-head-dependency.html"%>

    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;
        $(function () {
            if (warn!==''){
                $('#warn-message-span').text(warn);
                $('.alert').removeClass("hidden");
            }
        });
    </script>
</head>
<body>
    <%@include file="part/alert-bar.html" %>
    <div class="topBar">
    <div id="navLogo" onclick="location.href='index.jsp'"></div>
    <div id = "profilePicture" onclick="location.href='customerHomepage.jsp'" style="
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

    </div>
    <h1>
        ${sessionScope.user.getName()}'s Profile
    </h1>
    <form id = "updateProfileForm" action = "/updateprofile" method = "post">
        Email <input type = "text" placeholder="${sessionScope.user.getEmail()}" name = "email" readonly><br>
        Name: <input type = "text" placeholder="${sessionScope.user.getName()}" name = "name"><br>
        Phone Number:<input type="number" name="phone" placeholder="${sessionScope.user.getPhone()}"><br>
        <input type="submit" value="Update Profile">
    </form>
</body>
</html>
