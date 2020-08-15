<?php
include 'dao/stockages.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $stockageDAO = new Stockages();
        if(isset($_GET['auteur_operation']))
        {
            if(!empty($_GET['id']))
            {
                // Un stockage
                $id = intval($_GET['id']);
                $res = $stockageDAO->get($id, $_GET['auteur_operation']);
                response($res);
            } else {
                // Tous les stockages
                $res = $stockageDAO->get(false, $_GET['auteur_operation']);
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
        if(isset($_POST['produit_id'], $_POST['quantite'], $_POST['entree_sortie']))
        {
            $stockageDAO = new Stockages();
            $stockage = array($_POST['produit_id'], $_POST['quantite'], $_POST['entree_sortie']);
            $res = $stockageDAO->post($stockage);
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
        $_PUT = json_decode(file_get_contents('php://input'), true);;
        if(isset($_PUT['produit_id'], $_PUT['quantite'], $_PUT['entree_sortie'], $_PUT['id']))
        {
            $stockageDAO = new Stockages();
            $stockage = array($_PUT['produit_id'], $_PUT['quantite'], $_PUT['entree_sortie'], $_PUT['id']);
            $res = $stockageDAO->put($stockage);
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