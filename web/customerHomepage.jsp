<%@ page import="database.dao_impl.StoreDAOImpl" %>
<%--
  Created by IntelliJ IDEA.
  User: johndwyer
  Date: 11/14/17
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Home</title>
    <%
        StoreDAOImpl st = new StoreDAOImpl();
        pageContext.setAttribute("stores", st.getAllStores());
    %>
</head>
<body>
    <div class = "toolbar">
        <a href = "userInfo.jsp"> Profile </a>
        <a href = "login.jsp"> Log Out</a>
    </div>

    <table>
        <tr>
            <th align="center">Name </th><th align="center">Location</th><th align="center" width="40">Hours</th><th align = "center" width = "40">Go To Store</th>
        </tr>
    <c:forEach items = "${stores}" var = "store">
            <tr onclick="location.reload();locaiton.href = '/store.jsp?id=${store.getStoreID()}'">
                <td align="center"><c:out value = "${store.getName()}"/></td>
                <td align ="center"><c:out value = "${store.getLocation()}"/></td>
                <td align = "center"><c:out value = "${store.getTime()}"/></td>
                <td align = "center"><a href = "/store.jsp?id=${store.getStoreID()}">Go</a></td>
            </tr>
    </c:forEach>
    </table>
</body>

</html>
