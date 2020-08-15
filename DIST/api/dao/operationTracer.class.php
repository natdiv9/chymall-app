<?php

class OperationTracer
{
    private  $connexion;

    public function __construct()
    {
        /*try{
            require 'connexion.class.php';
            $this->connexion = Connexion::getConnexion();

        } catch (Exception | Error $e)
        {
            header('Content-Type: application/json; charset=utf-8');
            die(json_encode(array("status" => false, "message" => "Le serveur a rencontré un problème")));
        }*/
    }

    public static function get($id = false, $connexion)
    {
        try
        {
            $stmt = ($id)
                ? $connexion->prepare("SELECT * FROM chy_operation_tracer WHERE id=$id LIMIT 1")
                : $stmt = $connexion->prepare("SELECT * FROM chy_operation_tracer");

            $res = $stmt->execute();

            if($res) {
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
            }else{
                // DEVELOPMENT
                return array(false, "message" => $stmt->errorInfo()[2]);

                // PRODUCTION
                // return array(false, "message" => "The server encountered a problem");
            }
        }catch (Exception | Error $e)
        {
            // DEVELOPMENT
            return array(false, "message" => $e->getMessage());

            // PRODUCTION
            // return array(false, "message" => "The server encountered a problem");
        }
    }

    public static function post($operation, $connexion)
    {
        try
        {
            $stmt = $connexion->prepare(
                "INSERT INTO chy_operation_tracer(auteur_operation, operation, table)"
                ."VALUES(?, ?, ?)");
            $res = $stmt->execute(
                $operation
            );

            if($res)
            {
                return array(true, []);
            } else
            {
                return array(false, "message" => $stmt->errorInfo()[2]);
            }
        } catch (Error | Exception $e)
        {
            return array(false, "message" => $e->getMessage());
        }
    }
}
