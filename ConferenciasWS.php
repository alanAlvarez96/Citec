<?php
    //include 'DB.php';
    class ConferenciasWS{
        var $conexion;
        public function getConferencias(){
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
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
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
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