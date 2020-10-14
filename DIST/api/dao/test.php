<?php
include_once 'connexion.class.php';
$connexion = Connexion::getConnexion();

$current_date = date('ymd');
$name = CM; //strtoupper($client[2][0].$client[3][0]);
$st_last = $connexion->prepare("SELECT identifiant FROM `chy_clients` WHERE DATE(date)=CURDATE() ORDER BY id DESC LIMIT 1");
$re_last = $st_last->execute();

if($re_last) {
    $data = $st_last->fetchAll(PDO::FETCH_ASSOC);
    $is_first = (sizeof($data) > 0) ? false : true;

    if ($is_first) {
        $new_identifiant = $current_date . $name . '1';
        var_dump($new_identifiant);
        die("IS FIRST");
    } else {
        $data = $data[0];
        $identifiant = $data["identifiant"];
        $num = substr($identifiant, 8);
        $new_num = $num + 1;
        $new_identifiant = $current_date . $name . $new_num;
        var_dump($new_identifiant);
        die("<br> IS NOT FIRST");
    }
    $client[] = $new_identifiant;
    die("<br>-------->Before insert");
    $stmt = $connexion->prepare(
        "INSERT INTO chy_clients(telephone, email, prenom, nom, adresse, ville, pays, nom_beneficiaire, prenom_beneficiaire, identifiant_sponsor, identifiant)"
        . "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $res = $stmt->execute(
        $client
    );
}