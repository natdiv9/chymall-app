<?php

include 'dao/resume.class.php';
$request_method = $_SERVER["REQUEST_METHOD"];


switch ($request_method)
{
    case 'GET':
        $resumeDAO = new Resume();
        if(true || isset($_GET['auteur_operation']))
        {
            if(!empty($_GET['id']))
            {
                // Un client
                $id = intval($_GET['id']);
                $res = $resumeDAO->getDay($_GET['auteur_operation']);
                response($res);
            } else {
                // Tous les clients
                $res = $resumeDAO->getDay($_GET['auteur_operation']);
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
