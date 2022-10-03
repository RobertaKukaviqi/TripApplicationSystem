<!DOCTYPE html>
<html>
<head>
    <style>
            body{
                background-image: url('https://ichef.bbci.co.uk/news/976/cpsprodpb/22D9/production/_101912980_a350-ulr_rr_sia_v45_resized.jpg');
                background-size: cover;
            }
            #h1{
                color: white;
                text-shadow: 8px 8px 15px #000000;
                font-size: 40px;
                border: 2px solid black;
                outline:rgba(115, 42, 0, 0.8) solid 5px;
                background-color: black;
                width: 600px;
                height: 100px;
                text-align: center;
                padding-top: 35px;
                text-transform: uppercase;
            }
            form{
                position: absolute;
                top: 50px;
                left: 400px;
            }
            #div1{
                position: absolute;
                font-size: 22px;
                border: 1px solid black;
                outline:rgba(115, 42, 0, 0.8) solid 5px;
                background-color: rgba(0,0,0,0.0);
                width: 600px;
                height: 480px;
                text-align: center;
                padding-top: 35px;

            }
            .button {
                border: none;
                color: white;
                padding: 7px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                transition-duration: 0.8s;
                cursor: pointer;
                position: absolute;
                left: 500px;
            }
            .button1{
                background-color: white;
                color: black;
                border: 2px solid rgba(115, 42, 0, 0.8);
                padding: 8px 13px;
                position: absolute;
                top: 440px;
                left: 240px;
            }
            .button1:hover {
                background-color:cornflowerblue;
                color: white;
            }

    </style>
</head>
<body>
<script>
function sendJSON(){
            let result = document.querySelector('.result');
            let arrival_date = document.getElementById("arrival_date");
            let departure_date = document.getElementById("departure_date");
            let userId = document.getElementById("from_location");
            let to_location = document.getElementById("to_location");
            let tripId = document.getElementById("tripId");


            // Creating a XHR object
            let xhr = new XMLHttpRequest();
            let url = "/addFlight";

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
                    document.getElementById("form1").style.display = "none"

                }
            };

            // Converting JSON data to string
            var data = JSON.stringify({ "tripId" : tripId.value, "arrivalDate": arrival_date.value, "departureDate" : departure_date.value, "from" : from_location.value, "to" : to_location.value });

            // Sending data with the request
            xhr.send(data);
        }


</script>

<div class="result">
    <form method="POST" onsubmit="return sendJSON()" ModelAttribute="flight">
        <h1 id="h1">Flight Application Form</h1>

        <br>
        <div id="div1">
            <p style="font-size: 15px; color:white;">Please fill in this form to apply for a trip.</p>

            <label for="Trip Id"><b>Trip Id</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="number" name="tripId" id="tripId" value="${flightDTO.tripId}" required>
            <br><br><br>

            <label for="arrival_date"><b>Arrival Date</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="date" name="arrival_date" id="arrival_date" required>
            <br><br><br>

            <label for="departure_date"><b>Departure Date</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="date" name="departure_date" id="departure_date" required>
            <br><br><br>

            <label for="from_location"><b>From Location</b></label>&nbsp;&nbsp;&nbsp;
            <input type="text" name="from_location" id="from_location" required>
            <br><br><br>

            <label for="to_location"><b>To Location</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="to_location" id="to_location" required>


            <button type="button" class="button button1" id="submit" onclick="sendJSON()">Add Flight</button>
        </div>
    </form>
</div>
</body>
</html>