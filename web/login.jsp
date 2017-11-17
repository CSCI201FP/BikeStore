<%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/12/17
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String warnMessage = (String) request.getAttribute("warn");
%>

<html>
<head>
    <title>Login</title>
    <%@include file="part/common-head-dependency.html"%>
    <script>
        var warn = <%= warnMessage != null ? "'" + warnMessage + "'" : "''"%>;

        $(function () {
            if (warn!==''){
                $('#warn-message-span').text(warn);
                $('.alert').removeClass("hidden");
            }
        });

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

            //todo signup, need to recheck if the email exist or not
            $("#signup-form").submit(function (e) {
                e.preventDefault();

                var passwordRegex = /^(?=.*[0-9])(?=.*[A-Z])(?=.{8,})/;
                var phoneRegex = /^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$/;

                var email = $('#signup-form input[name|=email]').val();
                var name = $('#signup-form input[name|=name]').val();
                var password = $('#signup-form input[name|=password]').val();
                var phone = $('#signup-form input[name|=phone]').val();

                if (phoneRegex.test(phone)){
                    phone = phone.replace(phoneRegex, "($1) $2-$3");
                } else {
                    showWarn("The Phone Number Format is Incorrect");
                    return;
                }

                if (!passwordRegex.test(password)){
                    showWarn("Password should be at least 8 number and contain both number and at least 1 uppercase alphabetical character");
                    return;
                }

                if (name===''||name===null){
                    return;
                }

                $.ajax({
                    url: 'signup',
                    type: 'post',
                    dataType: 'text',
                    data: {
                        email: email,
                        name: name,
                        password: password,
                        phone: phone
                    },
                    success: function (response) {
                        if (response==='signup-success'){
                            window.location.href = "/bike.jsp";
                        } else {
                            showWarn("Email Exist");
                        }
                    }
                });
            })
        });

        function showWarn(warnMessage) {
            warn = warnMessage;
            $('#warn-message-span').text(warn);
            $('.alert').removeClass("hidden");
        }
    </script>
</head>
<body>

<%@include file="part/alert-bar.html" %>

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
