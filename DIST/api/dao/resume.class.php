<?php

include 'operationTracer.class.php';

class Resume
{
    private $connexion;
    private $table_name = 'mixed';

    public function __construct()
    {
        try {
            require 'connexion.class.php';
            $this->connexion = Connexion::getConnexion();

        } catch (Exception | Error $e) {
            header('Content-Type: application/json; charset=utf-8');
            die(json_encode(array("status" => false, "message" => "Le serveur a rencontré un problème")));
        }
    }

    public function getDay($auteur_operation)
    {

        try {
            $stmt = $stmt = $this->connexion->prepare("SELECT
(SELECT COUNT(*) FROM chy_clients INNER JOIN chy_profiles ON chy_clients.id=chy_profiles.id_client WHERE DATE(chy_clients.date)=CURRENT_DATE AND chy_profiles.is_online_profile=0  ) as total_adhesion_today,
(SELECT COUNT(*) FROM chy_profiles WHERE DATE(chy_profiles.date_activation)=CURRENT_DATE ) as total_activation_today,
(SELECT COALESCE(SUM(chy_retraits.montant), 0) FROM chy_retraits WHERE chy_retraits.etat=1 AND DATE(chy_retraits.date)=CURRENT_DATE) as total_retrait_today,
(SELECT COALESCE(SUM(chy_retraits.montant), 0) FROM chy_retraits WHERE chy_retraits.etat=1 AND MONTH(chy_retraits.date)=MONTH(CURRENT_DATE)) as total_retrait_month,
(SELECT COUNT(*) FROM chy_profiles WHERE MONTH(chy_profiles.date_activation)=MONTH(CURRENT_DATE) )  as total_activation_month,
(SELECT COUNT(*) FROM chy_retrait_produits WHERE MONTH(chy_retrait_produits.date)=MONTH(CURRENT_DATE)) as tota_retrait_produit_month,
(SELECT COALESCE(SUM(chy_profiles.activation_compte), 0) FROM chy_profiles WHERE MONTH(chy_profiles.date)=MONTH(CURRENT_DATE) AND chy_profiles.etat_activation=1 AND is_online_profile=0) as total_activation_compte,
(SELECT COALESCE(SUM(chy_profiles.activation_trading), 0) FROM chy_profiles WHERE MONTH(chy_profiles.date)=MONTH(CURRENT_DATE) AND chy_profiles.etat_trading=1 AND is_online_profile=0) as total_activation_trading,
(SELECT COUNT(*) FROM chy_clients WHERE MONTH(chy_clients.date)=MONTH(CURRENT_DATE) ) as total_adhesion_month,
(SELECT COUNT(*) FROM chy_stockages WHERE MONTH(chy_stockages.date)=MONTH(CURRENT_DATE) ) as total_stockage_month,
(SELECT COALESCE(SUM(chy_retraits.montant), 0) FROM chy_retraits WHERE chy_retraits.etat=1) as total_retrait_all,
(SELECT COUNT(*) FROM chy_profiles )  as total_compte_all,
(SELECT COUNT(*) FROM chy_retrait_produits ) as tota_retrait_produit_all,
(SELECT COALESCE(SUM(chy_profiles.activation_compte), 0) FROM chy_profiles WHERE chy_profiles.etat_activation=1 AND is_online_profile=0) as total_capitaux_all_activation,
(SELECT COUNT(*) FROM chy_clients ) as total_adhesion_all,
(SELECT COUNT(*) FROM chy_stockages ) as total_stockage_all");

            $res = $stmt->execute();

            if ($res) {
                // OperationTracer::post([$auteur_operation, 'LECTURE RESUME', $this->table_name], $this->connexion);
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
            } else {
                // DEVELOPMENT
                // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE RESUME', $this->table_name], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);

                // PRODUCTION
                // return array(false, "message" => "The server encountered a problem");
            }
        } catch (Exception | Error $e) {
            // DEVELOPMENT
            // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE RESUME', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());
        }

    }

    public function getRapportProfile($auteur_operation, $date)
    {

        try {
            $stmt = $stmt = $this->connexion->prepare("SELECT
(SELECT COUNT(*) FROM chy_clients clients INNER JOIN chy_profiles profiles ON clients.id=profiles.id_client WHERE DATE(clients.date)='$date' AND profiles.is_online_profile=0) as total_adhesion,
(SELECT COUNT(*) FROM chy_profiles WHERE DATE(chy_profiles.date)='$date' AND is_online_profile=0) as total_compte,
(SELECT COUNT(*) FROM chy_profiles WHERE DATE(chy_profiles.date)='$date' AND etat_trading=1 AND is_online_profile=0)  as nombre_trading,
(SELECT COUNT(*) FROM chy_profiles WHERE DATE(chy_profiles.date)='$date' AND etat_activation=1 AND is_online_profile=0)  as nombre_activation,
(SELECT COALESCE(SUM(chy_profiles.activation_compte - chy_profiles.activation_compte / 11), 0) FROM chy_profiles WHERE DATE(chy_profiles.date)='$date' AND chy_profiles.etat_activation=1 AND is_online_profile=0) as total_activation_compte,
(SELECT COALESCE(SUM(chy_profiles.activation_trading - chy_profiles.activation_trading / 11), 0) FROM chy_profiles WHERE DATE(chy_profiles.date)='$date' AND chy_profiles.etat_trading=1 AND is_online_profile=0) as total_activation_trading,
(SELECT ROUND(COALESCE(SUM(chy_profiles.activation_trading / 11), 0), 0) FROM chy_profiles WHERE DATE(chy_profiles.date)='$date' AND chy_profiles.etat_trading=1 AND is_online_profile=0) as total_frais_trading,
(SELECT COALESCE(SUM(chy_profiles.activation_compte / 11), 0) FROM chy_profiles WHERE DATE(chy_profiles.date)='$date' AND chy_profiles.etat_trading=1 AND is_online_profile=0) as total_frais_activation");

            $res = $stmt->execute();

            if ($res) {
                // OperationTracer::post([$auteur_operation, 'LECTURE RESUME', $this->table_name], $this->connexion);
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
            } else {
                // DEVELOPMENT
                // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE RESUME', $this->table_name], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);

                // PRODUCTION
                // return array(false, "message" => "The server encountered a problem");
            }
        } catch (Exception | Error $e) {
            // DEVELOPMENT
            // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE RESUME', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());
        }

    }

    public function getRapportRetrait($auteur_operation, $date)
    {

        try {
            $stmt = $stmt = $this->connexion->prepare("SELECT
(SELECT COALESCE(SUM(chy_retraits.montant), 0) FROM chy_retraits WHERE chy_retraits.etat=1 AND DATE(chy_retraits.date)='$date') as total_retrait,
(SELECT COALESCE(SUM(chy_retraits.frais_retrait), 0) FROM chy_retraits WHERE chy_retraits.etat=1 AND DATE(chy_retraits.date)='$date') as total_frais_retrait,
(SELECT COALESCE(SUM(chy_retraits.montant_remis), 0) FROM chy_retraits WHERE chy_retraits.etat=1 AND DATE(chy_retraits.date)='$date') as total_montant_remis,
(SELECT COUNT(*) FROM chy_retraits WHERE chy_retraits.etat=1 AND DATE(chy_retraits.date)='$date') as nombre_retrait,
(SELECT COUNT(*) FROM chy_retraits WHERE chy_retraits.etat=0 AND DATE(chy_retraits.date)='$date') as demande_en_cours,
(SELECT COUNT(*) FROM chy_retraits WHERE chy_retraits.etat=2 AND DATE(chy_retraits.date)='$date') as demande_annulee
");

            $res = $stmt->execute();

            if ($res) {
                // OperationTracer::post([$auteur_operation, 'LECTURE RESUME', $this->table_name], $this->connexion);
                return array(true, $stmt->fetchAll(PDO::FETCH_ASSOC));
            } else {
                // DEVELOPMENT
                // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE RESUME', $this->table_name], $this->connexion);
                return array(false, "message" => $stmt->errorInfo()[2]);

                // PRODUCTION
                // return array(false, "message" => "The server encountered a problem");
            }
        } catch (Exception | Error $e) {
            // DEVELOPMENT
            // OperationTracer::post([$auteur_operation, 'TENTATIVE DE LECTURE RESUME', $this->table_name], $this->connexion);
            return array(false, "message" => $e->getMessage());
        }

    }

    public function getMonth()
    {

    }

    public function getAll()
    {

    }
}