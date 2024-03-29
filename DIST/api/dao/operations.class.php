<?php

include 'operationTracer.class.php';

class Operations
{
    private $connexion;
    private $table_name = 'chy_operation_tracer';

    public function __construct()
    {
        try{
            require 'connexion.class.php';
            session_start();
            $db_name = $_SESSION['connected_user']['database'];
            $this->connexion = Connexion::getConnexion($db_name);

        } catch (Exception | Error $e)
        {
            header('Content-Type: application/json; charset=utf-8');
            die(json_encode(array("status" => false, "message" => "Le serveur a rencontré un problème")));
        }
    }

    public function get($id = false)
    {
        try
        {
            $stmt = ($id)
                ? $this->connexion->prepare("SELECT id, operation, DATE_FORMAT(chy_operation_tracer.date, '%d-%m-%Y %H:%i:%s') as 'date', auteur_operation, 'table' FROM chy_operation_tracer WHERE id=$id ORDER BY 'id' DESC LIMIT 1")
                : $stmt = $this->connexion->prepare("SELECT * FROM `chy_operation_tracer` ORDER BY `chy_operation_tracer`.`date` DESC ");

            $res = $stmt->execute();

            if($res) {
                // OperationTracer::post([$auteur_operation, 'LECTURE', $this->table_name], $this->connexion);
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
            }else{
                // DEVELOPMENT
                // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE', $this->table_name], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);

                // PRODUCTION
                // return array(false, "message" => "The server encountered a problem");
            }
        }catch (Exception | Error $e)
        {
            // DEVELOPMENT
            // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());

            // PRODUCTION
            // return array(false, "message" => "The server encountered a problem");
        }
    }
}
