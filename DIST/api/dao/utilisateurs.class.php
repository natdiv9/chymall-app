<?php

include 'operationTracer.class.php';

class Utilisateurs
{
    private  $connexion;
    private $table_name = 'chy_utilisateurs';

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
           session_start();
           $type_user = $_SESSION['connected_user']['type_user'];
           $bureau = $_SESSION['connected_user']['bureau'];
           if($type_user == 'SUPADMIN')
           {
               $stmt = ($id)
                   ? $this->connexion->prepare("SELECT * FROM chy_utilisateurs WHERE id=$id LIMIT 1")
                   : $stmt = $this->connexion->prepare("SELECT *, DATE_FORMAT(date, '%d-%m-%Y %H:%i:%s') as dateformat FROM chy_utilisateurs");

           } else if($type_user == 'ADMIN')
           {
               $stmt = ($id)
                   ? $this->connexion->prepare("SELECT * FROM chy_utilisateurs WHERE id=$id LIMIT 1")
                   : $stmt = $this->connexion->prepare("SELECT *, DATE_FORMAT(date, '%d-%m-%Y %H:%i:%s') as dateformat FROM chy_utilisateurs WHERE  bureau='$bureau' AND type_user<>'SUPADMIN'");

           } else
           {
               return array(true, []);
           }

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
       }
    }

    public function post($utilisateur, $auteur_operation)
    {
       try
       {
           $st_doublon = $this->connexion->prepare("SELECT * FROM `chy_utilisateurs` WHERE username='$utilisateur[0]'");
           $re_doublon = $st_doublon->execute();

           if($re_doublon) {
               $data = $st_doublon->fetchAll(PDO::FETCH_ASSOC);
               $is_first = (sizeof($data) > 0) ? true : false;
               if(!$is_first) {
                   $stmt = $this->connexion->prepare("INSERT INTO chy_utilisateurs(username, pwd, service, type_user, nom, prenom, telephone, bureau, ajoute_par) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");
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
               } else {
                   return array(false, "message" => "DOUBLON");
               }

           }else {
               OperationTracer::post([$auteur_operation, 'TENTATIVE D\'ECRITURE', $this->table_name], $this->connexion);
               return array(false, "message" => $st_doublon->errorInfo()[2]);
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
            $stmt = $this->connexion->prepare("UPDATE chy_utilisateurs SET username=?, pwd=?, service=?, type_user=?, nom=?, prenom=?, telephone=?, bureau=?, etat=? WHERE id=?");
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
            $stmt = $this->connexion->prepare("SELECT * FROM chy_utilisateurs WHERE username=? LIMIT 1");

            $res = $stmt->execute([$utilisateur[0]]);

            if($res) {
                $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
                // $data = array_map('htmlentities', $data, array(), array());
                $is_auth = (sizeof($data) > 0) ? true : false;
                $data = $data[0];
                if($is_auth && password_verify($utilisateur[1], $data['pwd']))
                {
                    session_start();
                    $data["pwd"] = NULL;
                    $data['database'] = 'chymall_'.strtolower($data['bureau']);
                    $_SESSION['connected_user'] =$data;
                    OperationTracer::post([$data["username"], 'CONNEXION', $this->table_name], $this->connexion);
                    return array(true, $data);
                }
                return array(false, "message" => "Vos identifiants ne sont pas correctes");
            }else{
                return array(false, "message" => $stmt->errorInfo()[2]);
            }
        }catch (Exception $e)
        {
            return array(false, "message" => $e->getMessage());
        }
    }
}
