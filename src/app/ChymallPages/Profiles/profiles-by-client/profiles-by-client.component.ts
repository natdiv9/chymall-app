import {Component, OnInit} from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ActivatedRoute, Router} from '@angular/router';
import {Profile} from '../../../ChymallModels/models/profile';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
    selector: 'app-profiles-by-client',
    templateUrl: './profiles-by-client.component.html',
    styleUrls: ['./profiles-by-client.component.sass']
})
export class ProfilesByClientComponent implements OnInit {

    profiles: any[] = [];
    username = '';
    message: string;
    closeResult: string;
    chargement: boolean;
    selected_profile: Profile;

    constructor(private crudService: CrudService,
                private authService: AuthService,
                private modalService: NgbModal,
                private router: Router,
                private route: ActivatedRoute) {
    }

    ngOnInit() {
        this.refresh();
    }

    refresh() {
        this.chargement = true;
        const id = this.route.snapshot.params.idclient;
        this.username = this.route.snapshot.params.username;
        this.crudService.getProfiles(
            this.authService.currentUser.username,
            id,
            true
        ).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.chargement = false;
                    this.profiles = reponse.data;
                } else {
                    this.chargement = false;
                    this.message = 'Echec de recupération de données';
                    console.log(reponse.message);
                }
            }, (error) => {
                this.message = 'Echec de recupération de données';
                console.log(error);
            }
        );
    }

    open(content) {
        this.modalService.open(content,
            {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
            this.closeResult = `Closed with: ${result}`;
        }, (reason) => {
            this.closeResult =
                `Dismissed ${this.getDismissReason(reason)}`;
        });
    }

    private getDismissReason(reason: any): string {
        if (reason === ModalDismissReasons.ESC) {
            return 'by pressing ESC';
        } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
            return 'by clicking on a backdrop';
        } else {
            return `with: ${reason}`;
        }
    }

    confirmation_ct(profile: Profile, content: any, content2: any) {
        this.selected_profile = profile;
        this.open(content2);
    }

    confirmation_tr(profile: Profile, content: any, content2: any) {
        this.selected_profile = profile;
        this.open(content2);
    }

    activer_trading(content: any, c: any) {
        // profile.etat_trading = 1;
        this.crudService.putProfile(Object.assign(
            this.selected_profile,
            {
                etat_trading: 1,
                activations: 'activations',
                auteur_operation: this.authService.currentUser.username
            }
        )).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.message = 'Activation du trading effectuée avec succès!';
                    this.open(content);
                    this.refresh();
                } else {
                    this.message = 'Echec d\'activation du trading!';
                    this.open(content);
                    console.log(reponse.message);
                }
            },
            (error) => {
                this.message = 'Echec d\'activation du trading!';
                this.open(content);
                console.log(error);
            }
        );
    }

    activer_compte(content: any, c: any) {
        // profile.etat_activation = 1;
        this.crudService.putProfile(Object.assign(
            this.selected_profile,
            {
                etat_activation: 1,
                activations: 'activations',
                auteur_operation: this.authService.currentUser.username
            }
        )).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.message = 'Activation du compte effectuée avec succès!';
                    this.open(content);
                    this.refresh();
                } else {
                    this.message = 'Echec d\'activation du compte!';
                    this.open(content);
                    console.log(reponse.message);
                }
            },
            (error) => {
                this.message = 'Echec d\'activation du compte!';
                this.open(content);
                console.log(error);
            }
        );
    }
}
