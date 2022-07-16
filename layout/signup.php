<?php
if ($_SESSION["signinstatus"] != 1&&$_SERVER["REQUEST_METHOD"] == "POST") {
  $last_name = $last_nameErr = $first_name = $first_nameErr = $username = $usernameErr = $password = $passwordErr = $re_password = $re_passwordErr = $email = $emailErr = $numberphone = $numberErr = $address = $addressErr ="";
  
    if (empty($_POST["last_name"])) {
      $last_nameErr = "Last Name is required";
      
    } else {
      
      $last_name = test_input($_POST["last_name"]);
      // check if name only contains letters and whitespace
    }

    if (empty($_POST["first_name"])) {
        $first_nameErr = "First Name is required";
      } else {
        $first_name = test_input($_POST["first_name"]);
        // check if name only contains letters and whitespace
      }
    if (empty($_POST["username"])) {
        $usernameErr = "Username is required";
    }
    else {
        $username = test_input($_POST["username"]);
        $query = 'SELECT * FROM getinfo_allacuser() WHERE username = \''.$username.'\'';
	      $result = pg_query($Conn,$query);
        if(pg_num_rows($result) != 0){
          $usernameErr = "username already exists.";
        }
    }
    if (empty($_POST["password"])) {
        $passwordErr = "Password is required";
    }  
    else{
      $password = test_input($_POST["password"]); 
    }
    if (empty($_POST["re_password"])) {
      $re_passwordErr = "re_Password is required";
    }  
    else{
      $re_password = test_input($_POST["re_password"]);
      if($password != $re_password){
        $re_passwordErr = "Password not equal repassword";
      }    
    }
       if (empty($_POST["numberphone"])) {
        $numberErr = "numberphone is required";
      }
      else {
        $numberphone = test_input($_POST["numberphone"]);
        // check if numberphone only number
        if (!preg_match("/^[0-9]*$/",$numberphone)) {
          $numberphoneErr = "Only Number allowed";
        }
        else{
          $query = 'SELECT * FROM getinfo_allacuser() WHERE phone = \''.$numberphone.'\'';
          $result = pg_query($Conn,$query);
          if(pg_num_rows($result) != 0){
            $numberErr = "numberphone already exists.";
          }
        }
      }
      if (empty($_POST["address"])) {
        $addressErr = "Address is required";
      } else {
        $address = test_input($_POST["address"]);
        // check if name only contains letters and whitespace
      }

    if (empty($_POST["email"])) {
      $emailErr = "Email is required";
    } 
     else {
      $email = test_input($_POST["email"]);
      // check if e-mail address is well-formed
      if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $emailErr = "Invalid email format";
      }
      else {
        $query = 'SELECT * FROM getinfo_allacuser() WHERE email = \''.$email.'\'';
          $result = pg_query($Conn,$query);
          if(pg_num_rows($result) != 0){
            $emailErr = "email already exists.";
          }
      }
    }
    if($last_nameErr == "" && $first_nameErr == "" && $usernameErr == "" && $emailErr == "" && $addressErr == "" && $passwordErr == ""&& $usernameErr == "" && $re_passwordErr == ""&& $numberErr == ""){
      $result = pg_prepare($Conn, "my_insertuser", 'INSERT INTO user_info(first_name,last_name,username,password,email,address,phone) values($1,$2,$3,$4,$5,$6,$7)');
      if($query = pg_execute($Conn,"my_insertuser",array($first_name,$last_name,$username,$password,$email,$address,$numberphone))){
        $result = pg_query($Conn,'SELECT * FROM getinfo_acuser(\''.$username.'\')');
        $row = pg_fetch_assoc($result);
        $_SESSION["signupstatus"] = 1;
        $_SESSION["signinstatus"] = 1;
        $_SESSION["accountname"] = $username;
        $_SESSION["typeaccount"] = "user";
        $_SESSION["accountpassword"] = $password;
        $_SESSION["account_id"]= $row["userinfo_id"]
?>
                <script>
                  alert('Created User Success!');
                </script>
<?php
      }
    else {
?>
                <script>
                  alert('Created User faile!');
                </script>
<?php
          }
    }
    else {
      ?>
                <script>
                  alert('you have some warning in your information');
                </script>
<?php
    }
}
?>
<div class="canvas hide">
		<div class="box">
			<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method= "POST" target = "_self">
				
				<div class="info">
					<p>First Name</p>
					<input type = "text" placeholder ="First name" autocomplete="on" name="first_name"> 
					<span class="error">* <?php if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION["signinstatus"] != 1) echo $first_nameErr;?></span>
				</div>
				<div class="info">
					<p>Last Name</p>
					<input type = "text" placeholder ="Last name" autocomplete="on" name="last_name">
					<span class="error">* <?php if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION["signinstatus"] != 1) echo $last_nameErr;?></span>
				</div>
				<div class="info">
					<p>Username</p>
					<input type = "text" placeholder ="Username" autocomplete="on" name="username">
					<span class="error">* <?php if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION["signinstatus"] != 1) echo $usernameErr;?></span>
				</div>
				<div class="info">
					<p>Password</p>
					<input type = "password" placeholder ="Password" autocomplete="on" name="password">
					<span class="error">* <?php if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION["signinstatus"] != 1) echo $passwordErr;?></span>
				</div>
				<div class="info">
					<p>Repeat Password</p>
					<input type = "password" placeholder ="Re_Password" autocomplete="on" name="re_password">
					<span class="error">* <?php if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION["signinstatus"] != 1) echo $re_passwordErr;?></span>
				</div>
				<div class="info">
					<p>Email</p>
					<input type = "text" placeholder ="Email" autocomplete="on" name="email">
					<span class="error">* <?php if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION["signinstatus"] != 1) echo $emailErr;?></span>
				</div>
				<div class="info">
					<p>Address</p>
					<input type = "text" placeholder ="Address" autocomplete="on" name="address">
					<span class="error">* <?php if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION["signinstatus"] != 1) echo $addressErr;?></span>
				</div>
				<div class="info">
					<p>Numberphone</p>
					<input type = "text" placeholder ="Numberphone" autocomplete="on" name="numberphone">
					<span class="error">* <?php if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION["signinstatus"] != 1) echo $numberErr;?></span>
				</div>
			    <button type="submit">Sign Up</button>
			</form>
		</div>
	</div>