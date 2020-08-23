import { Injectable } from '@angular/core';
import {ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree} from '@angular/router';
import { Observable } from 'rxjs';
import {AuthService} from './auth.service';
import {Location} from '@angular/common';

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
