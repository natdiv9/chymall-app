<?php


class RetraitProduits
{
    private  $connexion;
    private $table_name = 'chy_retrait_produits';

    public function __construct()
    {
        try{
            require 'connexion.class.php';
            $this->connexion = Connexion::getConnexion();

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
                ? $this->connexion->prepare("SELECT * FROM chy_retrait_produits WHERE id=$id LIMIT 1")
                : $stmt = $this->connexion->prepare("SELECT * FROM chy_retrait_produits");

            $res = $stmt->execute();

            if($res) {
                OperationTracer::post([$auteur_operation, 'LECTURE', $this->table_name], $this->connexion);
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
            }else{
                // DEVELOPMENT
                OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE', $this->table_name], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);

                // PRODUCTION
                // return array(false, "message" => "The server encountered a problem");
            }
        }catch (Exception | Error $e)
        {
            // DEVELOPMENT
            OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());

            // PRODUCTION
            // return array(false, "message" => "The server encountered a problem");
        }
    }

    public function post($retrait_produits, $auteur_operation)
    {
        try
        {
            $stmt = $this->connexion->prepare(
                "INSERT INTO chy_retrait_produits(id_profile, id_produit, quantite)"
                ."VALUES(?, ?, ?)");
            $res = $stmt->execute(
                $retrait_produits
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

    public function put($retrait, $auteur_operation)
    {

    }
}