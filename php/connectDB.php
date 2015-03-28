<?php
	$dbhost = "localhost";
	$dbuser = "grapmbht_user";
	$dbpass = "password123";
	$dbname = "grapmbht_db";
	mysql_connect($dbhost,$dbuser,$dbpass) or die(mysql_error());
	mysql_select_db($dbname) or die(mysql_error());

	function queryMysql($query) {
		$result = mysql_query($query) or die(mysql_error());
		return $result;
	}
	function sanitizeString($var) {
		$var = strip_tags($var);
		$var = htmlentities($var);
		$var = stripslashes($var);
	return mysql_real_escape_string($var);
	}
?>
