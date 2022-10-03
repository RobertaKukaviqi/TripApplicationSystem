<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <style>
            body{
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('https://img.freepik.com/free-photo/nature-colorful-landscape-dusk-cloud_1203-5705.jpg');
                background-size: cover;
            }
            h3{
                color: rgb(144, 171, 223);
                text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
                font-size: 40px;
                text-transform: uppercase;
                position: absolute;
                top: 60px;
                left: 650px;
            }
            #para{
                color: rgb(109, 142, 204);
                text-shadow: 1px 1px 2px black, 0 0 15px blue, 0 0 2px darkblue;
                font-size: 20px;
                position: absolute;
                top: 150px;
                left: 820px;
            }
            #img1{
                position: absolute;
                top: 340px;
                left: 120px;
                width: 500px;
                height: 430px;
            }
            #img2{
                position: absolute;
                top: 340px;
                left: 710px;
                width: 500px;
                height: 430px;
            }
            #but1 {
                position: absolute;
                left: 1800px;
                top: 850px;
            }
            .result #reg{
                border: 1px solid rgb(241, 239, 94);
                outline:#fffc61cc solid 5px;
                background-color: rgb(172, 214, 238);
                width: 450px;
                height: 30px;
                text-align: center;
                padding-top: 35px;
                text-transform: uppercase;
                position: absolute;
                top: 330px; left: 1300px;
                color: rgb(148, 12, 137);
                text-shadow: 1px 1px 2px black, 0 0 15px rgb(216, 114, 177), 0 0 2prgb(214, 26, 136)ue;
                font-size: 18px;
                padding-bottom: 25px;
            }
            #myform{
                position: absolute;
                font-size: 25px;
                border: 1px solid black;
                outline:#fffc61cc solid 5px;
                background-color: rgb(172, 214, 238);
                width: 450px;
                height: 200px;
                text-align: center;
                position: absolute;
                top: 450px; left: 1300px;
                padding-top: 100px;
            }
        </style>
</head>
<body>

<script>
function sendJSON(){
            let result = document.querySelector('.result');
            let id = document.getElementById("id");
            let status = document.getElementById("status");

            // Creating a XHR object
            let xhr = new XMLHttpRequest();
            let url = "/trips/changeStatus";

            // open a connection
            xhr.open("POST", url, true);

            // Set the request header i.e. which type of content you are sending
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");

            // Create a state change callback
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {

                    // Print received data from server
                    result.innerHTML = this.responseText;
                    document.getElementById("page").style.display = "none"

                }
            };

            // Converting JSON data to string
            var data = JSON.stringify({ "id": id.value , "status": status.value });

            // Sending data with the request
            xhr.send(data);
        }


</script>

<h3>Welcome to the Trips App</h3>
<p id="para">What would you like to do?</p>

<a href="/trips" target="_blank">
    <img id="img1" src="https://i.pinimg.com/236x/8c/17/7a/8c177a5ea184fd0296f812a1ebe7ba6a.jpg" alt="upcomingTrip">
</a>

<a href="/registration" target="_blank">
    <img id="img2" src="https://www.kindpng.com/picc/m/756-7564789_registration-icon-png-transparent-png.png" alt="registration">
</a>

<div class="result">
    <p id="reg"><b>Change trip application status</b></p>
    <form id="myform" name="myform" method="POST" ModelAttribute="trip">
        <label>ID</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="number" name="id" id="id"><br><br>
        <label>Status</label>&nbsp
        <input type="text" name="status" id="status">
        <br>
        <button style="position: absolute; top: 220px; left: 210px;" value="Submit" id="submit" type="button"
                onclick="sendJSON()">Submit
        </button>
    </form>
</div>


<c:url value="/logout" var="logoutUrl"/>
<form id="logout" action="${logoutUrl}" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <input type="button" id = "but1" value="Logout" onclick="javascript:document.getElementById('logout').submit()">
</c:if>
</body>
</html>


<!--<div class="reg">-->
<!--    <div class="page" id="page>-->
<!--            <div class=" upcomingTrips">-->
<!--    <p>See upcoming trips <a href="/trips">See Future Trips</a>.</p>-->
<!--</div>-->
<!--<div class="register">-->
<!--    <p>Register User <a href="/registration">Register User</a>.</p>-->
<!--</div>-->
<!--<br>-->
<!--<div class="changeStatus">-->
<!--    &nbsp&nbsp&nbsp <p style="color: rgba(215, 78, 153, 0.8);">Change trip application status</p>-->

<!--    <form id="myform" name="myform" onsubmit="return sendJSON()" method="POST">-->
<!--        <label>ID</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-->
<!--        <input type="number" name="id" id="id"><br><br>-->
<!--        <label>Status</label>&nbsp-->
<!--        <input type="text" name="status" id="status">-->
<!--        <button class="button button2" type="button" value="Submit" onclick="sendJSON()">Submit</button>-->
<!--    </form>-->
<!--</div>-->
<!--</div>-->
<!--</div>-->
