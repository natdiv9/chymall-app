<?php
include 'dao/retraits.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $retraitsDAO = new Retraits();
        if(!empty($_GET['id']))
        {
            // Un retrait
            $id = intval($_GET['id']);
            $res = $retraitsDAO->get($id);
            response($res);
        } else {
            // Tous les retraits
            $res = $retraitsDAO->get();
            response($res);

        }
        break;
    case 'POST':
        $_POST = json_decode(file_get_contents('php://input'), true);
        if(isset($_POST['profil_id'], $_POST['montant']))
        {
            $retraitDAO = new Retraits();
            $retrait = array($_POST['profil_id'], $_POST['montant']);
            $res = $retraitDAO->post($retrait);
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
        if(isset($_PUT['profil_id'], $_PUT['montant'], $_PUT['id']))
        {
            $retraitDAO = new Retraits();
            $retrait = array($_PUT['profil_id'], $_PUT['montant'], $_PUT['id']);
            $res = $retraitDAO->put($retrait);
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