<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Authorization, Content-Type, Accept");

class Connexion
{
    public static function getConnexion($db_name = 'chymall')
    {
        try {
            $host = "mysql:host=vt60918-001.privatesql;port=35851;dbname=$db_name";
            // $host = "mysql:host=localhost;dbname=$db_name";
            $user = 'chryadmin'; //root
            $pwd = 'LInuxDEbian09';
            $bdd = new PDO($host, $user, $pwd,
                array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
            // $bdd->exec("SET NAMES utf8");
            return $bdd;

        } catch (PDOException $e) {
            header('Content-Type: application/json');
            echo json_encode(
                array(
                    "status" => false,
                    "message" => "Une erreur inatendue est survenue, veuillez contactez votre administrateur",
                    "code" => 0,
                    "type" => "WARNING"
                ),
                JSON_PRETTY_PRINT
                );
            die();
        }
    }
}
