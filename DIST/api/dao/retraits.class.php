<?php

include 'operationTracer.class.php';

class Retraits
{
    private  $connexion;
    private $table_name = 'chy_retraits';

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

    public function get($id = false, $auteur_operation, $is_by_client = false)
    {
        try
        {
            if($is_by_client)
            {
                $sql = "SELECT retraits.id, retraits.montant, DATE_FORMAT(retraits.date, '%d-%m-%Y %H:%i:%s') as date, retraits.id_profile, retraits.etat, profiles.username, profiles.niveau_adhesion, clients.identifiant, clients.nom, clients.prenom FROM chy_retraits retraits INNER JOIN chy_profiles profiles ON retraits.id_profile=profiles.id INNER JOIN chy_clients clients ON clients.id=profiles.id_client WHERE retraits.etat=0 AND clients.id=$is_by_client ORDER BY retraits.date DESC";
                $stmt = $this->connexion->prepare($sql);
            } else {
                $stmt = ($id)
                    ? $this->connexion->prepare("SELECT retraits.id, retraits.montant, DATE_FORMAT(retraits.date, '%d-%m-%Y %H:%i:%s') as date, retraits.id_profile, retraits.etat, profiles.username, profiles.niveau_adhesion, clients.identifiant, clients.nom, clients.prenom FROM chy_retraits retraits INNER JOIN chy_profiles profiles ON retraits.id_profile=profiles.id INNER JOIN chy_clients clients ON clients.id=profiles.id_client WHERE retraits.etat=0 ORDER BY retraits.date DESC")
                    : $stmt = $this->connexion->prepare("SELECT retraits.id, retraits.montant, DATE_FORMAT(retraits.date, '%d-%m-%Y %H:%i:%s') as date, retraits.id_profile, retraits.etat, profiles.username, profiles.niveau_adhesion, clients.identifiant, clients.nom, clients.prenom FROM chy_retraits retraits INNER JOIN chy_profiles profiles ON retraits.id_profile=profiles.id INNER JOIN chy_clients clients ON clients.id=profiles.id_client ORDER BY retraits.date DESC");

            }

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

    public function rechercherRetraits($recherche, $auteur_operation)
    {
        try
        {
            $sql = "SELECT retraits.id, retraits.montant, DATE_FORMAT(retraits.date, '%d-%m-%Y %H:%i:%s') as date, retraits.id_profile, retraits.etat, profiles.username, profiles.niveau_adhesion, clients.identifiant, clients.nom, clients.prenom FROM chy_retraits retraits INNER JOIN chy_profiles profiles ON retraits.id_profile=profiles.id INNER JOIN chy_clients clients ON clients.id=profiles.id_client WHERE MATCH (profiles.username, profiles.niveau_adhesion) AGAINST ('$recherche') OR MATCH (clients.prenom, clients.nom, clients.identifiant, clients.telephone, clients.email, identifiant_sponsor ) AGAINST ('$recherche') ORDER BY retraits.date DESC ";
            $stmt = $this->connexion->prepare($sql);

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

    public function post($retrait, $auteur_operation)
    {
        try
        {
            $code = $this->gen_code(6);
            $stmt = $this->connexion->prepare(
                "INSERT INTO chy_retraits(id_profile, montant)"
                ."VALUES(?, ?)");
            $res = $stmt->execute(
                $retrait
            );

            if($res)
            {
                OperationTracer::post([$auteur_operation, 'ECRITURE', $this->table_name], $this->connexion);
                return array(true, ["code" => $code]);
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
        try
        {
            $stmt = $this->connexion->prepare(
                "UPDATE chy_retraits SET id_profile=?, montant=?, etat=? WHERE id=?");
            $res = $stmt->execute(
                $retrait
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

    private function gen_code($car) {
        $string = "";
        $chaine = "9aAbBcC1dDeEfF2gGhHiI3jJkKlL4mMnNpP5qQrRsS6tTuUvV7wWxXyY8";
        srand((double)microtime()*1000000);
        for($i=0; $i<$car; $i++) {
            $string .= $chaine[rand()%strlen($chaine)];
        }
        return $string;
    }
}
