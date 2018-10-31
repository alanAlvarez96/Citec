<?php
    class UsuariosWS{
        var $conexion;
        public function login($mail,$pwd){
            $wsdl='http://tigger.itc.mx/ws/soapserver_conacad.php/login?wsdl';
            $cliente=new SoapClient($wsdl);
            $parametros=array('em'=>$mail,'ps'=>$pwd);
            $r=$cliente->__soapCall('login',$parametros);
            return $r;
        }
        public function registro($mail,$name,$lastname){
            $wsdl='http://tigger.itc.mx/ws/soapserver_conacad.php/registroCitec?wsdl';
            $cliente=new SoapClient($wsdl);
            $data=array('em'=>$mail,'nombre'=>$name,'apellidos'=>$lastname);
            $r=$cliente->__soapCall('registroCitec',$data);
            return $r;
        }
        public function ActividadesInscritas($mail){
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $id_reg=$this->conexion->obtenerUsuario($mail);
            $user=(int)$id_reg;
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);

            $queryTaller="select t.nombre,t.fecha,t.hora,t.lugar,t.Requisitos
                          from asiste_taller at inner join taller t on at.id_taller = t.id
                          where at.id_user=$user";

            $queryVi="select v.empresa,v.hora,v.fecha,v.hora
                      from asiste_visita vi inner join visita_indus v on vi.id_visita = v.id
                      where id_user= $user";

            $queryEs="select social.evento,social.lugar,social.hora,social.fecha,social.observaciones
                      from asiste_evento es inner join evento_social social on es.id_evento = social.id
                      where id_user=$user";

            $this->conexion->consulta($queryTaller);
            $registros=$this->conexion->numRegistros;
            for ($r=0;$r<$registros;$r++){
                $respuesta[]=$this->conexion->RegistroArreglo();
            }
            $eventos[0]=$respuesta;
            $respuesta=null;


            $this->conexion->consulta($queryEs);
            $registros=$this->conexion->numRegistros;
            for ($r=0;$r<$registros;$r++){
                $respuesta[]=$this->conexion->RegistroArreglo();
            }
            $eventos[1]=$respuesta;

            $this->conexion->close();
            return $eventos;
        }
        public function TipoyPago($mail){
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $id_reg=$this->conexion->obtenerUsuario($mail);
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $user=(int)$id_reg;
            $query="select estatus,id_tipo
                    from usuario
                    where id_reg=$user";
            $this->conexion->consulta($query);
            $res=$this->conexion->RegistroArreglo();
            return $res;
        }
    }
?>