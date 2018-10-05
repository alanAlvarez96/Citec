<?php
    include "DB.php";
    $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
    if(isset($_GET['user']))
        $id_reg=$conexion->obtenerUsuario($_GET['user']);
    else
        echo "error usuario vacio";
    if($id_reg!=="" && isset($_GET['social'])){
        $idvsocial=$_GET['social'];
        $asiento=$_GET['asiento'];
        $respuesta=$conexion->inscSocial($id_reg,$idvsocial,$asiento);
        echo '{"estado":"'.$respuesta.'"}';
    }
?>