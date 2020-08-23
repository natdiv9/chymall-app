import { Injectable } from '@angular/core';
import {CanActivate, Router} from '@angular/router';
import {AuthService} from './auth.service';
import {Observable} from 'rxjs';
import {Location} from '@angular/common';

@Injectable({
  providedIn: 'root'
})
export class ComptabiliteGuardService implements CanActivate {

  constructor(private router: Router,
              private authService: AuthService,
              private location: Location) { }

  canActivate(): boolean {
      if (this.authService.connected &&
          (this.authService.currentUser.service === 'comptabilite' || this.authService.currentUser.service === 'admin')) {
          return  true;
      }
      return false;
  }
}
