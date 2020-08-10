<?php
include 'dao/produits.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $produitDAO = new Produits();
        if(!empty($_GET['id']))
        {
            // Un produit
            $id = intval($_GET['id']);
            $res = $produitDAO->get($id);
            response($res);
        } else {
            // Tous les produits
            $res = $produitDAO->get();
            response($res);

        }
        break;
    case 'POST':
        $_POST = json_decode(file_get_contents('php://input'), true);
        if(isset($_POST['designation'], $_POST['stock_initial'], $_POST['stock_final']))
        {
            $produitDAO = new Produits();
            $produit = array($_POST['designation'], $_POST['stock_initial']);
            $res = $produitDAO->post($produit);
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
        if(isset($_PUT['designation'], $_PUT['stock_initial'], $_PUT['stock_final'], $_PUT['id']))
        {
            $produitDAO = new Produits();
            $produit = array($_PUT['designation'], $_PUT['stock_final'], $_PUT['stock_final'], $_PUT['id']);
            $res = $produitDAO->put($produit);
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