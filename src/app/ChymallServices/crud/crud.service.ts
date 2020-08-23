import {Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Client} from '../../ChymallModels/models/client';
import {Paiement} from '../../ChymallModels/models/paiement';
import {Produit} from '../../ChymallModels/models/produit';
import {Profile} from '../../ChymallModels/models/profile';
import {Retrait} from '../../ChymallModels/models/retrait';
import {Stockage} from '../../ChymallModels/models/stockage';
import {Utilisateur} from '../../ChymallModels/models/utilisateur';
import {RetraitProduits} from '../../ChymallModels/models/retrait-produits';

// Environment
import {environment} from '../../../environments/environment';

@Injectable({
    providedIn: 'root'
})
export class CrudService {

    currentUser: Utilisateur;

    constructor(private httpClient: HttpClient) {
    }

    uploadFile(file: File) {
        return new Promise(
            (resolve, reject) => {
                const almostUniqueFileName = Date.now().toString();
            }
        );
    }

    addClient(client: any) {
        return this.httpClient.post(`${environment.server_base_url}/clients.php`, client);
    }

    addPaiement(paiement: Paiement) {
        return this.httpClient.post(`${environment.server_base_url}/paiements.php`, paiement);
    }

    addProduit(produit: Produit) {
        return this.httpClient.post(`${environment.server_base_url}/produits.php`, produit);
    }

    addProfile(profile: Profile) {
        return this.httpClient.post(`${environment.server_base_url}/profiles.php`, profile);
    }

    addRetrait(retrait: Retrait) {
        return this.httpClient.post(`${environment.server_base_url}/retraits.php`, retrait);
    }

    addStockage(stockage: Stockage) {
        return this.httpClient.post(`${environment.server_base_url}/stockages.php`, stockage);
    }

    addUtilisateur(utilisateur: Utilisateur) {
        return this.httpClient.post(`${environment.server_base_url}/utilisateurs.php`, utilisateur);
    }

    getProfiles(auteur_operation: string, id?: number, is_by_client: boolean = false) {
        return this.httpClient.get(
            `${environment.server_base_url}/profiles.php?auteur_operation=${auteur_operation}&id=${id}&is_by_client=${is_by_client}`);
    }

    getClients(auteur_operation: string, id?: number) {
        // tslint:disable-next-line:max-line-length
        return this.httpClient.get(`${environment.server_base_url}/clients.php?auteur_operation=${auteur_operation}&id=${id}`);
    }

    getPaiements(auteur_operation: string, id?: number) {
        return this.httpClient.get(`${environment.server_base_url}/paiements.php?auteur_operation=${auteur_operation}&id=${id}`);
    }

    getProduits(auteur_operation: string, id?: number) {
        return this.httpClient.get(`${environment.server_base_url}/produits.php?auteur_operation=${auteur_operation}&id=${id}`);
    }

    getRetraits(auteur_operation: string, activated = 'false', is_by_client = 'false') {
        // tslint:disable-next-line:max-line-length
        return this.httpClient.get(`${environment.server_base_url}/retraits.php?auteur_operation=${auteur_operation}&activated=${activated}&is_by_client=${is_by_client}`);
    }

    getRetraitProduit(auteur_operation: string, id?: number) {
        return this.httpClient.get(`${environment.server_base_url}/retrait_produits.php?auteur_operation=${auteur_operation}&id=${id}`);
    }

    getStockages(auteur_operation: string, id?: number) {
        return this.httpClient.get(`${environment.server_base_url}/stockages.php?auteur_operation=${auteur_operation}&id=${id}`);
    }

    getUtilisateurs(auteur_operation: string, id?: number) {
        return this.httpClient.get(`${environment.server_base_url}/utilisateurs.php?auteur_operation=${auteur_operation}&id=${id}`);
    }

    putClient(client: Client) {
        return this.httpClient.put(`${environment.server_base_url}/clients,php`, client);
    }

    putProfile(profile: Profile) {
        return this.httpClient.put(`${environment.server_base_url}/profiles.php`, profile);
    }

    putPaiement(paiement: Paiement) {
        return this.httpClient.put(`${environment.server_base_url}/paiements.php`, paiement);
    }

    putProduit(produit: Produit) {
        return this.httpClient.put(`${environment.server_base_url}/produits.php`, produit);
    }

    putRetrait(retrait: Retrait) {
        return this.httpClient.put(`${environment.server_base_url}/retraits.php`, retrait);
    }

    putStockage(stockage: Stockage) {
        return this.httpClient.put(`${environment.server_base_url}/stockages.php`, stockage);
    }

    putUtilisateur(utilisateur: Utilisateur) {
        return this.httpClient.put(`${environment.server_base_url}/utilisateurs.php`, utilisateur);
    }

    addRetraitProduit(retraitProduit: RetraitProduits) {
        return this.httpClient.post(`${environment.server_base_url}/retrait_produits.php`, retraitProduit);
    }

    getOperations() {
        return this.httpClient.get(`${environment.server_base_url}/operations.php`);
    }

    getClientByIdentifier(auteur_operation: string, identifiant: string) {
        // tslint:disable-next-line:max-line-length
        return this.httpClient.get(`${environment.server_base_url}/clients.php?auteur_operation=${auteur_operation}&identifiant=${identifiant}`);
    }

    getClientsByRecherche(auteur_operation: string, recherche: string) {
        // tslint:disable-next-line:max-line-length
        return this.httpClient.get(`${environment.server_base_url}/clients.php?auteur_operation=${auteur_operation}&recherche=${recherche}`);
    }

    getIncompletProfiles(auteur_operation: string) {
        // tslint:disable-next-line:max-line-length
        return this.httpClient.get(`${environment.server_base_url}/profiles.php?auteur_operation=${auteur_operation}&incomplete=true`);
    }
}
