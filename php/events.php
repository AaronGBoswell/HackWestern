<?php
  include_once 'connectDB.php';
  $userid = 1;
  $query  = 'SELECT * FROM _event';
  $result = queryMysql($query);

  if (!$result)
    die("Database query failed in events.php.");
  echo '{"events":[';

  if ($row = mysql_fetch_row($result))
  {
   //echo json_encode($row);

    $eventID = $row[0];
    $eventTitle = $row[1];
    $eventCollab = $row[6]; #change from ID to name
    $eventDateTime = $row[3];
    $eventDescription = $row[5];
    $eventLocation = $row[2];
    $eventPic = $row[4];
    $eventWebsite = $row[7];
     
    $query = "SELECT * FROM joins WHERE eventid = '$row[0]' AND userid = '$userid'";
    $res = queryMysql($query);
    $join = mysql_num_rows($res);
    if( $join > 0){
    	$join = 1;
    }
	$query = "SELECT * FROM joins WHERE eventid = '$row[0]'";
    $res = queryMysql($query) or die(mysql_error());
    $numjoin = mysql_num_rows($res);
    $events = array(
    "id" => $eventID,
    "title" => $eventTitle,
    "collaborator" => $eventCollab,
    "time" => $eventDateTime,
    "description" => $eventDescription,
    "location" => $eventLocation,
    "photo" => $eventPic,
    "url" => $eventWebsite,
    "join" => $join,
    "numjoin" => $numjoin
    );
	echo json_encode($events);

  }
  while ($row = mysql_fetch_row($result))
  {
   //echo json_encode($row);
  echo ',';

    $eventID = $row[0];
    $eventTitle = $row[1];
    $eventCollab = $row[6]; #change from ID to name
    $eventDateTime = $row[3];
    $eventDescription = $row[5];
    $eventLocation = $row[2];
    $eventPic = $row[4];
    $eventWebsite = $row[7];
     
    $query = "SELECT * FROM joins WHERE eventid = '$row[0]' AND userid = '$userid'";
    $res = queryMysql($query);
    $join = mysql_num_rows($res);
    if( $join > 0){
    	$join = 1;
    }
	$query = "SELECT * FROM joins WHERE eventid = '$row[0]'";
    $res = queryMysql($query) or die(mysql_error());
    $numjoin = mysql_num_rows($res);
    $events = array(
    "id" => $eventID,
    "title" => $eventTitle,
    "collaborator" => $eventCollab,
    "time" => $eventDateTime,
    "description" => $eventDescription,
    "location" => $eventLocation,
    "photo" => $eventPic,
    "url" => $eventWebsite,
    "join" => $join,
    "numjoin" => $numjoin
    );
    
   echo json_encode($events);
   }
 echo ']}';
?>