<?php 

//PARA REALIZAR PRUEBAS DE ENVIO
/*echo "TARGET".http_build_query(array(
	"year"=>substr(date("Y"), 2),
	"month"=>date("m"),
	"date"=>date("d"),
	"hour"=>date("2"),
	"minute"=>date("30")
))." ";
*/

echo "TARGET".http_build_query(array(
        "year"=>substr(date("Y"), 2),
        "month"=>date("m"),
        "date"=>date("d"),
        "hour"=>date("G"),
        "minute"=>date("i")
))." ";


?>
