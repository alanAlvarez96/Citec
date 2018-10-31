<?php
    //include 'DB.php';
    class TallerWS{
        var $conexion;
        public function getTalleres(){
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $query="Select * from taller order by fecha,hora";
            $this->conexion->consulta($query);
            $registros=$this->conexion->numRegistros;
            for($r=0;$r<$registros;$r++) {
                $datos=$this->conexion->RegistroArreglo();
                $arregloGeneral[$r]=$datos;
            }
            return $arregloGeneral;
        }
        public function inscribirTaller($user,$idTaller){
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $id_reg=$this->conexion->obtenerUsuario($user);
            $id=(int)$id_reg;
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            if($id_reg!==""){
                $respuesta=$this->conexion->asisitirTaller($id,(int)$idTaller);
                $res['estado']=$respuesta;
            }
           return $res;
        }
        public function ListaTaller($idtaller){
            $conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $query="Select id_user from asiste_taller where id_taller=$idtaller";
            $conexion->consulta($query);
            $registros=$conexion->numRegistros;
            for($r=0;$r<$registros;$r++){
            $res=$conexion->RegistroArreglo();
            $respuesta[]=$res;
            }

            $conexion->close();
            return $respuesta;
        }

    }
