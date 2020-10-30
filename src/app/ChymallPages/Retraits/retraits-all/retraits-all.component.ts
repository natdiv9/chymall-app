import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Retrait} from '../../../ChymallModels/models/retrait';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-retraits-all',
  templateUrl: './retraits-all.component.html',
  styleUrls: ['./retraits-all.component.sass']
})
export class RetraitsAllComponent implements OnInit {

  retraits: any[] = [];
  chargement: boolean;
  message: string;
  synthese: any;
    private closeResult: string;

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

  refresh() {
      this.chargement = true;
      this.crudService.getRetraits(this.authService.currentUser.username).subscribe(
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
}
