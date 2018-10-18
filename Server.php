<?php
    session_start();
    $datos = file("configuracion.php");
    echo "datos";
    for($i = 1; $i<count($datos)-1; $i++) {
        $datoSesion = explode("#", $datos[$i]);
        //var_dump($datoSesion);
        $_SESSION[$datoSesion[0]] = trim($datoSesion[1]);
    }
    //var_dump($_SESSION);
    //die();
    include 'DB.php';
    include 'ConferenciasWS.php';
    include 'TallerWS.php';
    include 'VIndustrialWS.php';

    header('Content-Type: application/json');
    $peticion=$_GET['peticion'];
    switch ($peticion){
        case 1:{
            //regresa todas las conferencias
            $conferecias=new ConferenciasWS();
            $respuesta=$conferecias->getConferencias();
        }
        break;
        case 2:{
            //obtiene a todos los conferencistas
            $conferecias=new ConferenciasWS();
            $respuesta=$conferecias->getConferencistas();
        }
        break;
        case 3:{
            //obtiene todos los talleres ordenados
            $taller=new TallerWS();
            $respuesta=$taller->getTalleres();
        }
        break;
        case 4:{
            //inscribe taller
            if(isset($_POST['user'])){
                $user=$_POST['user'];
                $taller=new TallerWS();
                $respuesta=$taller->inscribirTaller($user);
            }
        }
        break;
        case 5:{
            //inscribir visita industrial

            if(isset($_POST['user']) && isset($_POST['visita'])){
                $user=$_POST['user'];
                $id=$_POST['visita'];
                $visita=new VIndustrialWS();
                $respuesta=$visita->InscribirVInsdustrial($user,$id);
            }
        }
        break;
        case 6:{
            //obtiene las vistas industriales  ordenadas
            $visita=new VIndustrialWS();
            $respuesta=$visita->obtenerVIndustrial();
        }
        break;
        case 7:{
            // inscribir vista social
            if(isset($_POST['user']) && isset($_POST['visita'])) {
                $user = $_POST['user'];
                $id = $_POST['visita'];
                $visita = new VIndustrialWS();
                $respuesta = $visita->InscribirVSocial($user, $id);
            }
        }
        break;
        case 8:{
            //obtiene todas los eventos sociales ordenados
            if(isset($_POST['user']) && isset($_POST['visita'])) {
                $user = $_POST['user'];
                $id = $_POST['visita'];
                $visita = new VIndustrialWS();
                $respuesta = $visita->obtenerVSocial();
            }
        }
        break;
    }
        echo json_encode($respuesta);
?>