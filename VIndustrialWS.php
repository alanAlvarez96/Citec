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

        public function InscribirVSocial($user,$idvisita,$asiento,$camion){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $id_reg=$conexion->obtenerUsuario($user);
            $id=(int)$id_reg;
            if($id_reg!==""){
                $respuesta=$conexion->inscSocial($id,$idvisita,$asiento,$camion);
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
            $query="Select id_user from asiste_evento where id_evento=$idevento";
            $conexion->consulta($query);
            $registros=$conexion->numRegistros;
            for($r=0;$r<$registros;$r++){
                $res=$conexion->RegistroArreglo();
                $respuesta[]=$res;
            }
            $conexion->close();
            return $respuesta;
        }

        public function getAsientos($idEvento){
            $query="select asiento,camion from asiste_evento order by camion,asiento";
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $conexion->consulta($query);
            $registros=$conexion->numRegistros;

            for ($r=0;$r<$registros;$r++){
                $res=$conexion->RegistroArreglo();
                $camion=(int)$res["camion"];
                if($camion===1)
                    $asientoO[]=(int)$res["asiento"];
                if($camion===2)
                    $asientoO2[]=(int)$res["asiento"];
            }
            $res=null;
            for ($i=1;$i<=45;$i++){
                if(!is_null($asientoO) && !is_null($asientoO2)){
                    if(!in_array($i,$asientoO))
                        $asientosD[]=$i;
                    if (!in_array($i,$asientoO2))
                        $asientosD2[]=$i;
                }
                else
                    if(!in_array($i,$asientoO))
                        $asientosD[]=$i;
            }
            $conexion->close();
            if(!is_null($asientosD2)){
                $res['camion1']=$asientosD;
                $res['camion2']=$asientosD2;
            }
            else
                $res['camion1']=$asientosD;

          return $res;
        }

    }
?>