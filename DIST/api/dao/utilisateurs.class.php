<?php

include 'operationTracer.class.php';

class Utilisateurs
{
    private  $connexion;

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
               ? $this->connexion->prepare("SELECT * FROM chy_utilisateurs WHERE id=$id LIMIT 1")
               : $stmt = $this->connexion->prepare("SELECT * FROM chy_utilisateurs");

           $res = $stmt->execute();

           if($res) {
               OperationTracer::post([$auteur_operation, 'LECTURE'], $this->connexion);
               return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
           }else{
               // DEVELOPMENT
               OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE'], $this->connexion);
               return array(false, "message" => $stmt->errorInfo()[2]);

               // PRODUCTION
               // return array(false, "message" => "The server encountered a problem");
           }
       }catch (Exception | Error $e)
       {
           // DEVELOPMENT
           OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE'], $this->connexion);
           return array(false, "message" => $e->getMessage());
       }
    }

    public function post($utilisateur, $auteur_operation)
    {
       try
       {
           $stmt = $this->connexion->prepare("INSERT INTO chy_utilisateurs(username, pwd, service, droits) VALUES(?, ?, ?, ?)");
           $res = $stmt->execute(
               $utilisateur
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

    public function put($utilisateur, $auteur_operation)
    {
        try
        {
            $stmt = $this->connexion->prepare("UPDATE chy_utilisateurs SET username=?, pwd=?, service=?, droits=?, etat=? WHERE id=?");
            $res = $stmt->execute(
                $utilisateur
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

    public function auth($utilisateur)
    {
        try
        {
            $stmt = $this->connexion->prepare("SELECT * FROM chy_utilisateurs WHERE username=? AND pwd=? LIMIT 1");

            $res = $stmt->execute($utilisateur);

            if($res) {
                $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
                $is_auth = (sizeof($data) > 0) ? true : false;
                if($is_auth) {
                    $data = $data[0];
                    $data["pwd"] = NULL;
                    return array(true, $data);
                }
                return array(false, "message" => "Echec Authentification");
            }else{
                return array(false, "message" => $stmt->errorInfo()[2]);
            }
        }catch (Exception $e)
        {
            return array(false, "message" => $e->getMessage());
        }
    }
}
