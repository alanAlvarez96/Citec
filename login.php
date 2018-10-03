<?php
/**
 * Created by PhpStorm.
 * User: alan
 * Date: 20/09/18
 * Time: 0:25
 */
$correo='15030093@itcelaya.edu.mx';
$pass='mafg1212';
$wsdl='http://tigger.itc.mx/ws/soapserver_conacad.php/login?wsdl';
//echo "hola";
$cliente=new nusoap_client($wsdl);
echo "hola";
$parametro=array('em'=>$correo,'ps'=>$pass);
$resultado=$cliente->call('login',$parametro);
echo "hola";
var_dump($resultado);
?>