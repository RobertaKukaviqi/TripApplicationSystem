<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <style>
            body{
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('https://www.usnews.com/dims4/USNEWS/deaec29/2147483647/thumbnail/970x647/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F1d%2Fb1%2F759de7a2455f833eab62ee95e001%2F140401-airplanetravel-stock.jpg');
                background-size: cover;
            }
            #form1{
                border: 2px solid rgb(15, 238, 27);
                outline:rgba(0, 63, 26, 0.8) solid 5px;
                background-color: rgba(168, 225, 230, 0.171);
                width: 550px;
                height: 300px;
                text-align: center;
                position: absolute;
                top: 180px;
                left: 100px;
                color: white;
                padding-top: 30px;
            }
            #div1{
                position: absolute;
                left: 100px;
            }
            #but1{
                position: absolute;
                left: 500px;
                top: 480px;
            }
            #submit{
            position: absolute;
                left: 130px;
            }

        </style>
</head>
<body>
<script>
function sendJSON(){
            let result = document.querySelector('.result');
            let description = document.getElementById("description");
            let reason = document.getElementById("reason");
            let userId = document.getElementById("userId");
            let orderedBy = document.getElementById("orderedBy");


            // Creating a XHR object
            let xhr = new XMLHttpRequest();
            let url = "/trips/apply";

            // open a connection
            xhr.open("POST", url, true);

            // Set the request header i.e. which type of content you are sending
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");

            // Create a state change callback
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {

                    // Print received data from server

                    window.location.href = "http://localhost:8082/trips/checkStatus?id=" + this.responseText;
                    //result.innerHTML = this.responseText;
                    //document.getElementById("form1").style.display = "none"
                }
            };

            // Converting JSON data to string
            var data = JSON.stringify({ "description": description.value, "tripReasonsEnum" : reason.value, "ordered_by" : orderedBy.value });

            // Sending data with the request
            xhr.send(data);
        }
</script>

<form id="form1" method="POST" onsubmit="return sendJSON()" ModelAttribute="trip" >
    <div >
        <h1 style="color: rgb(144, 171, 223);text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
            font-size: 30px;text-transform: uppercase;">Trip Application Form</h1>
        <mark>Please fill in this form to apply for a trip</mark>
        <div id="div1">
            <table id="register">

                <tr>
                    <td><label for="orderedBy" style="font-size: 20px;"><b>User Id</b></label></td> &nbsp;&nbsp;&nbsp;
                    <td><input type="text" name="description" id="orderedBy" value="${tripDTO.ordered_by}" readonly/></td>
                </tr>
                <tr>
                    <td><label for="description" style="font-size: 20px;"><b>Description</b></label></td>&nbsp;&nbsp;&nbsp;
                    <td><input type="text" name="description" id="description" required/></td>
                </tr>

                <tr>
                    <td><label for="tripReasonsEnum" style="font-size: 20px;"><b>Reason for Trip</b></label></td>&nbsp;
                    <td><select id="reason">
                        <option value="MEETING">MEETING</option>
                        <option value="TRAINING">TRAINING</option>
                        <option value="PROJECT">PROJECT</option>
                        <option value="WORKSHOP">WORKSHOP</option>
                        <option value="EVENT">EVENT</option>
                        <option value="OTHER">OTHER</option>
                    </select></td>
                </tr>
            </table>
            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button  type="button" value="CREATE" id="submit" onclick="sendJSON()">CREATE</button>
            <button  type="button" value="sendApproval" id="sendApproval" onclick="sendJSON()" hidden>SEND APPROVAL</button>
        </div></div>
</form>

<c:url value="/logout" var="logoutUrl"/>
<form id="logout" action="${logoutUrl}" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <input type="button" id = "but1" value="Logout" onclick="javascript:document.getElementById('logout').submit()">
</c:if>
</body>
</html>