import {Injectable, Type} from '@angular/core';
import {CanActivate, Router} from '@angular/router';
import {AuthService} from './auth.service';
import {CustomModalComponent} from './custom-modal/custom-modal.component';

@Injectable({
  providedIn: 'root'
})
export class AdhesionGuardService implements CanActivate {

    constructor(
                private router: Router,
                private authService: AuthService,
                private customModalComponent: CustomModalComponent) {
  }

  canActivate(): boolean {
      // tslint:disable-next-line:max-line-length
        if (this.authService.connected && (this.authService.currentUser.service === 'adhesion' || this.authService.currentUser.service === 'admin')) {
            return true;
        } else {
            // this.customModalComponent.open();
            return false;
        }
  }
}
