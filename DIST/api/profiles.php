<?php
include 'dao/profils.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $profilDAO = new Profils();
        if(isset($_GET['auteur_operation']))
        {
            if(!empty($_GET['recherche']))
            {
                if (!empty($_GET['incomplete']) && $_GET['incomplete'] == 'incomplete')
                {
                    $recherche = $_GET['recherche'];
                    $res = $profilDAO->rechercherProfile($recherche, $_GET['auteur_operation'], true);
                    response($res);
                }
                else
                {
                    $recherche = $_GET['recherche'];
                    $res = $profilDAO->rechercherProfile($recherche, $_GET['auteur_operation']);
                    response($res);
                }

                return;

            }

            if(isset($_GET['incomplete']) && $_GET['incomplete'] == true){
                if(!empty($_GET['id']) && $_GET['id'] != 'undefined' && isset($_GET['is_by_client']) && $_GET['is_by_client'] == true) {
                    $res = $profilDAO->getIncompletProfiles($_GET['incomplete'], $_GET['auteur_operation'], true, $_GET['id']);
                    response($res);
                    return;
                } else {
                    $res = $profilDAO->getIncompletProfiles($_GET['incomplete'], $_GET['auteur_operation']);
                    response($res);
                    return;
                }

            }

            if(!empty($_GET['id']) && $_GET['id'] != 'undefined')
            {

                if(isset($_GET['is_by_client']) && $_GET['is_by_client'] == true){
                    // Un profil
                    $id = intval($_GET['id']);
                    $res = $profilDAO->getByClient($id, $_GET['auteur_operation']);
                    response($res);
                } else {
                    // Un profil
                    $id = intval($_GET['id']);
                    $res = $profilDAO->get($id, $_GET['auteur_operation']);
                    response($res);
                }

            } else {
                // Tous les profils
                // die("TOUS LES PROFILES");
                $res = $profilDAO->get(false, $_GET['auteur_operation']);
                response($res);

            }
        } else
        {
            header('Content-Type: application/json');
            echo json_encode( array(
                    "status" => false,
                    "message" => "Data is not complete"
                )
            );
        }
        break;
    case 'POST':
        $_POST = json_decode(file_get_contents('php://input'), true);
        if(isset($_POST['id_client'], $_POST['username'], $_POST['niveau_adhesion'], $_POST['capital'], $_POST['produit_trading'], $_POST['produit_adhesion'], $_POST['activation_compte'], $_POST['activation_trading'], $_POST['etat_trading'], $_POST['etat_activation'], $_POST['auteur_operation']))
        {
            $profilDAO = new Profils();
            $profil = array($_POST['id_client'], $_POST['username'], $_POST['niveau_adhesion'], $_POST['capital'], $_POST['produit_trading'], $_POST['produit_adhesion'], $_POST['activation_compte'], $_POST['activation_trading'], $_POST['etat_trading'], $_POST['etat_activation']);
            $res = $profilDAO->post($profil, $_POST['auteur_operation']);
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
        if(isset($_PUT['id_client'], $_PUT['username'],$_PUT['niveau_adhesion'], $_PUT['capital'], $_PUT['produit_trading'], $_PUT['produit_adhesion'], $_PUT['activation_compte'], $_PUT['activation_trading'], $_PUT['solde'], $_PUT['etat'], $_PUT['etat_trading'], $_PUT['etat_activation'], $_PUT['password'], $_PUT['etat_produit_adhesion'], $_PUT['id'], $_PUT['auteur_operation']))
        {
            $profilDAO = new Profils();
            $profil = array($_PUT['id_client'], $_PUT['username'],$_PUT['niveau_adhesion'], $_PUT['capital'], $_PUT['produit_trading'], $_PUT['produit_adhesion'], $_PUT['activation_compte'], $_PUT['activation_trading'], $_PUT['solde'], $_PUT['etat'], $_PUT['etat_trading'], $_PUT['etat_activation'], $_PUT['password'], $_PUT['etat_produit_adhesion'], $_PUT['id']);
            if(isset($_PUT['date_activation']) && $_PUT['date_activation'] == 'activated'){
                $res = $profilDAO->put($profil, $_PUT['auteur_operation'], true);
            } else {
                $res = $profilDAO->put($profil, $_PUT['auteur_operation']);
            }
            response($res);
        } else
        {
            header('Content-Type: application/json');
            echo json_encode( array(
                    "status" => false,
                    "message" => "Expected data is not complete"
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
