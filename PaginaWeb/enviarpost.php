<?php
   	include("connect.php");
   	
   	$link=Connection();

	if(!isset($_POST['codigo']) )
    		die('Error de parametro');

	$codigo = $_POST['codigo'];
	$ip = $_POST['ip'];
	$tiempo = $_POST['tiempo'];

	$query = "INSERT INTO asistencias (`codigo`,`ip`,`tiempo`) VALUES ('$codigo' , '$ip','$tiempo')";
   	
	if (!mysqli_query($link,$query)) printf("Errormessage: %s\n", mysqli_error($link));
		
	if(mysqli_affected_rows($link) > 0 )
	{
    		echo "SI";
	}
	else
	{
    		echo "NO";
	}

	mysqli_close($link);
?>
