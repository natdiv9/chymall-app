import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {Retrait} from '../../../ChymallModels/models/retrait';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {Datetranslate} from '../../../ChymallServices/helpers/datetranslate';

@Component({
  selector: 'app-retraits-all-demandes',
  templateUrl: './retraits-all-demandes.component.html',
  styleUrls: ['./retraits-all-demandes.component.sass']
})
export class RetraitsAllDemandesComponent implements OnInit {

  retraits: any[] = [];
  chargement: boolean;
  message: string;
  synthese: any;
  currentRetrait: any;
  closeResult: string;
    datetext: string;

    constructor(private crudService: CrudService,
                private authService: AuthService,
                private modalService: NgbModal) { }

  ngOnInit() {
    this.refresh();
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

  getResume() {
    this.crudService.getResume(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.synthese = reponse.data[0];
          } else {
            // this.message = 'Echec de recupération de données';
            // console.log(reponse.message);
          }
        }, (error => {
          // this.message = 'Echec de recupération de données';
          // console.log(error);
        })
    );
  }
  annuler_retrait(profile: any, content: any, content2: any) {
    this.currentRetrait = profile;
    this.open(content2);
  }

  validerAnnulation(content: any, c: any) {
        const data_to_send = {
            id: this.currentRetrait.id,
            montant: this.currentRetrait.montant,
            id_profile: this.currentRetrait.id_profile,
            operateur_transfert: this.currentRetrait.operateur_transfert,
            operateur_validation: this.currentRetrait.operateur_validation,
            etat: 2,
            auteur_operation: this.authService.currentUser.username
        };
        this.crudService.putRetrait(data_to_send).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.message = 'Cette demande a été annulée avec succcès';
                    this.refresh();
                    this.open(content);
                } else {
                    this.message = 'Echèc de la demande';
                    console.log(reponse.message);
                    this.open(content);
                }
            },
            (error => {
                this.message = 'Echèc de la demande';
                console.log(error);
            })
        );
    }

  refresh(date = 'today') {
    // this.getResume();
    this.chargement = true;
    this.datetext = (date === 'today') ? 'Aujourd\'hui' : Datetranslate.formatInFrench(new Date(date));
    this.crudService.getRetraits(this.authService.currentUser.username, 'false', 'false', date).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.chargement = false;
            this.retraits = reponse.data;
          } else {
            this.chargement = false;
            this.message = 'Echec de recupération de données';
            console.log(reponse.message);
          }
        }, (error => {
          this.message = 'Echec de recupération de données';
          console.log(error);
        })
    );
  }

    rechercher(value: HTMLInputElement, content: any) {
        if (value.value === '') {
            return;
        }
        const recherche = value.value;
        // this.lastsearch = recherche;
        value.value = '';

        this.crudService.getRetraitByRecherche(
            this.authService.currentUser.username,
            recherche
        ).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.retraits = reponse.data;
                    this.chargement = false;
                    if (reponse.data.length === 0) {
                        this.message = 'Aucune information correspondante!';
                        this.open(content);
                    }
                    console.log(reponse.data);
                } else {
                    this.chargement = false;
                    this.message = 'Aucune information correspondante';
                    this.open(content);
                    console.log(reponse.message);
                }
                // tslint:disable-next-line:no-shadowed-variable
            }, (error) => {
                console.log(error);
            }
        );
    }

    changer_date(value: string) {
        this.refresh(value);
    }
}
