<?php
include "DB.php";
    $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
    $arregloGeneral=new ArrayObject();
    $query="select * from evento_social";
    $conexion->consulta($query);
    $control_registros=$conexion->numRegistros;
    for($r=0;$r<$control_registros;$r++) {
        $datos=$conexion->RegistroArreglo();
        $arregloGeneral[$r]=$datos;
    }
    $conexion->cerrarConexion();
    echo json_encode($arregloGeneral);
?>