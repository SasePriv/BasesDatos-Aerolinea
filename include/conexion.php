<?php

	$servername = "localhost";
	$dBUsarname = "root";
	$dBPassword = "";
	$dBName = "based_aerolinea";

	$conn = mysqli_connect($servername, $dBUsarname, $dBPassword, $dBName);

	if(!$conn){
		die("Connection failed: ".mysqli_connect_error());
	}
