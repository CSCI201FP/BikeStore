<%@ page import="database.dao.BikeDAO" %>
<%@ page import="database.dao_impl.BikeDAOImpl" %><%--
  Created by IntelliJ IDEA.
  User: jiaruoxi
  Date: 11/15/17
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Bike</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
    <script>
        function addBike(){
//            var gender = document.addBikeForm.gender.value
//            var sh = document.addBikeForm.seatHeight.value;
//            var type = document.addBikeForm.type.value;
//            var picture = document.addBikeForm.picture.value;
            $.ajax({
                url: '/addBike',
                type: 'post',
                dataType: 'text',
                data: $('#addBikeForm').serialize(),
                success: function(response) {
                    if(response === "success"){
                        $('#info').html("Successfully added!")
                    }else{
                        $('#info').html("Add bike failed!")
                    }
                }
            });
            return false;
        }
    </script>
</head>
<body>
    <h1>Add Bike</h1>
    <form id="addBikeForm" onsubmit="return addBike();">
        Gender <input type = 'text' name="gender"><br>
        Seat Height <input type = 'text' name="seatHeight"><br>
        Type <input type = 'text' name="type"><br>
        Picture <input type = 'text' name="picture"><br>
        <input type="submit"></form>
    </form>
    <div id = "info"></div>
</body>
</html>
