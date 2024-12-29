<?php 

if(file_exists(__DIR__."/DB/connection.php")){
    require_once(__DIR__."/DB/connection.php");
}


if (file_exists(__DIR__ ."/app/functions.php")) {
    require_once(__DIR__."/app/functions.php");
}

connection();