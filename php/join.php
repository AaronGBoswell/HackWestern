<?php
  include_once 'connectDB.php';
  session_start();
  $userid = sanitizeString($_GET['userid']);
  $eventid = sanitizeString($_GET['eventid']);

  $query = "INSERT INTO joins VALUES (NULL,'$userid', '$eventid')";
  $result = queryMysql($query);
  if (!$result)
    die("Database query failed in join.php.");
  echo $userid;
  echo $eventid;
?>