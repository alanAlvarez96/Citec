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
            $queryTaller="select t.nombre,t.fecha,t.hora,t.lugar,t.Requisitos
                          from asiste_taller at inner join taller t on at.id_taller = t.id
                          where at.id_user=$id_reg";

            $queryVi="select v.empresa,v.hora,v.fecha,v.hora
                      from asiste_visita vi inner join visita_indus v on vi.id_visita = v.id
                      where id_user= $id_reg";

            $queryEs="select social.evento,social.lugar,social.hora,social.fecha,social.observaciones
                      from asiste_evento es inner join evento_social social on es.id_evento = social.id
                      where id_user=$id_reg";

            $this->conexion->consulta($queryTaller);
            $eventos[0]=$this->conexion->RegistroArreglo();

            $this->conexion->consulta($queryVi);
            $eventos[1]=$this->conexion->RegistroArreglo();

            $this->conexion->consulta($queryEs);
            $eventos[2]=$this->conexion->RegistroArreglo();

            $this->conexion->close();
            return $eventos;
        }
        public function TipoyPago($mail){
            $this->conexion=new BasedeDatos($_SESSION['servidor'], $_SESSION['uDB'], $_SESSION['pDB'], $_SESSION['nDB']);
            $id_reg=$this->conexion->obtenerUsuario($mail);
            $query="select estatus,id_tipo
                    from usuario
                    where id_reg=$id_reg";
            $this->conexion->consulta($query);
            $res=$this->conexion->RegistroArreglo();
            return $res;
        }
    }
?>