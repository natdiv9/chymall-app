<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Authorization, Content-Type, Accept");

class Connexion
{
    public function getConnexion()
    {
        try {
            $host = 'mysql:host=127.0.0.1;dbname=chymall';
            $user = 'root';
            $pwd = '';
            $bdd = new PDO($host, $user, $pwd,
                array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
            return $bdd;

        } catch (PDOException $e) {
            header('Content-Type: application/json');
            echo json_encode(
                array(
                    "status" => false,
                    "message" => $e->getMessage(),
                    "code" => 0
                ),
                JSON_PRETTY_PRINT
                );
            die();
        }
    }
}
