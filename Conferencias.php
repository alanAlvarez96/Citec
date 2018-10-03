<?php
include "DB.php";
/**
 * Created by PhpStorm.
 * User: alan
 * Date: 15/09/18
 * Time: 20:01
 */
    $consulta=$_SESSION['consulta'];
    var_dump($consulta);
    $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
    $arregloGeneral=new ArrayObject();
    $conexion->consulta($consulta);
    $control_registros=$conexion->numRegistros;
    for($r=0;$r<$control_registros;$r++) {
        $datos=$conexion->RegistroArreglo();
        $arregloGeneral[$r]=$datos;
    }
    $conexion->cerrarConexion();
    echo json_encode($arregloGeneral);

?>