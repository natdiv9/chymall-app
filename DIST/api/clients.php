<?php

include 'dao/clients.class.php';
include_once 'functions/htmlspecialchars.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $clientsDAO = new Clients();
        if(isset($_GET['auteur_operation']))
        {
            // var_dump($_GET);
            // die();

            if(!empty($_GET['identifiant']))
            {
                $identifiant = $_GET['identifiant'];
                $res = $clientsDAO->getByIdentifiant($identifiant, htmlspecialchars($_GET['auteur_operation']));
                response($res);
                return;

            }
            if(!empty($_GET['recherche']))
            {

                $recherche = htmlspecialchars($_GET['recherche']);
                $res = $clientsDAO->rechercherClient($recherche, htmlspecialchars($_GET['auteur_operation']));
                response($res);
                return;

            }

            if(isset($_GET['page']))
            {
                // Un client
                $page = intval(htmlspecialchars($_GET['page']));
                $res = $clientsDAO->get(false, htmlspecialchars($_GET['auteur_operation']), $page);
                response($res);
                return;
            }

            if(isset($_GET['id']) && $_GET['id'] != 'undefined')
            {
                // Un client
                $id = intval(htmlspecialchars($_GET['id']));
                $res = $clientsDAO->get($id, htmlspecialchars($_GET['auteur_operation']));
                response($res);
            } else {
                // Tous les clients
                $res = $clientsDAO->get(false, htmlspecialchars($_GET['auteur_operation']));
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
        if(isset($_POST['telephone'], $_POST['prenom'], $_POST['nom'], $_POST['adresse'], $_POST['ville'], $_POST['pays'], $_POST['ajoute_par'], $_POST['auteur_operation']))
        {
            // TO IMPLEMENT htmlspecialchars($str, ENT_NOQUOTES, "UTF-8")
            $clientsDAO = new Clients();
            $client = array($_POST['telephone'], (isset($_POST['email'])? $_POST['email']: ''), ucfirst(strtolower($_POST['prenom'])), ucfirst(strtolower($_POST['nom'])), $_POST['adresse'], ucfirst(strtolower($_POST['ville'])), ucfirst(strtolower($_POST['pays'])),
                $_POST['nom_beneficiaire'], $_POST['prenom_beneficiaire'], $_POST['identifiant_sponsor'], $_POST['ajoute_par']);
            $data = array_to_hsc($client);
            $res = $clientsDAO->post($data, $_POST['auteur_operation']);
            response($res);
        } else
        {
            header('Content-Type: application/json');
            echo json_encode( array(
                    "status" => false,
                    "message" => "POST Client: Data is not complete"
                )
            );
        }
        break;
    case 'PUT':
        $_PUT = json_decode(file_get_contents('php://input'), true);
        if(isset($_PUT['id'], $_PUT['telephone'],$_PUT['email'], $_PUT['prenom'], $_PUT['nom'], $_PUT['adresse'], $_PUT['ville'], $_PUT['pays'], $_PUT['etat'], $_PUT['identifiant'], $_PUT['nom_beneficiaire'], $_PUT['prenom_beneficiaire'], $_PUT['identifiant_sponsor'], $_PUT['auteur_operation']))
        {
            $clientsDAO = new Clients();
            $client = array($_PUT['telephone'],$_PUT['email'], $_PUT['prenom'], $_PUT['nom'], $_PUT['adresse'], $_PUT['ville'], $_PUT['pays'], $_PUT['etat'], $_PUT['identifiant'], $_PUT['nom_beneficiaire'], $_PUT['prenom_beneficiaire'], $_PUT['identifiant_sponsor'], intval($_PUT['id']));
            $data = array_to_hsc($client);
            $res = $clientsDAO->put($data, $_PUT['auteur_operation']);
            response($res);
        } else
        {
            header('Content-Type: application/json');
            echo json_encode( array(
                    "status" => false,
                    "message" => "PUT Client: Data is not complete"
                )
            );
        }
        break;
    case 'DELETE':
        if (isset($_GET['auteur_operation'], $_GET['id'], $_GET['identifiant'])) {
            $clientsDAO = new Clients();
            $res = $clientsDAO->delete(htmlspecialchars($_GET['id']), htmlspecialchars($_GET['identifiant']), htmlspecialchars($_GET['auteur_operation']));
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

function response($res) {
    if($res[0]) {
        header('Content-Type: application/json; charset=utf-8');
        echo html_entity_decode(json_encode(
            array(
                "status" => true,
                "data" => $res[1]
            ),
            JSON_PRETTY_PRINT
        ));
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
