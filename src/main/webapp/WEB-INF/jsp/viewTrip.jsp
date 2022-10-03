<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <style>
            body{
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('https://www.worldatlas.com/r/w1200/upload/fb/46/c6/shutterstock-311421530.jpg');
                background-size: cover;
            }
            h3{
                color: rgb(144, 171, 223);
                text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
                font-size: 40px;
                text-transform: uppercase;
                position: absolute;
                top: 60px;
                left: 450px;
            }
            #para{
                color: rgb(109, 142, 204);
                text-shadow: 1px 1px 2px black, 0 0 15px blue, 0 0 2px darkblue;
                font-size: 20px;
                position: absolute;
                top: 150px;
                left: 630px;
            }
            #img1{
                position: absolute;
                top: 300px;
                left: 90px;
                width: 350px;
                height: 300px;
            }
            #img2{
                position: absolute;
                top: 300px;
                left: 530px;
                width: 350px;
                height: 300px;
            }
            #addflight {
                position: absolute;
                left: 220px;
                top: 580px;
                padding: 10px 20px;
            }
            #sendApproval {
                position: absolute;
                left: 220px;
                top: 580px;
                padding: 10px 20px;
            }
            #h1{
                border: 1px solid rgb(209, 131, 15);
                outline:#f18407cc solid 5px;
                background-color: rgb(121, 151, 168);
                width: 400px;
                height: 20px;
                text-align: center;
                padding-top: 35px;
                text-transform: uppercase;
                position: absolute;
                top: 120px; left: 100px;
                color: white;
                text-shadow: 1px 1px 2px black, 0 0 15px rgb(216, 114, 177), 0 0 2prgb(214, 26, 136)ue;
                font-size: 25px;
                padding-bottom: 30px;

            }
            #viewTrip{
                color: white;
                font-size: 18px;
                border: 1px solid rgb(209, 131, 15);
                outline:#f18407cc solid 5px;
                background-color: rgb(121, 151, 168);
                width: 400px;
                height: 350px;
                text-align: center;
                position: absolute;
                top: 280px; left: 100px;
                padding-top: 20px;
                padding-bottom: 40px;
            }
            #but1 {
                position: absolute;
                left: 100px;
                top: 700px;
            }
        </style>
</head>
<body onload="onchangeInput();">

<script>
function onchangeInput() {
            if (document.getElementById("status").value == 'CREATED') {
                 document.getElementById("sendApproval").removeAttribute("hidden");
             }
             if (document.getElementById("status").value == 'APPROVED') {
                 document.getElementById("addflight").removeAttribute("hidden");
                 document.getElementById("sendApproval").addAttribute("hidden");
             }
         }
</script>

<form id="form1" name="myform" method="GET" action="/checkStatus" onsubmit="onchangeInput()" ModelAttribute="trip">

    <h1 id="h1">Trip Form</h1>

    <table id="viewTrip">

        <tr>
            <td><label for="id"><b>Id</b></label></td>
            <td><input type="number" name="id" id="id" value="${trip.id}" readonly/></td>
        </tr>
        <tr>
            <td><label for="orderedBy"><b>User Id</b></label></td>
            <td><input type="text" name="description" id="orderedBy" value="${user.id}" readonly/></td>
        </tr>
        <tr>
            <td><label for="description"><b>Description</b></label></td>
            <td><input type="text" name="description" id="description" value="${trip.description}" readonly/></td>
        </tr>

        <tr>
            <td><label for="tripReasonsEnum"><b>Reason for Trip</b></label></td>
            <td><select id="reason" readonly>
                <option value="reason">${trip.reason}</option>
            </select></td>
        </tr>

        <tr>
            <td><label for="status"><b>Status</b></label></td>
            <td><input type="text" name="status" id="status" value="${trip.status}" readonly/></td>
        </tr>
    </table>

    <button type="button"  id="addflight" onclick="window.location.href = 'http://localhost:8082/addFlight'" hidden>Add Flight</button>
    <button class="button button2" type="button" value="sendApproval" id="sendApproval" onclick="window.location.href = '/trips/waitForApproval?id=${trip.id}'" hidden>SEND APPROVAL</button>

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

<!--<form id="form1" name="myform" method="GET"  action="/checkStatus" onsubmit="onchangeInput()" ModelAttribute="trip">-->
<!--    <div style="text-align:center;" class="applicationform">-->
<!--        <h1>Trip Form</h1>-->

<!--        <table id="viewTrip">-->

<!--            <tr>-->
<!--                <td><label for="id"><b>Id</b></label></td>-->
<!--                <td><input type="number" name="id" id="id" value="${trip.id}" readonly/></td>-->
<!--            </tr>-->
<!--            <tr>-->
<!--                <td><label for="orderedBy"><b>User Id</b></label></td>-->
<!--                <td><input type="text" name="description" id="orderedBy" value="${user.id}" readonly/></td>-->
<!--            </tr>-->
<!--            <tr>-->
<!--                <td><label for="description"><b>Description</b></label></td>-->
<!--                <td><input type="text" name="description" id="description" value="${trip.description}" readonly/></td>-->
<!--            </tr>-->

<!--            <tr>-->
<!--                <td><label for="tripReasonsEnum"><b>Reason for Trip</b></label></td>-->
<!--                <td><select id="reason" readonly>-->
<!--                    <option value="reason">${trip.reason}</option>-->
<!--                </select></td>-->
<!--            </tr>-->

<!--            <tr>-->
<!--                <td><label for="status"><b>Status</b></label></td>-->
<!--                <td><input type="text" name="status" id="status" value="${trip.status}" readonly/></td>-->
<!--            </tr>-->
<!--        </table>-->

<!--        <input type="button" value="Add Flight" id="addflight" onclick="window.location.href = 'http://localhost:8082/addFlight'" hidden/>-->
<!--        <button class="button button2" type="button" value="sendApproval" id="sendApproval" onclick="window.location.href = '/trips/waitForApproval?id=${trip.id}'" hidden>SEND APPROVAL</button>-->
<!--    </div>-->
<!--</form>-->
<!--</body>-->
<!--</html>-->