<?php
    session_start();
    $datos = file("configuracion.php");
    for($i = 1; $i<count($datos)-1; $i++) {
        $datoSesion = explode("#", $datos[$i]);
        $_SESSION[$datoSesion[0]] = trim($datoSesion[1]);
    }
    include 'DB.php';
    include 'ConferenciasWS.php';
    include 'TallerWS.php';
    include 'VIndustrialWS.php';
    include 'UsuariosWS.php';
    $respuesta="";
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
            if(isset($_POST['user']) && isset($_POST['taller'])){
                $user=$_POST['user'];
                $idTaller=$_POST["taller"];

                $taller=new TallerWS();
                $respuesta=$taller->inscribirTaller($user,$idTaller);
            }
            else
                echo "no llego el taller";
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
                $user =$_POST['user'];
                $id =(int) $_POST['visita'];
                $asiento=(int)$_POST['asiento'];
                $camion=(int)$_POST['camion'];
                $visita = new VIndustrialWS();
                $respuesta = $visita->InscribirVSocial($user, $id,$asiento,$camion);
            }
        }
        break;
        case 8:{
            //obtiene todas los eventos sociales ordenados

                $visita = new VIndustrialWS();
                $respuesta = $visita->obtenerVSocial();

        }
        break;
        case 9:
            //login
            if(isset($_POST['mail']) && isset($_POST['pwd'])){
                $mail=$_POST['mail'];
                $pwd=$_POST['pwd'];
                $usuario=new UsuariosWS();
                echo $usuario->login($mail,$pwd);
            }
            break;
        case 10:
            //listas de talleres
            if(isset($_POST['idTaller'])){
                $idTaller=$_POST['idTaller'];
                $taller=new TallerWS();
                $respuesta=$taller->ListaTaller($idTaller);
            }
            break;
        case 11:
            //lista de visitas industriales
            if(isset($_POST['idvisita'])){
                $idVisita=$_POST['idvisita'];
                $visita=new VIndustrialWS();
                $respuesta=$visita->ListaVI($idVisita);
            }
            break;
        case 12:
            //lista de eventos sociales
            if(isset($_POST['idEvento'])){
                $idEvento=$_POST['idEvento'];
                $visita=new VIndustrialWS();
                $respuesta=$visita->ListaES($idEvento);
            }
            break;
        case 13:
            if(isset($_POST['mail']) && isset($_POST['nombre']) && isset($_POST['apellido'])){
                $mail=$_POST['mail'];
                $nombre=$_POST['nombre'];
                $apellido=$_POST['apellido'];
                $user=new UsuariosWS();
                echo $user->registro($mail,$nombre,$apellido);
            }
            break;
        case 14:
            //if(isset($_POST['mail'])){
                $mail=$_POST['mail'];
                $user=new UsuariosWS();
                $respuesta=$user->ActividadesInscritas($mail);
            //}
            break;
        case 15:
            if(isset($_POST['mail'])){
                $mail=$_POST['mail'];
                $user=new UsuariosWS();
                $respuesta=$user->TipoyPago($mail);
            }
            break;
        case 16:
            $visita=new VIndustrialWS();
            $idEvento=$_POST['idEvento'];
            $respuesta=$visita->getAsientos($idEvento);
            break;
    }
        echo json_encode($respuesta);
?>