<?php
/**
 * Created by PhpStorm.
 * User: alan
 * Date: 5/09/18
 * Time: 7:13
 */
// archivo para conectarme a la base de datos
	class BasedeDatos extends mysqli{
        var $bloque;
        var $numRegistros;
        function BasedeDatos($servidor, $user, $pwd, $bd){
            $this->connect($servidor, $user, $pwd, $bd);
            if($this->error > '')
                echo $this->error;
        }
        function consulta($query){
            $this->bloque = $this->query($query);
            // echo $query;
            $this->numRegistros = $this->bloque->num_rows;
        }
        function cerrarConexion(){
            $this->close();
        }
        function RegistroObjeto(){ //Objeto
            return $this->bloque->fetch_object();
        }
        function RegistroArreglo(){ //Arreglo
            return $this->bloque->fetch_array(MYSQLI_ASSOC);
        }
        function obtenerUsuario($correo){
            $query="Select id_reg from usuario where correo='$correo' ";
            $this->consulta($query);
            $respuesta=$this->RegistroArreglo();
            $id_reg=$respuesta['id_reg'];
            return $id_reg;
        }

        function asisitirTaller($id_reg,$idtaller){
            $cupo=$this->revisaCupo($idtaller);
            if($cupo>0){
                if($this->revisaLimiTaller($id_reg)){
                    if($this->revisaInscripcion($id_reg,$idtaller)){
                        $query="insert into asiste_taller(id_user,id_taller) value ('$id_reg','$idtaller')";
                        $this->consulta($query);
                        return "success";
                    }
                    else
                        return "error3";//Taller ya inscrito
                }
                else
                    return "error2";//Mas talleres de los que puede inscribir
            }
            else
                return "error1";//sin cupo

        }

        function revisaCupo($idTaller){
            $query="Select cupo from taller where id=$idTaller";
            $this->consulta($query);
            $respuesta=$this->RegistroArreglo();
            $cupo=$respuesta['cupo'];
            return$cupo;
        }
        function revisaLimiTaller($id_user){
            $query="Select *from asiste_taller where id_user=$id_user";
            $this->consulta($query);
            $registros=$this->numRegistros;
            if($registros >2)//Este numero es el que se cambia respecto a la configuracion posiblemente sea el numero mas 1
                return true;
            else
                return false;
        }
        function revisaInscripcion($iduser,$idTaller){
            $query="select * from asiste_taller where id_user=$iduser and id_taller=$idTaller";
            $this->consulta($query);
            $datos=$this->numRegistros;
            if($datos===1)
                return false;
            else
                return true;
        }
    }

?>

