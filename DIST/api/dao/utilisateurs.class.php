<?php

class Utilisateurs
{
    private  $connexion;

    public function __construct()
    {
        try{
            include'connexion.class.php';
            $this->connexion = Connexion::getConnexion();

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
               ? $this->connexion->prepare("SELECT * FROM chy_utilisateurs WHERE id=$id LIMIT 1")
               : $stmt = $this->connexion->prepare("SELECT * FROM chy_utilisateurs");

           $res = $stmt->execute();

           if($res) {
               return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
           }else{
               return array(false, "message" => $stmt->errorInfo()[2]);
           }
       }catch (Exception $e)
       {
           return array(false, "message" => $e->getMessage());
       }
    }

    public function post($utilisateur)
    {
       try
       {
           $stmt = $this->connexion->prepare("INSERT INTO chy_utilisateurs(username, pwd, service, droits) VALUES(?, ?, ?, ?)");
           $res = $stmt->execute(
               $utilisateur
           );

           if($res)
           {
               return array(true, []);
           } else
           {
               return array(false, "message" => $stmt->errorInfo()[2]);
           }
       } catch (Exception $e)
       {
           return array(false, "message" => $e->getMessage());
       }
    }

    public function put($utilisateur)
    {
        try
        {
            $stmt = $this->connexion->prepare("UPDATE chy_utilisateurs SET username=?, pwd=?, service=?, droits=?, etat=? WHERE id=?");
            $res = $stmt->execute(
                $utilisateur
            );

            if($res)
            {
                return array(true, []);
            } else
            {
                return array(false, "message" => $stmt->errorInfo()[2]);
            }
        } catch (Exception $e)
        {
            return array(false, "message" => $e->getMessage());
        }
    }
}