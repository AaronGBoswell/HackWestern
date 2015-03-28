<?php
  include_once 'connectDB.php';
  session_start();
  $year     = sanitizeString($_GET['year']);
  $program  = sanitizeString($_GET['program']);
  $fname    = sanitizeString($_GET['firstname']);
  $lname    = sanitizeString($_GET['lastname']);
  $username = sanitizeString($_GET['username']);
  $passhash = crypt(sanitizeString($_GET['password']), '123456789!'); //salt is automatically generated
  /*
  how to check password on login
  if (hash_equals($passhash, crypt($username, $passhash))) 
  {
    echo "Password verified!";
  }
  */
 
  //verify if user already exists
  $query = "SELECT username FROM user WHERE username = '$username'";
  $result = queryMysql($query);
  if(mysql_num_rows($result) != 0)
    die("Username already exists.");

  $query = "INSERT INTO user (firstname, lastname, program, year, username, pass_hash) VALUES ('$fname', '$lname', '$program', '$year', '$username', '$passhash')";
  $result = queryMysql($query);
  if(!$result)
    die("Database query failed in signup.php.");
  echo $username;
  echo $fname . " " . $lname;
  echo $program;
  echo $year;
?>