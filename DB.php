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
            $this->connect($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $query="Select id_reg from usuario where correo='$correo' ";
            $this->consulta($query);
            $respuesta=$this->RegistroArreglo();
            $id_reg=$respuesta['id_reg'];
            $this->close();
            return $id_reg;
        }

        function asisitirTaller($id_reg,$idtaller){
            $this->connect($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $cupo=$this->revisaCupoTaller($idtaller);
            if($cupo>0){
                if($this->revisaLimiTaller($id_reg)){
                    if($this->revisaInscripcionTaller($id_reg,$idtaller)){
                        $query="update taller set cupo=cupo-1  where id=$idtaller";
                        $this->consulta($query);
                        $query="insert into asiste_taller(id_user,id_taller) value ('$id_reg','$idtaller')";
                        $this->consulta($query);
                        $this->close();
                        return "success";
                    }
                    else{
                        $this->close();
                        return "error3";//Taller ya inscrito
                    }
                }
                else{
                    $this->close();
                    return "error2";//Mas talleres de los que puede inscribir
                    }
            }
            else{
                $this->close();
                return "error1";//sin cupo
                }

        }

        function revisaCupoTaller($idTaller){
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
            $query="Select valor from configuracion where campo='numTalleres'";
            $this->consulta($query);
            $configuracion=$this->RegistroArreglo();
            $limite=$configuracion['valor'];
            if($registros >=$limite)//Este numero es el que se cambia respecto a la configuracion posiblemente sea el numero mas 1
                return true;
            else
                return false;
        }
        function revisaInscripcionTaller($iduser, $idTaller){
            $query="select * from asiste_taller where id_user=$iduser and id_taller=$idTaller";
            $this->consulta($query);
            $datos=$this->numRegistros;
            if($datos===1)
                return false;
            else
                return true;
        }
        function inscribirVisita($id_user,$id_visita){
            $this->connect($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $cupo=$this->revisaCupoVisita($id_visita);
            if($cupo>0){
                if($this->revisaInscVisita($id_user)){
                    $query="insert into asiste_visita(id_user,id_visita) value($id_user,$id_visita)";
                    $this->consulta($query);
                    $this->close();
                    return "success";
                }
                else{
                    $this->close();
                    return "error3";
                }
            }
            else{
                $this->close();
                return "error1";
            }
        }
        function revisaCupoVisita($id_visita){
            $query="select cupo from visita_indus where id=$id_visita";
            $this->consulta($query);
            $respuesta=$this->RegistroArreglo();
            $cupo=$respuesta['cupo'];
            return $cupo;
        }
        function revisaInscVisita($id_user){
            //si la consulta no funciona en esta o en alguna otra  que verifique inscripcion solo agregar el resto de la llave
            $query="select * from asiste_visita where id_user=$id_user";
            $this->consulta($query);
            $registros=$this->numRegistros;
            if($registros===1)
                return false;
            else
                return true;
        }
        function inscSocial($id_user,$id_visita,$asiento){
            $this->connect($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            if($this->revisaCupoSocial($id_visita)>0){
                if($this->revisaInscSocial($id_user,$id_visita)){
                    $query="insert into asiste_evento(id_user, id_evento,asiento) value ($id_user,$id_visita,$asiento)";
                    $this->consulta($query);
                    $this->close();
                    return "success";
                }
                else {
                    $this->close();
                    return "error3";
                }
            }
            else{
                $this->close();
                return "error1";
            }
        }
        function revisaCupoSocial($id_visita){
            $query="select cupo from evento_social where id=$id_visita";
            $this->consulta($query);
            $respuesta=$this->RegistroArreglo();
            $cupo=$respuesta['cupo'];
            return $cupo;
        }
        function revisaInscSocial($id_user,$id_visita){
            $query="select * from asiste_evento where id_user=$id_user and id_evento=$id_visita";
            $this->consulta($query);
            $registros=$this->numRegistros;
            if($registros===0)
                return true;
            else
                return false;
        }

    }

?>

