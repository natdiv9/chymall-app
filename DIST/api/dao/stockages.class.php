<?php

include 'operationTracer.class.php';

class Stockages
{
    private  $connexion;
    private $table_name = 'chy_stockages';

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

    public function get($id = false, $auteur_operation)
    {
        try
        {
            $stmt = ($id)
                ? $this->connexion->prepare("SELECT * FROM chy_stockages WHERE id=$id LIMIT 1")
                : $stmt = $this->connexion->prepare("SELECT chy_stockages.quantite, DATE_FORMAT(chy_stockages.date, '%d-%m-%Y %H:%i:%s') as date, chy_produits.designation, chy_stockages.operateur FROM chy_stockages, chy_produits WHERE chy_stockages.id_produit=chy_produits.id GROUP BY chy_stockages.id DESC ");

            $res = $stmt->execute();

            if($res) {
                // OperationTracer::post([$auteur_operation, 'LECTURE'], $this->connexion);
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
            }else{
                // DEVELOPMENT
                // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE'], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);

                // PRODUCTION
                // return array(false, "message" => "The server encountered a problem");
            }
        }catch (Exception | Error $e)
        {
            // DEVELOPMENT
            // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE'], $this->connexion);
            return array(false, "message" => $e->getMessage());

            // PRODUCTION
            // return array(false, "message" => "The server encountered a problem");
        }
    }

    public function post($stockage, $auteur_operation)
    {
        try
        {
            $stmt = $this->connexion->prepare(
                "INSERT INTO chy_stockages(id_produit, quantite, operateur)"
                ."VALUES(?, ?, ?)");
            $res = $stmt->execute(
                $stockage
            );

            if($res)
            {
                OperationTracer::post([$auteur_operation, 'ECRITURE', $this->table_name], $this->connexion);
                return array(true, []);
            } else
            {
                OperationTracer::post([$auteur_operation, 'TENTATIVE D\'ECRITURE', $this->table_name], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);
            }
        } catch (Error | Exception $e)
        {
            OperationTracer::post([$auteur_operation, 'TENTATIVE D\'ECRITURE', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());
        }
    }

    public function put($stockage, $auteur_operation)
    {
        try
        {
            $stmt = $this->connexion->prepare(
                "UPDATE chy_stockages SET produit_id=?, quantite=?, entree_sortie=?, operateur=? WHERE id=?");
            $res = $stmt->execute(
                $stockage
            );

            if($res)
            {
                OperationTracer::post([$auteur_operation, 'MISE A JOUR', $this->table_name], $this->connexion);
                return array(true, []);
            } else
            {
                OperationTracer::post([$auteur_operation, 'TENTATIVE DE MISE A JOUR', $this->table_name], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);
            }
        } catch (Error | Exception $e)
        {
            OperationTracer::post([$auteur_operation, 'TENTATIVE DE MISE A JOUR', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());
        }
    }
}
