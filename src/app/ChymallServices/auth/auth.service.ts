import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Subject} from 'rxjs';
import {Utilisateur} from '../../ChymallModels/models/utilisateur';

// Environment
import { environment } from '../../../environments/environment';
import {Router} from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  connected = false;
  currentUser: Utilisateur = null;

  constructor(private httpClient: HttpClient,
              private router: Router) {
  }

  auth(username, pwd) {
    return this.httpClient.post<any>(`${environment.server_base_url}/authentification.php`, {username, pwd});
  }

  logout() {
    this.httpClient.get(`${environment.server_base_url}/authentification.php?logout=chylogout`)
        .subscribe((response: any) => {
          this.router.navigate(['/connexion']);
          this.currentUser = new Utilisateur();
          this.connected = false;
        }, (error => {
          this.router.navigate(['/connexion']);
        }));
  }
}
