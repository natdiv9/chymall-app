import { Injectable } from '@angular/core';
import { CanActivate, Router} from '@angular/router';
import { Observable } from 'rxjs';
import {AuthService} from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class CheckAdminGuard implements  CanActivate {
  constructor(private router: Router,
              private authService: AuthService,
              ) { }

  canActivate(): Observable<boolean> | Promise<boolean> | boolean {
    return new Promise(
        (resolve, reject) => {
          if (this.authService.connected && this.authService.currentUser.service === 'admin') {
            resolve(true);
          } else {
            resolve(false);
          }
        });
  }
}
