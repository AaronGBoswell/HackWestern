<?php
  include_once 'connectDB.php';
  session_start();
  $userid = sanitizeString($_GET['userid']);
  $eventid = sanitizeString($_GET['eventid']);

  $query = "DELETE FROM joins WHERE userid = '$userid' AND eventid = '$eventid'";
  $result = queryMysql($query);
  if (!$result)
    die("Database query failed in unjoin.php.");
?>