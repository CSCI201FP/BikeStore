<%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/12/17
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String warn = (String) request.getAttribute("warn");
%>

<html>
<head>
    <title>Login</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/common.css" >
    <script>
        $(function() {
            //check email exist
            $("#email-form").submit(function(e) {
                e.preventDefault();
                $.ajax({
                    url: '/email-check',
                    type: 'post',
                    dataType: 'text',
                    data: $("#email-form").serialize(),
                    success: function(response) {
                        $('#email-div').addClass("hidden");
                        $('.email-input-class').val($('#email-form input[name|=email]').val()).attr("readonly", true);
                        if (response==='existent'){
                            $('#login-div').removeClass("hidden");
                        } else {
                            $('#signup-div').removeClass("hidden");
                        }
                    }
                });
            });

            //signup, need to recheck if the email exist or not

        });



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

        function login(event) {
            event.preventDefault();

        }

    </script>
</head>
<body>

<% if (warn!=null) { %>
<div class="alert">
    <span class="cross_button" onclick="this.parentElement.style.display='none';">x</span>
    <%= warn %>
</div>
<% } %>

<div id="main-div">
    <div id="email-div">
        <form id="email-form">
            Email:<input type="email" name="email">
            <input type="submit" value="Next">
        </form>
    </div>

    <div id="signup-div" class="hidden">
        Sign Up
        <form id="signup-form">
            Email: <input class="email-input-class" type="email" name="email"><span id="emailInfo"></span><br>
            Password: <input type="password" name="password"><span id="passwordInfo"></span><br>
            Name: <input type="text" name="name"><span id="usernameInfo"></span><br>
            Phone: <input type="number" name="phone"><span id="phoneInfo"></span><br>
            <input type="submit" value="Signup">
        </form>
    </div>

    <div id="login-div" class="hidden">
        Input Password
        <form id="login-form" action="/login" method="post">
            Email: <input class="email-input-class" type="text" name="email"><br>
            Password: <input type="password" name="password"><br>
            <input type="submit" value="Login">
        </form>
    </div>

</div>
</body>
</html>
