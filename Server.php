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
        case 2:{
            $_SESSION['consulta']='Select * from conferencista';
            header('Location:Conferencistas.php');
        }
        break;
        case 3:{
            $_SESSION['consulta']='Select * from taller order by fecha,hora';
            header('Location:Talleres.php');
        }
        break;
    }
?>