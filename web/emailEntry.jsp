
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Welcome</title>
    </head>
    <body>
        <h1> Welcome to the Bike Rental Web App</h1><br/>
    <span style="color: #ff0016;font-weight:bold">${errmsg!=null? errmsg : ''}</span>
        <form method = "POST" action = "checkEmail.jsp">
        Email : <input type = "text" name = "email" /><br/>
        <input type = "submit" value = "EmailSubmit">
        </form>
    </body>
</html>
