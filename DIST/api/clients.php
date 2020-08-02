<?php
include 'dao/clients.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $clientsDAO = new Clients();
        if(!empty($_GET['id']))
        {
            // Un client
            $id = intval($_GET['id']);
            $res = $clientsDAO->get($id);
            response($res);
        } else {
            // Tous les clients
            $res = $clientsDAO->get();
            response($res);

        }
        break;
    case 'POST':
        if(isset($_POST['telephone'], $_POST['prenom'], $_POST['nom'], $_POST['adresse'], $_POST['ville'], $_POST['pays'], $_POST['photo']))
        {
            $clientsDAO = new Clients();
            $client = array($_POST['telephone'], (isset($_POST['email'])? $_POST['email']: ''), $_POST['prenom'], $_POST['nom'], $_POST['adresse'], $_POST['ville'], $_POST['pays'], (isset($_POST['zip'])? $_POST['zip']: ''), $_POST['photo']);
            $res = $clientsDAO->post($client);
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
        $_PUT = array();
        parse_str(file_get_contents('php://input'), $_PUT);
        if(isset($_PUT['id'], $_PUT['telephone'],$_PUT['email'], $_PUT['prenom'], $_PUT['nom'], $_PUT['adresse'], $_PUT['ville'], $_PUT['pays'], $_PUT['photo'], $_PUT['zip'], $_PUT['etat']))
        {
            $clientsDAO = new Clients();
            $clients = array($_PUT['telephone'],$_PUT['email'], $_PUT['prenom'], $_PUT['nom'], $_PUT['adresse'], $_PUT['ville'], $_PUT['pays'], $_PUT['zip'], $_PUT['photo'], $_PUT['etat'], intval($_PUT['id']));
            $res = $clientsDAO->put($clients);
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