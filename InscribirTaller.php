<?php
    include "DB.php";
    $user=$_GET['usuario'];
    $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
    if($user!=="")
        $id_reg=$conexion->obtenerUsuario($user);
    else
        echo "error usuario vacio";
    if($id_reg!==""){
        $idTaller=$_GET['taller'];
        $respuesta=$conexion->asisitirTaller($id_reg,$idTaller);
        echo '{"estado":"'.$respuesta.'"}';
    }
    else{
        echo "error no se encontro usuario";
    }



?>