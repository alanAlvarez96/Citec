<?php
    //include 'DB.php';
    //var_dump($_SESSION);
    class ConferenciasWS{
        var $conexion;
        public function getConferencias(){
            //echo "estas son las sesiones";
            //var_dump($_SESSION);
            //die();
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $query="select c.id_conferencia,c.nombre,c.descripcion,c.lugar_conf,c.fecha,c.hora,con.nombre as nombreC,con.apellidos as apellidoC,con.biografia
                    from conferencia c inner join conferencista con on c.id_conferencista = con.id_conferencista
                    order by fecha,hora";
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