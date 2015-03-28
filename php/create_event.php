<?php
  include_once 'connectDB.php';
  session_start();
  $title       = sanitizeString($_GET['title']);
  $location    = sanitizeString($_GET['location']);
  $time    	   = sanitizeString($_GET['time']);
  $description = sanitizeString($_GET['description']);
  $collabid = sanitizeString($_GET['collabid']);
  $passhash = crypt(sanitizeString($_GET['password']), '123456789!'); //salt is automatically generated
  
  $query = "INSERT INTO _event (title, location, date_time, description, collaborator) VALUES ('$title', '$location', '$time', '$description', '$collabid')";
  $result = queryMysql($query);
  if(!$result)
    die("Database query failed in signup.php.");
  echo $title;
  echo $location . " " . $description;
  echo $collabid;
  echo $time;
?>