<%--
  Created by IntelliJ IDEA.
  User: johndwyer
  Date: 11/13/17
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>signup</title>
</head>
<body>
    <h1> Welcome ${sessionScope.email}. Please fill out the rest of your account credentials below</h1><br />
    <span style="color: #ff0016;font-weight:bold">${errmsg!=null? errmsg : ''}</span>
    <form method = "POST" action = "checkCredentials.jsp" >
        Password: <input type = "text" name = "password"><br/>
        Name: <input type = "text" name = "fullname"> <br/>
       Account Type:  <input type="radio" name="account" value="customer"> Customer
        <input type="radio" name="account" value="manager"> Manager<br>
        <input type = "submit" value = "Submit">
    </form>
</body>
</html>
