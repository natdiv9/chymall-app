<?php
include 'dao/profils.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $profilDAO = new Profils();
        if(!empty($_GET['id']))
        {
            // Un profil
            $id = intval($_GET['id']);
            $res = $profilDAO->get($id);
            response($res);
        } else {
            // Tous les profils
            $res = $profilDAO->get();
            response($res);

        }
        break;
    case 'POST':
        $_POST = json_decode(file_get_contents('php://input'), true);
        if(isset($_POST['id_client'], $_POST['username'], $_POST['niveau'], $_POST['produit'], $_POST['etat_compte'], $_POST['etat_trading']))
        {
            $profilDAO = new Profils();
            $profil = array($_POST['id_client'], $_POST['username'], $_POST['niveau'], 1000, $_POST['produit'], $_POST['etat_compte'], $_POST['etat_trading']);
            $res = $profilDAO->post($profil);
            response($res);
        } else
        {
            header('Content-Type: application/json');
            echo json_encode( array(
                    "status" => false,
                    "message" => "POST Profiles: Data is not complete",
                    "data" => $_POST
                )
            );
        }
        break;
    case 'PUT':
        $_PUT = json_decode(file_get_contents('php://input'), true);
        if(isset($_PUT['client_id'], $_PUT['username'],$_PUT['niveau_adhesion'], $_PUT['capital'], $_PUT['produit_trading'], $_PUT['activation_compte'], $_PUT['activation_trading'], $_PUT['solde'], $_PUT['etat'], $_PUT['id']))
        {
            $profilDAO = new Profils();
            $profil = array($_PUT['client_id'], $_PUT['username'],$_PUT['niveau_adhesion'], $_PUT['capital'], $_PUT['produit_trading'], $_PUT['activation_compte'], $_PUT['activation_trading'], $_PUT['solde'], $_PUT['etat'], $_PUT['id']);
            $res = $profilDAO->put($profil);
            response($res);
        } else
        {
            header('Content-Type: application/json');
            echo json_encode( array(
                    "status" => false,
                    "message" => "Update error"
                )
            );
        }
        break;
    case 'DELETE':
        break;
    default:
        http_response_code(405);
        break;
}


// REPONSE

function response($res) {
    if($res[0]) {
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(
            array(
                "status" => true,
                "data" => $res[1]
            ),
            JSON_PRETTY_PRINT
        );
    } else {
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(
            array(
                "status" => false,
                "message" => $res["message"]
            ),
            JSON_PRETTY_PRINT);
    }
}
