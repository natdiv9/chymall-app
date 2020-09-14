<?php

include 'dao/retrait_produits.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $retraitDAO = new RetraitProduits();
        if(isset($_GET['auteur_operation']))
        {
            if(!empty($_GET['id']))
            {
                // Un client
                $id = intval($_GET['id']);
                $res = $retraitDAO->get($id, $_GET['auteur_operation']);
                response($res);
            } else {
                // Tous les clients
                $res = $retraitDAO->get(false, $_GET['auteur_operation']);
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
        if(isset($_POST['quantite'], $_POST['id_profile'], $_POST['id_produit'], $_POST['auteur_operation']))
        {
            $retraitDAO = new RetraitProduits();
            $retrait = array($_POST['quantite'], $_POST['id_profile'], $_POST['id_produit'], $_POST['auteur_operation']);
            $res = $retraitDAO->post($retrait, $_POST['auteur_operation']);
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
