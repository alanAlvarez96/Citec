<?php
    include 'ConferenciasWS.php';
    include 'TallerWS.php';
    include 'VIndustrialWS.php';
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
            $user=$_GET['user'];
            $taller=new TallerWS();
            $respuesta=$taller->inscribirTaller($user);
        }
        break;
        case 5:{
            //inscribir visita industrial
            $user=$_POST['user'];
            $id=$_POST['visita'];
            $visita=new VIndustrialWS();
            $respuesta=$visita->InscribirVInsdustrial($user,$id);
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
            $user=$_POST['user'];
            $id=$_POST['visita'];
            $visita=new VIndustrialWS();
            $respuesta=$visita->InscribirVSocial($user,$id);

        }
        break;
        case 8:{
            //obtiene todas los eventos sociales ordenados
            $user=$_POST['user'];
            $id=$_POST['visita'];
            $visita=new VIndustrialWS();
            $respuesta=$visita->obtenerVSocial();
        }
        break;
    }

    if($respuesta!=null){
        echo json_encode($respuesta);
    }
?>