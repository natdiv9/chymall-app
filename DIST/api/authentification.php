<?php
include 'dao/utilisateurs.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        if(isset($_GET['logout']) && $_GET['logout'] == 'chylogout')
        {
            session_unset();
            //session_destroy();
            response(array(true, []));
            // return;
        }else
        {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode( array(
                    "status" => false,
                    "message" => "Data is not complete"
                )
            );
        }
        break;

    case 'POST':
        $_POST = json_decode(file_get_contents('php://input'), true);
        if(isset($_POST['username'], $_POST['pwd']))
        {
            $utilisateursDAO = new Utilisateurs();
            $username = htmlspecialchars($_POST['username']);
            $pwd = htmlspecialchars($_POST['pwd']);
            $utilisateur = array($username, $pwd);
            $res = $utilisateursDAO->auth($utilisateur);
            response($res);
        } else
        {
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode( array(
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