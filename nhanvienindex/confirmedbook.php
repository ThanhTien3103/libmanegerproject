<?php include "../disconn_andconn/dbconnect.php" ?>
<?php include "../test.php" ?>
<?php include "../status.php" ?>
<script>
	var a = new audio();
	a.src = "../audio/tinylove.mp3";
	a.play();
</script>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/userstyle.css">
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
	
	<title>libmaneger</title>
</head>
<body>

    <div class="user_header">
        <p><?php echo "Hello ". $_SESSION["typeaccount"] ." ". $_SESSION["accountname"]; ?></p>
        <div class ="optionaluser">
            <ul>
            <li class = "logout" style = "font-size:11px;"><a href = "../logout.php"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
                <li class = "profile" style = "font-size:11px;"><a href = "profileuser.php"><i class="fas fa-user"></i>Profile</a></li>
                <li class = "home" style = "font-size:11px;"><a href = "../index.php"><i class="fa fa-home"></i>Home</a></li>
            </ul>
        </div>
    </div>


	<div class="imageintro">
		<img src = "../images/Introlib.jpeg">
	</div>
    <?php include "searchrtbookname.php" ?>
	<div class="tableofbook" style="overflow-x: auto;">
		
		<table>
			  <tr>
				<th>User</th>
				<th>Bookborrow</th>
				<th>ReturnDate</th>
                <th>Fines</th>
                <th>Confirmer</th>
			  </tr>
<?php 

// Perform query
if($searchrtbook == ""){
	$query = 'SELECT * FROM findallreturned()';
}
else{
    $query = 'SELECT * FROM findallreturned() WHERE POSITION(\''.$searchrtbook.'\' in book_name) > 0';
}
	$result = pg_query($Conn,$query);
	if (!$result) {
    	echo "An error occurred.\n";
    	exit;
	}
while ($row = pg_fetch_assoc($result)) {
?>
 	<tr>

 		<td><?php  echo $row["name"]; ?></td>
 		<td><?php  echo $row["book_name"]; ?></td>
 		<td><?php  echo $row["returndate"]; ?></td>
        <td><?php  echo $row["fines"];?></td>
        <td><?php echo $row["username"]; ?></td>
<?php if($row["status"] == "f"){ ?>
        <td>   
            <form action="confirmfines.php" method = "POST">
                <input type = "hidden" name = "transaction_id" value = "<?php echo $row["transaction_id"]?>" >
                <button>Confirm</button>
            </form>
        </td>
<?php } ?>
 	</tr>
<?php
}
?>
</table>
    <?php include "../disconn_andconn/disconnectdb.php" ?>
	
</body>

<script src="../js/app.js"></script>
