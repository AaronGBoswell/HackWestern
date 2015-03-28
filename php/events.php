<?php
  include_once 'connectDB.php';
  $userid = 1;
  $query  = 'SELECT * FROM _event';
  $result = queryMysql($query) or die(mysql_error());

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
    $res = queryMysql($query) or die(mysql_error());
    $join = mysql_num_rows($res);
    if( $join > 0){
    	$join = 1;
    }
	$query = "SELECT firstname, lastname, program, year FROM user WHERE id = ANY (SELECT userid FROM joins WHERE eventid = '$row[0]')";
    $res = queryMysql($query) or die(mysql_error());
    $numrows = mysql_num_rows($res);
    $joinedArray;
    for($i = 0; $i < $numrows; $i++){
    	$r = mysql_fetch_row($res);
    	$joinedArray[$i] =  array(
    		"firstname" => $r[0],
    		"lastname" => $r[1],
    		"program" => $r[2],
    		"year" => $r[3]
    	);
    }
    $query = "SELECT name FROM collaborator WHERE id = $eventCollab";
    $res = queryMysql($query) or die(mysql_error());
    if ($r = mysql_fetch_row($res))
    	$eventCollab = $r[0];

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
    "joined" => $joinedArray
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
    $res = queryMysql($query) or die(mysql_error());
    $join = mysql_num_rows($res);
    if( $join > 0){
    	$join = 1;
    }
	$query = "SELECT firstname, lastname, program, year FROM user WHERE id = ANY (SELECT userid FROM joins WHERE eventid = '$row[0]')";
    $res = queryMysql($query) or die(mysql_error());
    $numrows = mysql_num_rows($res);
    $joinedArray;
    for($i = 0; $i < $numrows; $i++){
    	$r = mysql_fetch_row($res);
    	$joinedArray[$i] =  array(
    		"firstname" => $r[0],
    		"lastname" => $r[1],
    		"program" => $r[2],
    		"year" => $r[3]
    	);
    }
    $query = "SELECT name FROM collaborator WHERE id = '$eventCollab'";
    $res = queryMysql($query) or die(mysql_error());
    if ($r = mysql_fetch_row($res))
    	$eventCollab = $r[0];

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
    "joined" => $joinedArray
    );
   echo json_encode($events);
   }
 echo ']}';
?>