<%--
  Created by IntelliJ IDEA.
  User: johndwyer
  Date: 10/30/17
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Welcome Back ${sessionScope.email}}</title>
    </head>
    <body>
        <h1> Welcome Back. Please Enter your password.</h1><br />
        <form method = "POST" action = "LoginValidation">
        Password : <input type = "text" name = "password" /><br/>
        <input type = "submit" value = "PasswordSubmit"><br/>
        </form>
        <a href = "emailEntry.jsp"> Back to Email Entry</a>
    </body>
</html>
