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
                ? $this->connexion->prepare("SELECT *, DATE_FORMAT(chy_profiles.date, '%d-%m-%Y %H:%i:%s') as date_ajout FROM chy_profiles WHERE id='$id' LIMIT 1")
                : $this->connexion->prepare("SELECT profiles.*, DATE_FORMAT(profiles.date, '%d-%m-%Y %H:%i:%s') as date_ajout, clients.identifiant, clients.nom, clients.prenom, clients.telephone FROM chy_clients clients INNER JOIN chy_profiles profiles ON clients.id=profiles.id_client ORDER  BY id DESC");

            $res = $stmt->execute();

            if($res) {
                // OperationTracer::post([$auteur_operation, 'LECTURE', $this->table_name], $this->connexion);
                $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
                return array(true, $data);
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

    public function getByClient($id = false, $auteur_operation)
    {
        try
        {
            $stmt = ($id)
                ? $this->connexion->prepare("SELECT profiles.*, DATE_FORMAT(profiles.date, '%d-%m-%Y %H:%i:%s') as date_ajout, clients.identifiant, clients.nom, clients.prenom, clients.telephone FROM chy_clients clients INNER JOIN chy_profiles profiles ON clients.id=profiles.id_client WHERE id_client=$id ORDER BY profiles.id DESC")
                : $stmt = $this->connexion->prepare("SELECT profiles.*, DATE_FORMAT(profiles.date, '%d-%m-%Y %H:%i:%s') as date_ajout, clients.identifiant, clients.nom, clients.prenom, clients.telephone FROM chy_clients clients INNER JOIN chy_profiles profiles ON clients.id=profiles.id_client ORDER BY profiles.id DESC");

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

    public function getIncompletProfiles($incomplete, $auteur_operation, $is_by_client = false, $id_client = 0)
    {
        try
        {
            if ($is_by_client && $id_client != 0){
                $stmt = $this->connexion->prepare("SELECT profiles.*, DATE_FORMAT(profiles.date, '%d-%m-%Y %H:%i:%s') as date_ajout, clients.identifiant, clients.nom, clients.prenom, clients.telephone FROM chy_profiles profiles INNER JOIN chy_clients clients ON clients.id=profiles.id_client WHERE profiles.id_client='$id_client' AND profiles.username='_incomplet' AND profiles.etat=1");
            } else {
                $stmt = $this->connexion->prepare("SELECT profiles.*, DATE_FORMAT(profiles.date, '%d-%m-%Y %H:%i:%s') as date_ajout, clients.identifiant, clients.nom, clients.prenom, clients.telephone FROM chy_profiles profiles INNER JOIN chy_clients clients ON clients.id=profiles.id_client WHERE profiles.username='_incomplet' AND profiles.etat=1");
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
                "INSERT INTO chy_profiles(id_client, username, niveau_adhesion, capital, produit_trading, produit_adhesion, activation_compte, activation_trading, etat_trading, etat_activation, username_parain, password_parain, ajoute_par, password)"
                ."VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
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

    public function postOnlineProfile($profile, $auteur_operation)
    {
        try
        {
            $st_doublon = $this->connexion->prepare("SELECT * FROM `chy_profiles` WHERE username='$profile[3]'");
            $re_doublon = $st_doublon->execute();

            if($re_doublon) {
                $data = $st_doublon->fetchAll(PDO::FETCH_ASSOC);
                $is_first = (sizeof($data) > 0) ? true : false;
                if(!$is_first) {
                    $stmt = $this->connexion->prepare(
                        "INSERT INTO chy_profiles(is_online_profile, id_client, password, username, niveau_adhesion, capital, produit_trading, produit_adhesion, activation_compte, activation_trading, etat_trading, etat_activation, etat, etat_produit_adhesion, username_parain, ajoute_par)"
                        ."VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                    $res = $stmt->execute(
                        $profile
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

    public function rechercherProfile($recherche, $auteur_operation, $incomplete = false)
    {
        try
        {
            if($incomplete)
            {
                $sql = "SELECT profils.*, DATE_FORMAT(profils.date, '%d-%m-%Y %H:%i:%s') as date_ajout, profils.date as date_ajout, clients.identifiant, clients.prenom, clients.nom, clients.telephone
                    FROM chy_profiles profils INNER JOIN chy_clients clients ON profils.id_client=clients.id 
                    WHERE (MATCH (profils.username, profils.niveau_adhesion) AGAINST ('$recherche') 
                    OR MATCH (clients.prenom, clients.nom, clients.identifiant, clients.telephone, clients.email, identifiant_sponsor ) AGAINST ('$recherche')) 
                    AND (profils.username='_incomplet' AND profils.etat=1)";
            }
            else
            {
                $sql = "SELECT profils.*, DATE_FORMAT(profils.date, '%d-%m-%Y %H:%i:%s') as date_ajout, clients.identifiant, clients.prenom, clients.nom, clients.telephone
                    FROM chy_profiles profils INNER JOIN chy_clients clients ON profils.id_client=clients.id 
                    WHERE MATCH (profils.username, profils.niveau_adhesion) AGAINST ('$recherche') 
                    OR MATCH (clients.prenom, clients.nom, clients.identifiant, clients.telephone, clients.email, identifiant_sponsor ) AGAINST ('$recherche')";
            }
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

    public function put($profil, $auteur_operation, $activated = false)
    {
        try
        {
            if ($activated) {
                $st_doublon = $this->connexion->prepare("SELECT * FROM `chy_profiles` WHERE username='$profil[1]'");
                $re_doublon = $st_doublon->execute();

                if($re_doublon) {
                    $data = $st_doublon->fetchAll(PDO::FETCH_ASSOC);
                    $is_first = (sizeof($data) > 0) ? true : false;
                    if(!$is_first) {

                        $stmt = $this->connexion->prepare(
                            "UPDATE chy_profiles SET date_activation=CURRENT_TIMESTAMP, id_client=?, username=?, niveau_adhesion=?, capital=?, produit_trading=?, produit_adhesion=?, activation_compte=?, activation_trading=?, solde=?, etat=?, etat_trading=?, etat_activation=?, password=?, etat_produit_adhesion=?, username_parain=?, password_parain=?  WHERE id=?");

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
                    } else {
                        return array(false, "message" => "DOUBLON");
                    }

                }else {
                    OperationTracer::post([$auteur_operation, 'TENTATIVE D\'ECRITURE', $this->table_name], $this->connexion);
                    return array(false, "message" => $st_doublon->errorInfo()[2]);
                }

            }
            else {
                $st_doublon = $this->connexion->prepare("SELECT * FROM `chy_profiles` WHERE username='$profil[1]'");
                $re_doublon = $st_doublon->execute();
                if($re_doublon) {
                    $data = $st_doublon->fetchAll(PDO::FETCH_ASSOC);

                    if(sizeof($data) == 1 && $data[0]['id']==$profil[16]) {
                        $stmt = $this->connexion->prepare(
                            "UPDATE chy_profiles SET id_client=?, username=?, niveau_adhesion=?, capital=?, produit_trading=?, produit_adhesion=?, activation_compte=?, activation_trading=?, solde=?, etat=?, etat_trading=?, etat_activation=?, password=?, etat_produit_adhesion=? , username_parain=?, password_parain=? WHERE id=?");
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
                    } else if (sizeof($data) == 0) {
                        $stmt = $this->connexion->prepare(
                            "UPDATE chy_profiles SET id_client=?, username=?, niveau_adhesion=?, capital=?, produit_trading=?, produit_adhesion=?, activation_compte=?, activation_trading=?, solde=?, etat=?, etat_trading=?, etat_activation=?, password=?, etat_produit_adhesion=? , username_parain=?, password_parain=? WHERE id=?");
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
                    }
                    else {
                        return array(false, "message" => "DOUBLON");
                    }

                }else {
                    OperationTracer::post([$auteur_operation, 'TENTATIVE D\'ECRITURE', $this->table_name], $this->connexion);
                    return array(false, "message" => $st_doublon->errorInfo()[2]);
                }


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
    public function putActivation($profil, $auteur_operation)
    {
        try
        {
            $stmt = $this->connexion->prepare(
                "UPDATE chy_profiles SET id_client=?, username=?, niveau_adhesion=?, capital=?, produit_trading=?, produit_adhesion=?, activation_compte=?, activation_trading=?, solde=?, etat=?, etat_trading=?, etat_activation=?, password=?, etat_produit_adhesion=? , username_parain=?, password_parain=? WHERE id=?");
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
            OperationTracer::post([$auteur_operation, 'TENTATIVE DE MISE A JOUR', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());
        }
    }

    public function delete($id, $auteur_operation)
    {
        try
        {

            $stmt = $this->connexion->prepare("DELETE FROM chy_profiles WHERE chy_profiles.id='$id' ");

            $res = $stmt->execute();

            if($res) {
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
