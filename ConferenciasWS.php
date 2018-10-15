<?php
    //include 'DB.php';
    class ConferenciasWS{
        var $conexion;
        public function getConferencias(){
            $this->conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
            $query="Select * from conferencia order by fecha,hora";
            $this->conexion->consulta($query);
            $control_registros=$this->conexion->numRegistros;
            for($r=0;$r<$control_registros;$r++) {
                $datos=$this->conexion->RegistroArreglo();
                $arregloGeneral[$r]=$datos;
            }
            $this->conexion->cerrarConexion();
            return $arregloGeneral;
        }
        public function getConferencistas(){
            $this->conexion=new BasedeDatos('localhost','alanC','lpmj1212','citec');
            $query="select * from conferencista";
            $this->conexion->consulta($query);
            $control_registros=$this->conexion->numRegistros;
            for($r=0;$r<$control_registros;$r++) {
                $datos=$this->conexion->RegistroArreglo();
                $arregloGeneral[$r]=$datos;
            }
            $this->conexion->cerrarConexion();
            return $arregloGeneral;
        }
    }
?>