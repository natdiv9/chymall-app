import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Client} from '../../ChymallModels/models/client';
import {Paiement} from '../../ChymallModels/models/paiement';
import {Produit} from '../../ChymallModels/models/produit';
import {Profile} from '../../ChymallModels/models/profile';
import {Retrait} from '../../ChymallModels/models/retrait';
import {Stockage} from '../../ChymallModels/models/stockage';
import {Utilisateur} from '../../ChymallModels/models/utilisateur';

// Environment
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CrudService {

  constructor(private httpClient: HttpClient) {
  }

  uploadFile(file: File) {
    return new Promise(
        (resolve, reject) => {
          const almostUniqueFileName = Date.now().toString();
        }
    );
  }

  addClient(client: Client) {
    return this.httpClient.post(`${environment.server_base_url}/clients.php`, client);
  }

  addPaiement(paiement: Paiement) {
      return this.httpClient.post(`${environment.server_base_url}/paiements.php`, paiement);
  }

  addProduit(produit: Produit) {
      return this.httpClient.post(`${environment.server_base_url}/retraits.php`, produit);
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

  getProfiles(id?: number) {
      return this.httpClient.get(`${environment.server_base_url}/profiles.php`);
  }

  getClients(id?: number) {
        return this.httpClient.get(`${environment.server_base_url}/clients.php`);
  }

  getPaiements(id?: number) {
        return this.httpClient.get(`${environment.server_base_url}/paiements.php`);
  }

  getProduits(id?: number) {
      return this.httpClient.get(`${environment.server_base_url}/produits.php`);
  }

  getRetraits(id?: number) {
      return this.httpClient.get(`${environment.server_base_url}/retraits.php`);
  }

  getStockages(id?: number) {
      return this.httpClient.get(`${environment.server_base_url}/stockages.php`);
  }

  getUtilisateurs(id?: number) {
      return this.httpClient.get(`${environment.server_base_url}/utilisateurs.php`);
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
}
