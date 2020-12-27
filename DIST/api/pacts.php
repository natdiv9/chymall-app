<?php
include 'dao/pacts.class.php';
include_once 'functions/htmlspecialchars.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method) {
    case 'GET':
        $pactsDAO = new Pacts();
        if (isset($_GET['auteur_operation'])) {

            $res = $pactsDAO->get(htmlspecialchars($_GET['auteur_operation']));
            response($res);

        } else {
            header('Content-Type: application/json');
            echo json_encode(array(
                    "status" => false,
                    "message" => "Data is not complete"
                )
            );
        }
        break;
    case 'POST':
        $_POST = json_decode(file_get_contents('php://input'), true);
        if (isset($_POST['montant_compte'], $_POST['niveau'], $_POST['auteur_operation'])) {
            $pactsDAO = new Pacts();
            $pacts = array($_POST['montant_compte'], (isset($_POST['montant_trading']) ?  $_POST['montant_trading']: 0), $_POST['niveau']);
            $data = array_to_hsc($pacts);
            $res = $pactsDAO->post($data, htmlspecialchars(POST['auteur_operation']));
            response($res);
        } else {
            header('Content-Type: application/json');
            echo json_encode(array(
                    "status" => false,
                    "message" => "Data is not complete"
                )
            );
        }
        break;
    case 'PUT':
        $_PUT = json_decode(file_get_contents('php://input'), true);
        if (isset($_PUT['montant_compte'], $_PUT['montant_trading'], $_PUT['niveau'], $_PUT['auteur_operation'], $_PUT['id'])) {
            $pactsDAO = new Pacts();
            $pacts = array($_PUT['montant_compte'], $_PUT['montant_trading'], $_PUT['niveau'], $_PUT['id']);
            $data = array_to_hsc($pacts);
            $res = $pactsDAO->put($data, htmlspecialchars($_PUT['auteur_operation']));
            response($res);
        } else {
            header('Content-Type: application/json');
            echo json_encode(array(
                    "status" => false,
                    "message" => "Data is not complete"
                )
            );
        }
        break;
    case 'DELETE':
        $pactsDAO = new Pacts();
        if (isset($_GET['auteur_operation'], $_GET['id'])) {

            $res = $pactsDAO->delete(htmlspecialchars($_GET['id']), htmlspecialchars($_GET['auteur_operation']));
            response($res);

        } else {
            header('Content-Type: application/json');
            echo json_encode(array(
                    "status" => false,
                    "message" => "Data is not complete"
                )
            );
        }
        break;
    default:
        http_response_code(405);
        break;
}


// REPONSE

function response($res)
{
    if ($res[0]) {
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