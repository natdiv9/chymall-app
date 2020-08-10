<?php
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
                    "message" => $e->getMessage()
                ),
                JSON_PRETTY_PRINT
                );
            die();
        }
    }
}
