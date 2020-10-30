import {Injectable, Type} from '@angular/core';
import {CanActivate, Router} from '@angular/router';
import {AuthService} from './auth.service';
import {CustomModalComponent} from './custom-modal/custom-modal.component';

@Injectable({
    providedIn: 'root'
})
export class AdhesionGuardService implements CanActivate {

    services_admis = ['adhesion', 'admin'];

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
