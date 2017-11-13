<%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/12/17
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
    <script>
        function validateEmail(){
            var str = document.loginForm.email.value;
            $.ajax({
                type: "GET",
                data: {email: str},
                url: '/login',
                success:function(content)
                {
                    if(content!="false"){
                        $('#login').html(content);
                    }else{
                        window.location('bike.jsp');
                    }
                }
            });
            return false;
        }

        function validateUser() {
            var pass = document.passwordForm.password.value;
            $.ajax({
                type: "POST",
                data: {password: pass},
                url: '/password',
                success:function(content)
                {
                    if(content!="false"){
                        window.location = 'bike.jsp';
                    }else{
                        window.location = 'login.jsp';
                    }
                }
            });
            return false;
        }
    </script>
</head>
<body>
    <div id="login">
        <form name="loginForm" onsubmit="return validateEmail()">
            Email:<input type="text" name = "email">
            <input type="submit" value="Next">
        </form>
    </div>
</body>
</html>
