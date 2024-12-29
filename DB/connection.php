<?php 


function connection(){
    try {
        $connect = new PDO("mysql:host=localhost;dbname=facebook","root", "");
        return $connect;
    } catch (PDOException $error) {
        echo $error->getMessage();
    }
}