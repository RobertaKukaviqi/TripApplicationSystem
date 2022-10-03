<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <style>
            body{
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('https://images.unsplash.com/photo-1490735891913-40897cdaafd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3Vuc2V0JTIwc2t5fGVufDB8fDB8fA%3D%3D&w=1000&q=80');
                background-size: cover;
            }
            h3{
                color: rgb(144, 171, 223);
                text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
                font-size: 40px;
                text-transform: uppercase;
                position: absolute;
                top: 60px;
                left: 700px;
            }
            #para{
                color: rgb(109, 142, 204);
                text-shadow: 1px 1px 2px black, 0 0 15px blue, 0 0 2px darkblue;
                font-size: 20px;
                position: absolute;
                top: 150px;
                left: 880px;
            }
            #myform{
                position: absolute;
                top: 820px;
                left: 1400px;
            }
            #img1{
                position: absolute;
                top: 340px;
                left: 100px;
                width: 530px;
                height: 400px;
            }
            #img2{
                position: absolute;
                top: 340px;
                left: 700px;
                width: 530px;
                height: 400px;
            }
            #img3{
                position: absolute;
                top: 340px;
                left: 1300px;
                width: 530px;
                height: 400px;
            }
            .button {
                position: absolute;
                left: 1800px;
                top: 900px;
            }

        </style>
</head>
<body>
<script>
                function getUrl() {
                    var id = document.getElementById("id").value;
document.myform.action = id + "/checkStatus";
return true;
}
</script>
<h3>Welcome to the Trips App</h3>
<p id="para">What would you like to do?</p>

<a href="/trips" target="_blank">
    <img id="img1" src="https://img.haikudeck.com/mg/2qKqcnjOhz_1425339351854.jpg" alt="upcomingTrip">
</a>

<a href="/trips/apply" target="_blank">
    <img id="img2" src="https://i1.wp.com/data.travelerstoday.com/data/images/full/54379/photo-by-damaris-isenschmid-on-unsplash.jpg?resize=780,470" alt="applyTrips">
</a>
<p style="position: absolute; top: 760px; left: 920px; color: rgb(148, 12, 137);
text-shadow: 1px 1px 2px black, 0 0 15px rgb(216, 114, 177), 0 0 2prgb(214, 26, 136)ue;
font-size: 18px;"><b>Apply Now!!</b></p>

<img id="img3" src="https://www.liveabout.com/thmb/566Rv5MySLN1ZQzhLx0TnzdjV_U=/2121x1193/smart/filters:no_upscale()/GettyImages-546174996-2fdd841e7dde40078d49b36cab6523f3.jpg" alt="checkTrips">
<p style="position: absolute; top: 760px; left: 1400px; color: rgb(148, 12, 137);
text-shadow: 1px 1px 2px black, 0 0 15px rgb(216, 114, 177), 0 0 2prgb(214, 26, 136)ue;
font-size: 18px;"> <b>Check current trip application status</b></p>

<form id="myform" action="/trips/checkStatus" >
    <label style="color: rgb(148, 12, 137);text-shadow: 1px 1px 2px black, 0 0 15px rgb(216, 114, 177), 0 0 2prgb(214, 26, 136)ue;
    font-size: 18px;"><b>ID</b></label>&nbsp;&nbsp;
    <input type="number" name="id">
    <input type="submit" value="Submit">
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