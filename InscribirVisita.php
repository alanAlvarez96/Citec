<?php
    include "DB.php";
    $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
    if(isset($_GET['user']))
        $id_reg=$conexion->obtenerUsuario($_GET['user']);
    else
        echo "error usuario vacio";
    if($id_reg!=="" && isset($_GET['visita'])){
        $idvisita=$_GET['visita'];
        $respuesta=$conexion->inscribirVisita($id_reg,$idvisita);
        echo '{"estado":"'.$respuesta.'"}';
    }
?>