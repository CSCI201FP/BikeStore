<%--
  Created by IntelliJ IDEA.
  User: johndwyer
  Date: 10/30/17
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <div id = "emailEntry">
        <form method = "POST" action = "LoginValidation"></form>
        Email : <input type = "text" name = "email" /><br/>
        <input type = "submit" value = "EmailSubmit">
    </div>
</body>
</html>
