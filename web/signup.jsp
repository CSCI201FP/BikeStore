<%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/12/17
  Time: 4:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
    <script>
        function signup(){
            var email = document.signupForm.email.value;
            var password = document.signupForm.password.value;
            var username = document.signupForm.name.value;
            var phone = document.signupForm.phone.value;

            if(email== null || email ==''){
                $('#emailInfo').html("email cannot be empty");
            }
            if(password == null || password ==''){
                $('#passwordInfo').html('password cannot be empty');
            }
            if(username == null || name ==''){
                $('#usernameInfo').html('username cannot be empty');
            }
            if(phone == null || phone ==''){
                $('#phoneInfo').html('phone cannot be empty');
            }

            $.ajax({
                type: "POST",
                data: {email: email, password: password, username: name, phone:phone},
                url: '/signup',
                success:function(content)
                {
                    if (content == "email exist") {
                        $('#emailInfo').html('email already exists');
                    } else {
                        window.location.href = 'userInfo.jsp';
                    }
                }
            });
            return false;
        }

    </script>
</head>
<body>
    Sign Up
    <form name="signupForm" onsubmit="return signup();">
        email <input type="text" name="email"><span id="emailInfo"></span><br>
        password <input type="text" name="password"><span id="passwordInfo"></span><br>
        username <input type="text" name="name"><span id="usernameInfo"></span><br>
        phone <input type="text" name="phone"><span id="phoneInfo"></span><br>
        <input type="submit" value="Next">
    </form>

</body>
</html>
