import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Client} from '../../ChymallModels/models/client';
import {Paiement} from '../../ChymallModels/models/paiement';
import {Produit} from '../../ChymallModels/models/produit';
import {Profile} from '../../ChymallModels/models/profile';
import {Retrait} from '../../ChymallModels/models/retrait';
import {Stockage} from '../../ChymallModels/models/stockage';
import {Utilisateur} from '../../ChymallModels/models/utilisateur';

@Injectable({
  providedIn: 'root'
})
export class CrudService {

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

  getRetraits() {
      return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  getStockages() {
      return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }

  getUtilisateurs() {
      return this.httpClient.get('localhost/chymall/DIST/api/controllers/');
  }
}
