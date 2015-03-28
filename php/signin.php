<?php
  include_once 'connectDB.php';
  session_start();
  $username = sanitizeString($_GET['username']);
  $passhash = crypt(sanitizeString($_GET['password']), '123456789!'); 
 
  //verify if user exists
  $query = "SELECT username FROM user WHERE username = '$username'";
  $result = queryMysql($query);

  if(mysql_num_rows($result) == 0)
    die("Invalid username.");

  $query = "SELECT id, firstname, lastname, program, year, username FROM user WHERE username = '$username' AND pass_hash = '$passhash'";

  $result = queryMysql($query);

  if(mysql_num_rows($result) == 0)
    die("Invalid password.");
  else {
    echo "Login successful."
    session_regenerate_id();
    $member = mysql_fetch_assoc($result);

    $_SESSION['SESS_ID'] = $member['id'];
    $_SESSION['SESS_FIRST_NAME'] = $member['firstname'];
    $_SESSION['SESS_LAST_NAME'] = $member['lastname'];
    $_SESSION['SESS_PROGRAM'] = $member['program'];
    $_SESSION['SESS_YEAR'] = $member['year'];
    $_SESSION['SESS_USERNAME'] = $member['username'];
  }

?>