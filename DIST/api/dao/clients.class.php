<?php

include 'operationTracer.class.php';

class Clients
{
    private $connexion;
    private $table_name = 'chy_clients';

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
                ? $this->connexion->prepare("SELECT * FROM chy_clients WHERE id=$id LIMIT 1")
                : $stmt = $this->connexion->prepare("SELECT *, DATE_FORMAT(chy_clients.date, '%d-%m-%Y %H:%i:%s') as date_ajout FROM chy_clients WHERE chy_clients.etat=1 ORDER BY date DESC");

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

    public function getByIdentifiant($identifiant, $auteur_operation)

    {
        try
        {
            $stmt = $this->connexion->prepare("SELECT * FROM chy_clients WHERE identifiant='$identifiant' LIMIT 1");

            $res = $stmt->execute();

            if($res) {
                $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
                $is_exist = (sizeof($data) > 0) ? true : false;
                if($is_exist) {
                    $data = $data[0];
                    // OperationTracer::post([$auteur_operation, 'LECTURE', $this->table_name], $this->connexion);
                    return array(true, $data);
                }
                return array(false, "message" => "Aucun identifiant ne correspondant");
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

    public function rechercherClient($recherche, $auteur_operation)
    {
        try
        {
            $sql = "SELECT *, MATCH (identifiant, nom, prenom, telephone, email, identifiant_sponsor) AGAINST ('$recherche') as pertinence\n"

                . "FROM  chy_clients WHERE MATCH (identifiant, nom, prenom, telephone, email, identifiant_sponsor) AGAINST ('$recherche')\n"

                . "ORDER BY pertinence DESC";
            $stmt = $this->connexion->prepare($sql);

            $res = $stmt->execute();

            if($res) {
                // OperationTracer::post([$auteur_operation, 'LECTURE', $this->table_name], $this->connexion);
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC), "recherche" => true);
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

    public function post($client, $auteur_operation)
    {
        try
        {
            $current_date = date('ymd');
            $name = strtoupper($client[2][0].$client[3][0]);
            $st_last = $this->connexion->prepare("SELECT identifiant FROM `chy_clients` WHERE DATE(date)=CURDATE() ORDER BY id DESC LIMIT 1");
            $re_last = $st_last->execute();
            if($re_last) {
                $data = $st_last->fetchAll(PDO::FETCH_ASSOC);
                $is_first = (sizeof($data) > 0) ? true : false;
                if(!$is_first) {
                    $new_identifiant = $current_date.$name.'1';
                } else {
                    $data = $data[0];
                    $identifiant = $data["identifiant"];
                    $num = substr($identifiant, 8);
                    $new_num = $num + 1;
                    $new_identifiant = $current_date.$name.$new_num;
                }
                $client[] = $new_identifiant;
                $stmt = $this->connexion->prepare(
                    "INSERT INTO chy_clients(telephone, email, prenom, nom, adresse, ville, pays, nom_beneficiaire, prenom_beneficiaire, identifiant_sponsor, ajoute_par, identifiant)"
                    ."VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                $res = $stmt->execute(
                    $client
                );

                if($res)
                {
                    $mon_id = $this->connexion->lastInsertId();
                    OperationTracer::post([$auteur_operation, 'ECRITURE', $this->table_name], $this->connexion);
                    return array(true, ["identifiant" => $new_identifiant, "id" => $mon_id]);
                } else
                {
                    OperationTracer::post([$auteur_operation, 'TENTATIVE D\'ECRITURE', $this->table_name], $this->connexion);
                    return array(false, "message" => $stmt->errorInfo()[2]);
                }
            }else {
                OperationTracer::post([$auteur_operation, 'TENTATIVE D\'ECRITURE', $this->table_name], $this->connexion);
                return array(false, "message" => $st_last->errorInfo()[2]);
            }
        } catch (Error | Exception $e)
        {
            OperationTracer::post([$auteur_operation, 'TENTATIVE D\'ECRITURE', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());
        }
    }

    public function put($client, $auteur_operation)
    {
        try
        {
            $stmt = $this->connexion->prepare(
                "UPDATE chy_clients SET telephone=?, email=?, prenom=?, nom=?, adresse=?, ville=?, pays=?, etat=?, identifiant=?, nom_beneficiaire=?, prenom_beneficiaire=?, identifiant_sponsor=? WHERE id=?");
            $res = $stmt->execute(
                $client
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

    public function delete($id, $identifiant, $auteur_operation)
    {
        try
        {

            $stmt = $this->connexion->prepare("DELETE FROM chy_clients WHERE chy_clients.id='$id' AND chy_clients.identifiant='$identifiant'");

            $res = $stmt->execute();

            if($res) {
                OperationTracer::post([$auteur_operation, 'SUPPRESSION', $this->table_name], $this->connexion);

                $stmt = $this->connexion->prepare("DELETE FROM chy_profiles WHERE chy_profiles.id_client='$id'");
                $res = $stmt->execute();

                if($res) {
                    OperationTracer::post([$auteur_operation, 'SUPPRESSION', 'chy_profiles'], $this->connexion);

                    return array(true, []);
                }else{
                    // DEVELOPMENT
                    OperationTracer::post([$auteur_operation, 'TENTATIVE DE SUPPRESSION', 'chy_profiles'], $this->connexion);
                    return array(false, "message" => $stmt->errorInfo()[2]);

                    // PRODUCTION
                    // return array(false, "message" => "The server encountered a problem");
                }
                return array(true, []);
            }else{
                // DEVELOPMENT
                OperationTracer::post([$auteur_operation, 'TENTATIVE DE SUPPRESSION', $this->table_name], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);

                // PRODUCTION
                // return array(false, "message" => "The server encountered a problem");
            }
        }catch (Exception | Error $e)
        {
            // DEVELOPMENT
            OperationTracer::post([$auteur_operation, 'TENTATIVE DE SUPPRESSION', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());

            // PRODUCTION
            // return array(false, "message" => "The server encountered a problem");
        }
    }
}
