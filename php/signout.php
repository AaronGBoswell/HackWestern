<?php
	session_start();

	unset($_SESSION['SESS_ID']);
	unset($_SESSION['SESS_FIRST_NAME']);
	unset($_SESSION['SESS_LAST_NAME']);
	unset($_SESSION['SESS_PROGRAM']);
	unset($_SESSION['SESS_YEAR']);
	unset($_SESSION['SESS_USERNAME']);

	session_destroy();
?>