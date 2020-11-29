import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Client} from '../../../ChymallModels/models/client';
import {Profile} from '../../../ChymallModels/models/profile';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
    selector: 'app-profiles-completer-username',
    templateUrl: './profiles-completer-username.component.html',
    styleUrls: ['./profiles-completer-username.component.sass']
})
export class ProfilesCompleterUsernameComponent implements OnInit {

    closeResult: string;

    completerProfileForm: FormGroup;
    message: string;
    identifiant: string;
    is_client_found = false;
    current_client: Client;
    all_profiles_client: any[] = [];
    private current_profile: Profile;
    chargement: boolean;

    constructor(
        private authService: AuthService,
        private crudService: CrudService,
        private fb: FormBuilder,
        private modalService: NgbModal,
    ) {
    }

    ngOnInit() {
        this.refresh();
        this.completerProfileForm = this.fb.group({
            username: ['', Validators.required],
            client: ['']
        });
    }

    completion(content: any, c: any) {
        const data_sent = Object.assign(this.current_profile, {
            auteur_operation: this.authService.currentUser.username,
            username: this.completerProfileForm.get('username').value,
            etat: 2,
            date_activation: 'activated'
        });
        this.completerProfileForm.reset();
        this.crudService.putProfile(
            data_sent
        ).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.completerProfileForm.reset();
                    this.message = 'Enregistrement effectué avec succès!';
                    this.refresh();
                    this.open(content);
                    console.log(reponse);
                } else {
                    this.refresh();
                    if (reponse.message === 'DOUBLON') {
                        this.message = 'Ce username existe dans le système';
                    } else {
                        this.message = 'Enregistrement a échoué!';
                    }
                    this.open(content);
                    // console.log(data_sent);
                    console.log(reponse.message);
                }
            }, (error) => {
                this.message = 'Echec de l\'opération!';
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
            recherche,
            'incomplete'
        ).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.all_profiles_client = reponse.data;
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

    completer_profile(profile: Profile, content: any, content2: any) {
        this.current_profile = profile;
        this.open(content2);
    }

    refresh() {
        this.chargement = true;
        this.crudService.getIncompletProfiles(
            this.authService.currentUser.username
        ).subscribe(
            (reponse2: any) => {
                if (reponse2.status === true) {
                    this.is_client_found = false;
                    this.chargement = false;
                    this.all_profiles_client = reponse2.data;
                } else {
                    this.chargement = false;
                    this.message = 'Echec de recupération de données';
                    console.log(reponse2.message);
                }
            }, (error2 => {
                this.message = 'Echec de recupération de données';
                console.log(error2);
            })
        );

    }
}
