<?php
    //include 'DB.php';
    class VIndustrialWS{
        public function InscribirVInsdustrial($user,$idvisita){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $id_reg=$conexion->obtenerUsuario($user);
            $id=(int)$id_reg;
            if($id_reg!=="" && $idvisita!==""){
                $respuesta=$conexion->inscribirVisita($id,$idvisita);
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
            $id=(int)$id_reg;
            if($id_reg!=="" && $idvisita!==""){
                $idvisita=$_GET['visita'];
                $respuesta=$conexion->inscribirVisita($id,$idvisita);
                $res['estado']=$respuesta;
            }
            $conexion->close();
            return $res;
        }

        public function ListaVI($idvisita){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $query="Select id_user from asiste_visita where id_visita=$idvisita";
            $conexion->consulta($query);
            $res=$conexion->RegistroArreglo();
            $conexion->close();
            return $res;
        }
        public function ListaES($idevento){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $query="Select id_user from asiste_evento where id_visita=$idevento";
            $conexion->consulta($query);
            $res=$conexion->RegistroArreglo();
            $conexion->close();
            return $res;
        }

        public function getAsientos($idEvento){
            $query="select asiento,camion from asiste_evento order by camion,asiento";
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $conexion->consulta($query);
            $registros=$conexion->numRegistros;

            for ($r=0;$r<$registros;$r++){
                $res=$conexion->RegistroArreglo();
                $asientoO[]=(int)$res["asiento"];
            }

            for ($i=1;$i<=40;$i++){
                if(!in_array($i,$asientoO))
                    $asientosD[]=$i;
            }
            var_dump($asientoO);
            var_dump($asientosD);
            die();
            $conexion->close();
            var_dump($asientosD);
        }


    }
?>