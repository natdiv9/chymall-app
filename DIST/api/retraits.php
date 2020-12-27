<?php
include 'dao/retraits.class.php';
include_once 'functions/htmlspecialchars.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $retraitsDAO = new Retraits();
        if(isset($_GET['auteur_operation'], $_GET['recherche']))
        {

            $recherche = $_GET['recherche'];
            $res = $retraitsDAO->rechercherRetraits($recherche, $_GET['auteur_operation']);
            response($res);
            return;

        }

        if(isset($_GET['date']) && $_GET['date'] != 'today')
        {
            $res = $retraitsDAO->getByDate($_GET['date']);
            response($res);
            return;
        } else if($_GET['date'] == 'today')
        {
            $res = $retraitsDAO->getByDate(date('Y-m-d'));
            response($res);
            return;
        }

        if(isset($_GET['auteur_operation'], $_GET['activated']))
        {

            if(!empty($_GET['is_by_client']) && $_GET['is_by_client'] != 'false')
            {
                $res = $retraitsDAO->get(true, $_GET['auteur_operation'], $_GET['is_by_client']);
                response($res);
                return;
            }
            if($_GET['activated'] == 'true')
            {
                $res = $retraitsDAO->get(true, $_GET['auteur_operation']);
                response($res);
                return;
            } else {
                $res = $retraitsDAO->get(false, $_GET['auteur_operation']);
                response($res);
                return;
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
        if(isset($_POST['id_profile'], $_POST['montant'], $_POST['nom'], $_POST['prenom'], $_POST['frais_retrait'], $_POST['montant_remis'], $_POST['operateur_transfert'], $_POST['auteur_operation']))
        {
            $retraitDAO = new Retraits();
            $retrait = array($_POST['id_profile'], $_POST['montant'], $_POST['nom'], $_POST['prenom'], $_POST['frais_retrait'], $_POST['montant_remis'], $_POST['operateur_transfert']);
            $data = array_to_hsc($retrait);
            $res = $retraitDAO->post($data, htmlspecialchars($_POST['auteur_operation']));
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
        if(isset($_PUT['id_profile'], $_PUT['montant'], $_PUT['id'], $_PUT['etat'], $_PUT['operateur_transfert'], $_PUT['operateur_validation'], $_PUT['auteur_operation']))
        {
            $retraitDAO = new Retraits();
            $retrait = array($_PUT['id_profile'], $_PUT['montant'], $_PUT['etat'], $_PUT['operateur_transfert'], $_PUT['operateur_validation'],  $_PUT['id']);
            $data = array_to_hsc($retrait);
            $res = $retraitDAO->put($data, htmlspecialchars($_PUT['auteur_operation']));
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