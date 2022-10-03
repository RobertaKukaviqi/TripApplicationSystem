<html>
<head>
    <style>

/*---------------------------------------*/
/* Font */
/*---------------------------------------*/
@import url('https://fonts.googleapis.com/css?family=Roboto');


/*---------------------------------------*/
/* Register Form */
/*---------------------------------------*/
body {
  background:linear-gradient(to right, #78a7ba 0%, #385D6C 50%, #78a7ba 99%);
}

.signup-form {
  font-family: "Roboto", sans-serif;
  width:650px;
  margin:30px auto;
  background:linear-gradient(to right, #ffffff 0%, #fafafa 50%, #ffffff 99%);
  border-radius: 10px;
}

/*---------------------------------------*/
/* Form Header */
/*---------------------------------------*/
.form-header  {
  background-color: #EFF0F1;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.form-header h1 {
  font-size: 30px;
  text-align:center;
  color:#666;
  padding:20px 0;
  border-bottom:1px solid #cccccc;
}

/*---------------------------------------*/
/* Form Body */
/*---------------------------------------*/
.form-body {
  padding:10px 40px;
  color:#666;
}

.form-group{
  margin-bottom:20px;
}

.form-body .label-title {
  color:#1BBA93;
  font-size: 17px;
  font-weight: bold;
}

.form-body .form-input {
    font-size: 17px;
    box-sizing: border-box;
    width: 100%;
    height: 34px;
    padding-left: 10px;
    padding-right: 10px;
    color: #333333;
    text-align: left;
    border: 1px solid #d6d6d6;
    border-radius: 4px;
    background: white;
    outline: none;
}



.horizontal-group .left{
  float:left;
  width:49%;
}

.horizontal-group .right{
  float:right;
  width:49%;
}

input[type="file"] {
  outline: none;
  cursor:pointer;
  font-size: 17px;
}

#range-label {
  width:15%;
  padding:5px;
  background-color: #1BBA93;
  color:white;
  border-radius: 5px;
  font-size: 17px;
  position: relative;
  top:-8px;
}


::-webkit-input-placeholder  {
  color:#d9d9d9;
}

/*---------------------------------------*/
/* Form Footer */
/*---------------------------------------*/
.signup-form .form-footer  {
  background-color: #EFF0F1;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  padding:10px 40px;
  text-align: right;
  border-top: 1px solid #cccccc;
  clear:both;
}

.form-footer span {
  float:left;
  margin-top: 10px;
  color:#999;
  font-style: italic;
  font-weight: thin;
}

.btn {
   display:inline-block;
   padding:10px 20px;
   background-color: #1BBA93;
   font-size:17px;
   border:none;
   border-radius:5px;
   color:#bcf5e7;
   cursor:pointer;
}

.btn:hover {
  background-color: #169c7b;
  color:white;
}





    </style>
</head>
<body>

<script>
function sendJSON(){
            let result = document.querySelector('.result');
            let firstName = document.getElementById("firstName");
            let lastName = document.getElementById("lastName");
            let username = document.getElementById("username");
            let password = document.getElementById("password");
            let confirmPassword = document.getElementById("confirmPassword");
            let role = document.querySelector('input[name="role"]:checked');

            let xhr = new XMLHttpRequest();
            let url = "/registration";

            xhr.open("POST", url, true);
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
            var data = JSON.stringify({ "firstName": firstName.value, "lastName" : lastName.value, "username" : username.value, "password" : password.value, "confirmPassword" : confirmPassword.value, "role" : role.value, "enabled" : 1 });
            xhr.send(data);
        }


</script>

<div class="result">
    <form class="signup-form" id="form1" method="POST" ModelAttribute="user"
          enctype="application/json">

        <div class="form-header">
            <h1>Create Account</h1>
        </div>

        <div class="form-body">
            <div class="horizontal-group">
                <div class="form-group left">
                    <label for="firstName" class="label-title">First name *</label>
                    <input type="text" id="firstName" name="firstName" class="form-input" placeholder="First Name"
                           required="required"/>
                </div>
                <div class="form-group right">
                    <label for="lastName" class="label-title">Last name *</label>
                    <input type="text" id="lastName" name="lastName" class="form-input" placeholder="Last Name"
                           required="required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="label-title">Username *</label>
                <input type="text" id="username" class="form-input" name="username" placeholder="Username"
                       required="required">
            </div>
            <div class="horizontal-group">
                <div class="form-group left">
                    <label for="password" class="label-title">Password *</label>
                    <input type="password" id="password" class="form-input" name="password" placeholder="Password"
                           required="required">
                </div>
                <div class="form-group right">
                    <label for="confirmPassword" class="label-title">Confirm Password *</label>
                    <input type="password" class="form-input" id="confirmPassword" placeholder="Confirm Password"
                           required="required">
                </div>
            </div>
            <div class="horizontal-group">
                <div class="form-group left">
                    <label class="label-title">Role:</label>
                    <div class="input-group">
                        <label for="admin"><input type="radio" name="role" value="admin" id="admin"> Admin</label>
                        <label for="user"><input type="radio" name="role" value="user" id="user"> User</label>
                    </div>
                </div>
                <div class="form-group right">
                    <label class="label-title">Hobbies</label>
                    <div>
                        <label><input type="checkbox" value="Web">Music</label>
                        <label><input type="checkbox" value="iOS">Sports</label>
                        <label><input type="checkbox" value="Andriod">Travel</label>
                        <label><input type="checkbox" value="Game">Movies</label>
                    </div>
                </div>
            </div>
            <div class="form-footer">
                <button type="button" class="registerbtn" value="registerUser" id="submit" onclick="sendJSON()">
                    Register
                </button>
            </div>
        </div>
    </form>
</div>
</body>
</html>