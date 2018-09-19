<?php
/**
 * Created by PhpStorm.
 * User: alan
 * Date: 19/09/18
 * Time: 15:28
 */
    $peticion=$_GET['peticion'];
    switch ($peticion){
        case 1:{
            $_SESSION['consulta']="Select * from conferencia order by fecha,hora";
            header('Location:Conferencias.php');
        }
        break;

    }
?>