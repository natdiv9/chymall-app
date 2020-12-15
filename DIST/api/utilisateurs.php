<?php
    include 'dao/utilisateurs.class.php';
    $request_method = $_SERVER["REQUEST_METHOD"];


    switch ($request_method)
    {
        case 'GET':
            $utilisateursDAO = new Utilisateurs();

            if(isset($_GET['logout']) && $_GET['logout'] == 'chylogout')
            {
                session_destroy();
                response(array(true, []));
                // return;
            }

            if(isset($_GET['auteur_operation']))
            {
                if(!empty($_GET['id']) && intval($_GET['id'] > 0))
                {
                    // Un utilsateur
                    $id = intval($_GET['id']);
                    $res = $utilisateursDAO->get($id, $_GET['auteur_operation']);
                    response($res);
                } else {
                    // Tous les utilisateurs
                    $res = $utilisateursDAO->get(false, $_GET['auteur_operation']);
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
            if(isset($_POST['username'], $_POST['pwd'], $_POST['service'], $_POST['type_user'], $_POST['nom'], $_POST['prenom'], $_POST['telephone'], $_POST['bureau'], $_POST['auteur_operation']))
            {
                $utilisateursDAO = new Utilisateurs();
                $utilisateur = array($_POST['username'], $_POST['pwd'], $_POST['service'], $_POST['type_user'], $_POST['nom'], $_POST['prenom'], $_POST['telephone'], $_POST['bureau'], $_POST['auteur_operation']);
                $res = $utilisateursDAO->post($utilisateur, $_POST['auteur_operation']);
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
        case 'PUT':
            $_PUT = json_decode(file_get_contents('php://input'), true);
            if(isset($_PUT['username'], $_PUT['pwd'], $_PUT['service'], $_PUT['type_user'], $_PUT['nom'], $_PUT['prenom'], $_PUT['telephone'], $_PUT['bureau'], $_PUT['auteur_operation']))
            {
                $utilisateursDAO = new Utilisateurs();
                $utilisateur = array($_PUT['username'], $_PUT['pwd'], $_PUT['service'], $_PUT['type_user'], $_PUT['nom'], $_PUT['prenom'], $_PUT['telephone'], $_PUT['bureau'], $_PUT['etat'], $_PUT['id'], $_PUT['auteur_operation']);
                $res = $utilisateursDAO->put($utilisateur, $_PUT['auteur_operation']);
                response($res);
            } else
            {
                header('Content-Type: application/json; charset=utf-8');
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