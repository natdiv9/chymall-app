import { Injectable } from '@angular/core';
import {CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router} from '@angular/router';
import { Observable } from 'rxjs';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {CustomModalComponent} from '../../../ChymallServices/auth/custom-modal/custom-modal.component';

@Injectable({
  providedIn: 'root'
})
export class RetraitsAllGuard implements CanActivate {
  services_admis = ['transfert', 'comptabilite', 'admin'];

  constructor(
      private router: Router,
      private authService: AuthService,
      private customModalComponent: CustomModalComponent) {
  }

  canActivate(): boolean {
    // tslint:disable-next-line:max-line-length
    if (this.authService.connected) {
      for (const s_a of this.services_admis) {
        if (this.authService.currentUser.service === s_a) {
          return true;
        }
      }
      return false;
    } else {
      return false;
    }
  }
}
