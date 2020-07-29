<?php


class Connexion

{
    public static function getConnexion()
    {
        try {
            $host = 'mysql:host=127.0.0.1;dbname=immoDB';
            $user = 'root';
            $pwd = '';
            $bdd = new PDO($host, $user, $pwd,
                array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));

        } catch (Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }

        return $bdd;

    }
}