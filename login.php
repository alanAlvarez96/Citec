<?php
$wsdl='http://tigger.itc.mx/ws/soapserver_conacad.php/login?wsdl';
//echo "hola";
$cliente=new SoapClient($wsdl);
var_dump($cliente->__getFunctions());
?>