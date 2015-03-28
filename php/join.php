<?php
  include_once 'connectDB.php';
  session_start();
  $userid = sanitizeString($_POST['userid']);
  $eventid = sanitizeString($_POST['eventid']);

  $query = "INSERT INTO joins VALUES (NULL,'$userid', '$eventid')";
  $result = queryMysql($query);
  if (!$result)
    die("Database query failed in join.php.");
  echo $userid;
  echo $eventid;
?>