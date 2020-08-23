<?php
include 'dao/paiements.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $paiementDAO = new Paiements();
        if(isset($_GET['auteur_operation']))
        {
            if(!empty($_GET['id']))
            {
                // Un profil
                $id = intval($_GET['id']);
                $res = $paiementDAO->get($id, $_GET['auteur_operation']);
                response($res);
            } else {
                // Tous les profils
                $res = $paiementDAO->get(false, $_GET['auteur_operation']);
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
        if(isset($_POST['id_profile'], $_POST['montant_trading'],$_POST['montant_inscription'], $_POST['frais_trading'], $_POST['frais_inscription'], $_POST['auteur_operation']))
        {
            $paiementDAO = new Paiements();
            $paiement = array($_POST['id_profile'], $_POST['montant_trading'],$_POST['montant_inscription'], $_POST['frais_trading'], $_POST['frais_inscription']);
            $res = $paiementDAO->post($paiement, $_POST['auteur_operation']);
            response($res);
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
    case 'PUT':
        $_PUT = json_decode(file_get_contents('php://input'), true);
        if(isset($_PUT['id_profile'], $_PUT['montant_trading'],$_PUT['montant_inscription'], $_PUT['frais_trading'], $_PUT['frais_inscription'], $_PUT['id'], $_PUT['auteur_operation']))
        {
            $paiementDAO = new Paiements();
            $paiement = array($_PUT['id_profile:'], $_PUT['montant_trading:'],$_PUT['montant_inscription:'], $_PUT['frais_trading:'], $_PUT['frais_inscription:'], $_PUT['id']);
            $res = $paiementDAO->put($paiement, $_PUT['auteur_operation']);
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