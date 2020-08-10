import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Subject} from 'rxjs';
import {Utilisateur} from '../../ChymallModels/models/utilisateur';

// Environment
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  connected = false;
  user: Utilisateur = null;

  constructor(private httpClient: HttpClient) {
  }

  auth(username, password) {
    return this.httpClient.post<any>(`${environment.server_base_url}/authentification.php`, {username, password});
  }

  logout() {
    this.user = null;
    this.connected = false;
  }
}
