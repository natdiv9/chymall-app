<?php
include 'dao/produits.class.php';
include_once 'functions/htmlspecialchars.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $produitDAO = new Produits();
        if(isset($_GET['auteur_operation']))
        {
            if(!empty($_GET['id']))
            {
                // Un produit
                $id = intval(htmlspecialchars($_GET['id']));
                $res = $produitDAO->get($id, htmlspecialchars($_GET['auteur_operation']));
                response($res);
            } else {
                // Tous les produits
                $res = $produitDAO->get(false, $_GET['auteur_operation']);
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
        if(isset($_POST['designation'], $_POST['stock_initial'], $_POST['stock_final'], $_POST['pacts'], $_POST['auteur_operation']))
        {
            $produitDAO = new Produits();
            $produit = array($_POST['designation'], $_POST['stock_initial'], $_POST['stock_final'], $_POST['pacts']);
            $data = array_to_hsc($produit);
            $res = $produitDAO->post($data, htmlspecialchars($_POST['auteur_operation']));
            response($res);
        } else
        {
            header('Content-Type: application/json');
            echo json_encode( array(
                    "status" => false,
                    "message" => "POST produit: Data is not complete"
                )
            );
        }
        break;
    case 'PUT':
        $_PUT = json_decode(file_get_contents('php://input'), true);
        if(isset($_PUT['designation'], $_PUT['stock_initial'], $_PUT['stock_final'], $_PUT['id'], $_PUT['auteur_operation']))
        {
            $produitDAO = new Produits();
            $produit = array($_PUT['designation'], $_PUT['stock_initial'], $_PUT['stock_final'], $_PUT['id']);
            $data = array_to_hsc($produit);
            $res = $produitDAO->put($data, htmlspecialchars($_PUT['auteur_operation']));
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
