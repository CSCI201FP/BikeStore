<%--
  Created by IntelliJ IDEA.
  User: johndwyer
  Date: 11/13/17
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="jdbc.*"%>
<html>
<head>
    <title>authenticate</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
    String email = request.getParamater("email");
    if(!email.contains("@")){
        request.setAttribute("errmsg", "That is not a valid email.");
        request.sendRedirect("emailEntry.jsp");
    }
    if(JDBCDriver.checkEmail(email)){
        request.setAttribute("email", email);
        request.sendRedirect("passwordEntry.jsp");

    }
    else{
        request.setAttribute("email", email);
        request.sendRedirect("signup.jsp");
    }
    %>
</head>
<body>

</body>
</html>
