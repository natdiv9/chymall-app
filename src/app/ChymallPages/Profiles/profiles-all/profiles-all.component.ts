import {Component, OnInit} from '@angular/core';
import {Profile} from '../../../ChymallModels/models/profile';
import {Subscription} from 'rxjs';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Router} from '@angular/router';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
    selector: 'app-profiles-all',
    templateUrl: './profiles-all.component.html',
    styleUrls: ['./profiles-all.component.sass']
})
export class ProfilesAllComponent implements OnInit {

    profiles: any[] = [];
    message: string;
    closeResult: string;
    isSearchActive: any;
    chargement: boolean;
    selected_profile: Profile;
    to_be_deleted_id: string;

    constructor(private crudService: CrudService,
                private authService: AuthService,
                private modalService: NgbModal,
                private router: Router) {
    }

    ngOnInit() {
        this.refresh();
    }

    refresh() {
        this.chargement = true;
        this.crudService.getProfiles(this.authService.currentUser.username).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.chargement = false;
                    this.profiles = [];
                    for (const data of reponse.data) {
                        // tslint:disable-next-line:triple-equals
                        if (+data.is_online_profile == 0) {
                            this.profiles.push(data);
                        }
                    }
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

    rechercher(value: HTMLInputElement, content: any) {
        if (value.value === '') {
            return;
        }
        const recherche = value.value;
        value.value = '';

        this.crudService.getProfilesByRecherche(
            this.authService.currentUser.username,
            recherche
        ).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.profiles = reponse.data;
                    console.log(reponse.data);
                    if (reponse.data.length === 0) {
                        this.message = 'Aucune information correspondante!';
                        this.open(content);
                    }
                } else {
                    console.log(reponse.message);
                }
                // tslint:disable-next-line:no-shadowed-variable
            }, (error) => {
                console.log(error);
            }
        );
    }

    supprimer(content: any, c: any) {
        this.crudService.deleteProfile(this.authService.currentUser.username, this.to_be_deleted_id).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.message = 'Suppression effectuée avec succès!';
                    this.open(content);
                    // this.router.navigate(['/', 'profiles', 'visualiser']);
                    this.refresh();
                } else {
                    this.message = 'La suppression a echoué!';
                    this.open(content);
                }
            }
        );
    }

    demande_validation(supprimer_client: any, id: string) {
        this.to_be_deleted_id = id;
        this.open(supprimer_client);
    }
}
