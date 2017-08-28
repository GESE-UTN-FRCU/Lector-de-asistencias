<?php

	include("connect.php"); 	
	
	$link=Connection();

	$result=mysqli_query($link,"SELECT * FROM `asistencias` ORDER BY `tiempo` DESC");
?>

<html>
   <head>
      <title>Lector asistencia - UTN</title>
   </head>
<body>
   <h1>Lecturas</h1>

   <table border="1" cellspacing="1" cellpadding="1">
		<tr>
			<td>&nbsp;Tiempo&nbsp;</td>
			<td>&nbsp;Codigo&nbsp;</td>
			<td>&nbsp;Ultimo digito IP&nbsp;</td>
		</tr>

      <?php 
		  if($result!==FALSE){
		     while($row = mysqli_fetch_array($result)) {
		        printf("<tr><td> &nbsp;%s </td><td> &nbsp;%s&nbsp; </td><td> &nbsp;%s&nbsp; </td></tr>", 
		           $row["tiempo"], $row["codigo"], $row["ip"]);
		     }
		     mysqli_free_result($result);
		     mysqli_close($link);
		  }
      ?>

   </table>
</body>
</html>
