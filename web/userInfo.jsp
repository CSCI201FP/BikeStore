<%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/12/17
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
    <title>User Information</title>
</head>
<body>
    <h1>
        ${sessionScope.user.getName()}'s Profile
    </h1>

    Email: <c:out value = "${sessionScope.user.getEmail()}"></c:out><br/>
    Phone Number: <c:out value="${sessionScope.user.getPhone()}"></c:out>

</body>
</html>
