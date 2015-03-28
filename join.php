<?php
  include_once 'connectDB.php';
  session_start();
  $userid = sanitizeString($_GET['userid']);
  $projectid = sanitizeString($_GET['projectid']);

  echo $userid;
  echo $projectid;
?>