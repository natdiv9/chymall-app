import { Injectable } from '@angular/core';
import {ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree} from '@angular/router';
import { Observable } from 'rxjs';
import {AuthService} from './auth.service';
import {CustomModalComponent} from './custom-modal/custom-modal.component';

@Injectable({
  providedIn: 'root'
})
export class ProfileEnligneGuard implements  CanActivate{
  constructor(
      private router: Router,
      private authService: AuthService,
      private customModalComponent: CustomModalComponent) {
  }

  canActivate(): boolean {
    // tslint:disable-next-line:max-line-length
    if (this.authService.connected && (this.authService.currentUser.service === 'profile-enligne' || this.authService.currentUser.service === 'admin')) {
      return true;
    } else {
      // this.customModalComponent.open();
      return false;
    }
  }
}
