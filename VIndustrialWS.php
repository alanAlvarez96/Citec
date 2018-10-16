<?php
    //include 'DB.php';
    class VIndustrialWS{
        public function InscribirVInsdustrial($user,$idvisita){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $id_reg=$conexion->obtenerUsuario($user);
            if($id_reg!=="" && $idvisita!==""){
                $respuesta=$conexion->inscribirVisita($id_reg,$idvisita);
                $res['estado']=$respuesta;
            }
            return $res;
        }

        public function obtenerVIndustrial(){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $query="select * from visita_indus order by fecha,hora";
            $conexion->consulta($query);
            $control_registros=$conexion->numRegistros;
            for($r=0;$r<$control_registros;$r++) {
                $datos=$conexion->RegistroArreglo();
                $arregloGeneral[$r]=$datos;
            }
            $conexion->cerrarConexion();
            return $arregloGeneral;
        }

        public function obtenerVSocial(){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $query="select * from evento_social order by fecha,hora";
            $conexion->consulta($query);
            $control_registros=$conexion->numRegistros;
            for($r=0;$r<$control_registros;$r++) {
                $datos=$conexion->RegistroArreglo();
                $arregloGeneral[$r]=$datos;
            }
            $conexion->cerrarConexion();
            return $arregloGeneral;
        }

        public function InscribirVSocial($user,$idvisita){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $id_reg=$conexion->obtenerUsuario($user);
            if($id_reg!=="" && $idvisita!==""){
                $idvisita=$_GET['visita'];
                $respuesta=$conexion->inscribirVisita($id_reg,$idvisita);
                $res['estado']=$respuesta;
            }
            return $res;
        }
        
    }
?>