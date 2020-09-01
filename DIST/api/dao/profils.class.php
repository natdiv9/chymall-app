<?php

include 'operationTracer.class.php';

class Profils
{
    private  $connexion;
    private $table_name = 'chy_profiles';

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
                ? $this->connexion->prepare("SELECT * FROM chy_profiles WHERE id='$id'  LIMIT 1")
                : $this->connexion->prepare("SELECT profiles.*, clients.identifiant, clients.nom, clients.prenom FROM chy_clients clients INNER JOIN chy_profiles profiles ON clients.id=profiles.id_client ORDER  BY id DESC");

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

    public function getByClient($id = false, $auteur_operation)
    {
        try
        {
            $stmt = ($id)
                ? $this->connexion->prepare("SELECT * FROM chy_profiles WHERE id_client=$id")
                : $stmt = $this->connexion->prepare("SELECT * FROM chy_profiles");

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

    public function getIncompletProfiles($incomplete, $auteur_operation, $is_by_client = false, $id_client = 0)
    {
        try
        {
            if ($is_by_client && $id_client != 0){
                $stmt = $this->connexion->prepare("SELECT profiles.*, clients.identifiant, clients.nom, clients.prenom FROM chy_profiles profiles INNER JOIN chy_clients clients ON clients.id=profiles.id_client WHERE profiles.id_client='$id_client' AND profiles.username='_incomplet' AND profiles.etat=1");
            } else {
                $stmt = $this->connexion->prepare("SELECT profiles.*, clients.identifiant, clients.nom, clients.prenom FROM chy_profiles profiles INNER JOIN chy_clients clients ON clients.id=profiles.id_client WHERE profiles.username='_incomplet' AND profiles.etat=1");
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

    public function post($profil, $auteur_operation)
    {
        try
        {
            $password = $this->gen_password(8);
            $profil[] = $password;
            $stmt = $this->connexion->prepare(
                "INSERT INTO chy_profiles(id_client, username, niveau_adhesion, capital, produit_trading, produit_adhesion, activation_compte, activation_trading, etat_trading, etat_activation, password)"
                ."VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $res = $stmt->execute(
                $profil
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

    public function rechercherProfile($recherche, $auteur_operation, $incomplete = false)
    {
        try
        {
            if($incomplete)
            {
                $sql = "SELECT profils.*, clients.identifiant, clients.prenom, clients.nom
                    FROM chy_profiles profils INNER JOIN chy_clients clients ON profils.id_client=clients.id 
                    WHERE (MATCH (profils.username, profils.niveau_adhesion) AGAINST ('$recherche') 
                    OR MATCH (clients.prenom, clients.nom, clients.identifiant, clients.telephone, clients.email, identifiant_sponsor ) AGAINST ('$recherche')) 
                    AND (profils.username='_incomplet' AND profils.etat=1)";
            }
            else
            {
                $sql = "SELECT profils.*, clients.identifiant, clients.prenom, clients.nom
                    FROM chy_profiles profils INNER JOIN chy_clients clients ON profils.id_client=clients.id 
                    WHERE MATCH (profils.username, profils.niveau_adhesion) AGAINST ('$recherche') 
                    OR MATCH (clients.prenom, clients.nom, clients.identifiant, clients.telephone, clients.email, identifiant_sponsor ) AGAINST ('$recherche')";
            }
            $stmt = $this->connexion->prepare($sql);

            $res = $stmt->execute();

            if($res) {
                OperationTracer::post([$auteur_operation, 'LECTURE', $this->table_name], $this->connexion);
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC), "recherche" => true);
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

    public function put($profil, $auteur_operation, $activated = false)
    {
        try
        {
            if ($activated) {
                $stmt = $this->connexion->prepare(
                    "UPDATE chy_profiles SET date_activation=CURRENT_TIMESTAMP, id_client=?, username=?, niveau_adhesion=?, capital=?, produit_trading=?, produit_adhesion=?, activation_compte=?, activation_trading=?, solde=?, etat=?, etat_trading=?, etat_activation=?, password=?, etat_produit_adhesion=?  WHERE id=?");

            } else {
                $stmt = $this->connexion->prepare(
                    "UPDATE chy_profiles SET id_client=?, username=?, niveau_adhesion=?, capital=?, produit_trading=?, produit_adhesion=?, activation_compte=?, activation_trading=?, solde=?, etat=?, etat_trading=?, etat_activation=?, password=?, etat_produit_adhesion=?  WHERE id=?");

            }

            $res = $stmt->execute(
                $profil
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

    private function gen_password($car) {
        $string = "";
        $chaine = "9aAbBcC1dDeEfF2gGhHiI3jJkKlL4mMnNpP5qQrRsS6tTuUvV7wWxXyY8";
        srand((double)microtime()*1000000);
        for($i=0; $i<$car; $i++) {
            $string .= $chaine[rand()%strlen($chaine)];
        }
        return $string;
    }
}
