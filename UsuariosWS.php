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
    }
?>