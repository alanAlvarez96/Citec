<?php
include "DB.php";
/**
 * Created by PhpStorm.
 * User: alan
 * Date: 15/09/18
 * Time: 20:01
 */
    $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
    $query="select * from conferencia order by fecha,hora";
    $conexion->consulta($query);
    $registros=$conexion->RegistroArreglo();
    $control_registros=$conexion->numRegistros;
    $dia_ant=0;
    for ($r=0;$r<$control_registros;$r++){
        $actividad=$registros[$r];
    }

?>