<?php
include "DB.php";
/**
 * Created by PhpStorm.
 * User: alan
 * Date: 15/09/18
 * Time: 20:01
 */
    if($_GET["peticion"]===1){
    $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
    $query="select * from conferencia order by fecha,hora";
    $arregloGeneral=new ArrayObject();
    $conexion->consulta($query);
    $control_registros=$conexion->numRegistros;
    for($r=0;$r<$control_registros;$r++) {
        $datos=$conexion->RegistroArreglo();
        //var_dump($datos);
        if($dia_actual===""){
            $dia_actual=$datos['fecha'];
            $dia_ant=$datos['fecha'];
            $actividades[$act]=$datos;
            $act++;
        }
        else{
            $dia_actual=$datos['fecha'];
            if($dia_actual===$dia_ant){
                $actividades[$act]=$datos;
                $act++;
            }
            else{
                $dia_ant=$dia_actual;
                $arregloGeneral[$dias]=$actividades;
                $dias=$dias++;
                $act=0;
                $actividades[$act]=$datos;
            }
        }
    }
        echo json_encode($arregloGeneral);
    }
    /*//echo $control_registros;
    //$dia_ant=0;
    $columnas=$conexion->bloque->field_count;
   // echo $columnas;
    $datos=$conexion->RegistroArreglo();
    /*echo $datos[1];
    echo $datos[3];
    echo $datos[4];
    $arregloGeneral[0]=$datos;
    echo $arregloGeneral[0][0];
   /* for ($r=0;$r<$control_registros;$r++){
        //$registros=$conexion->RegistroArreglo();
        $registros2=$conexion->RegistroObjeto();
        echo $registros2->nombre;
        for ($c=0;$c<$columnas;$c++) {
            //echo $registros[$c];

        }
    }*/
?>