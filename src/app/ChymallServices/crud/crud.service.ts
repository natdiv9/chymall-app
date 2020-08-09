import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Client} from '../../ChymallModels/models/client';
import {Paiement} from '../../ChymallModels/models/paiement';
import {Produit} from '../../ChymallModels/models/produit';
import {Profile} from '../../ChymallModels/models/profile';
import {Retrait} from '../../ChymallModels/models/retrait';
import {Stockage} from '../../ChymallModels/models/stockage';
import {Utilisateur} from '../../ChymallModels/models/utilisateur';
import {RetraitProduits} from '../../ChymallModels/models/retrait-produits';

@Injectable({
  providedIn: 'root'
})
export class CrudService {

    currentUser: Utilisateur;

  constructor(private httpClient: HttpClient) { }

  uploadFile(file: File) {
    return new Promise(
        (resolve, reject) => {
          const almostUniqueFileName = Date.now().toString();
        }
    );
  }

  addClient(client: Client) {
    return this.httpClient.post('localhost/chymall/DIST/api/controllers/', client);
  }

  addPaiement(paiement: Paiement) {
      return this.httpClient.post('localhost/chymall/DIST/api/controllers/', paiement);
  }

  addProduit(produit: Produit) {
      return this.httpClient.post('localhost/chymall/DIST/api/controllers/', produit);
  }

  addProfile(profile: Profile) {
      return this.httpClient.post('localhost/chymall/DIST/api/controllers/', profile);
  }

  addRetrait(retrait: Retrait) {
      return this.httpClient.post('localhost/chymall/DIST/api/controllers/', retrait);
  }

  addStockage(stockage: Stockage) {
      return this.httpClient.post('localhost/chymall/DIST/api/controllers/', stockage);
  }

  addUtilisateur(utilisateur: Utilisateur) {
      return this.httpClient.post('localhost/chymall/DIST/api/controllers/', utilisateur);
  }

  getProfiles(id?: number) {
      return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  getClients(id?: number) {
        return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  getPaiements(id?: number) {
        return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  getProduits(id?: number) {
      return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  getRetraits(id?: number) {
      return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  getStockages(id?: number) {
      return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  getUtilisateurs(id?: number) {
      return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  putClient(client: Client) {
     return this.httpClient.put('localhost/chymall/DIST/api/controllers/', client);
  }

  putProfile(profile: Profile) {
      return this.httpClient.put('localhost/chymall/DIST/api/controllers/', profile);
  }

  putPaiement(paiement: Paiement) {
      return this.httpClient.put('localhost/chymall/DIST/api/controllers/', paiement);
  }

  putProduit(produit: Produit) {
      return this.httpClient.put('localhost/chymall/DIST/api/controllers/', produit);
  }

  putRetrait(retrait: Retrait) {
      return this.httpClient.put('localhost/chymall/DIST/api/controllers/', retrait);
  }

  putStockage(stockage: Stockage) {
      return this.httpClient.put('localhost/chymall/DIST/api/controllers/', stockage);
  }

  putUtilisateur(utilisateur: Utilisateur) {
      return this.httpClient.put('localhost/chymall/DIST/api/controllers/', utilisateur);
  }

  getConnection(username: string, pwd: string) {
        return this.httpClient.put('localhost/chymall/DIST/api/controllers/', {username, pwd});
  }

    retraitProduit(retraitProduit: RetraitProduits) {
        return this.httpClient.put('localhost/chymall/DIST/api/controllers/', retraitProduit);
    }
}
