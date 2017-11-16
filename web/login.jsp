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
        function validateEmail() {
            var str = document.loginForm.email.value;
            $.ajax({
                type: "GET",
                data: {email: str},
                url: '/login',
                success: function (content) {
                    if (content !== "false") {
                        $('#login').html(content);
                    } else {
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
                success: function (content) {
                    if (content !== "false") {
                        window.location = 'bike.jsp';
                    } else {
                        window.location = 'signup.jsp';
                    }
                }
            });
            return false;
        }
    </script>
</head>
<body>
<div id="main-div">
    <div id="email-div">
        <form name="email-check-form" onsubmit="return validateEmail()">
            Email:<input type="email" name="email">
            <input type="submit" value="Next">
        </form>
    </div>

    <div id="signup-div">
        Sign Up
        <form name="signupForm" onsubmit="return signup();">
            Email: <input type="email" name="email"><span id="emailInfo"></span><br>
            Password: <input type="password" name="password"><span id="passwordInfo"></span><br>
            Name: <input type="text" name="name"><span id="usernameInfo"></span><br>
            Phone: <input type="number" name="phone"><span id="phoneInfo"></span><br>
            <input type="submit" value="Signup">
        </form>
    </div>

    <div id="password-div">
        Input Password
        <form>
            Email: <input type="text" name="email"><br>
            Password: <input type="password" name="password"><br>
            <input type="submit" value="Login">
        </form>
    </div>
</div>
</body>
</html>
