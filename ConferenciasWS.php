<?php
    include 'DB.php';
    class ConferenciasWS{
        public function getConferencias(){
            $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
            $query="Select * from conferencia order by fecha,hora";
            $arregloGeneral=new ArrayObject();
            $conexion->consulta($query);
            $control_registros=$conexion->numRegistros;
            for($r=0;$r<$control_registros;$r++) {
                $datos=$conexion->RegistroArreglo();
                $arregloGeneral[$r]=$datos;
            }
            $conexion->cerrarConexion();
            return $arregloGeneral;
        }
        public function getConferencistas(){
            $conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
            $query="select * from conferencista";
            $arregloGeneral=new ArrayObject();
            $conexion->consulta($query);
            $control_registros=$conexion->numRegistros;
            for($r=0;$r<$control_registros;$r++) {
                $datos=$conexion->RegistroArreglo();
                $arregloGeneral[$r]=$datos;
            }
            $conexion->cerrarConexion();
            return $arregloGeneral;
        }
    }
?>