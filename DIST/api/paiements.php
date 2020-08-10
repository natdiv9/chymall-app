<?php
include 'dao/paiements.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $paiementDAO = new Paiements();
        if(!empty($_GET['id']))
        {
            // Un profil
            $id = intval($_GET['id']);
            $res = $paiementDAO->get($id);
            response($res);
        } else {
            // Tous les profils
            $res = $paiementDAO->get();
            response($res);

        }
        break;
    case 'POST':
        $_POST = json_decode(file_get_contents('php://input'), true);
        if(isset($_POST['profil_id'], $_POST['montant'], $_POST['motif']))
        {
            $paiementDAO = new Paiements();
            $paiement = array($_POST['profil_id'], $_POST['montant'], $_POST['motif']);
            $res = $paiementDAO->post($paiement);
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
        if(isset($_PUT['profil_id'], $_PUT['montant'],$_PUT['motif'], $_PUT['id']))
        {
            $paiementDAO = new Paiements();
            $paiement = array($_PUT['profil_id'], $_PUT['montant'],$_PUT['motif'], $_PUT['id']);
            $res = $paiementDAO->put($paiement);
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