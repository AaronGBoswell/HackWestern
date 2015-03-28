<?php
  include_once 'connectDB.php';

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
     
    $events = array(
    "id" => $eventID,
    "title" => $eventTitle,
    "collaborator" => $eventCollab,
    "time" => $eventDateTime,
    "description" => $eventDescription,
    "location" => $eventLocation,
    "photo" => $eventPic,
    "url" => $eventWebsite
    
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
     
    $events = array(
    "id" => $eventID,
    "title" => $eventTitle,
    "collaborator" => $eventCollab,
    "time" => $eventDateTime,
    "description" => $eventDescription,
    "location" => $eventLocation,
    "photo" => $eventPic,
    "url" => $eventWebsite
    
    );
   echo json_encode($events);
   }
 echo ']}';
?>