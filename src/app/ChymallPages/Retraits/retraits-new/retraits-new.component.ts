import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {Profile} from '../../../ChymallModels/models/profile';
import {Client} from '../../../ChymallModels/models/client';
import {Retrait} from '../../../ChymallModels/models/retrait';

@Component({
  selector: 'app-retraits-new',
  templateUrl: './retraits-new.component.html',
  styleUrls: ['./retraits-new.component.sass']
})
export class RetraitsNewComponent implements OnInit {
  closeResult: string;
  id_profile: number;
  message_body: string;
  is_client_found = false;
  current_client: Client;
  all_profiles_client: any[] = [];
  message: string;
  currentRetrait: any;

  constructor(private crudService: CrudService,
              private authService: AuthService,
              private modalService: NgbModal) { }

  ngOnInit() {
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

  checkClient(input_id_client: HTMLInputElement, content: any) {
    if (input_id_client.value === '' || input_id_client.value === undefined) { return; }
    this.crudService.getClientByIdentifier(
        this.authService.currentUser.username,
        input_id_client.value
    ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.is_client_found = true;
            this.current_client = reponse.data;
            this.crudService.getRetraits(
                this.authService.currentUser.username, 'true', '' + this.current_client.id
            ).subscribe(
                (reponse2: any) => {
                  if (reponse2.status === true) {
                    this.all_profiles_client = reponse2.data;
                  } else {
                    this.message = 'Impossible de trouver les profiles';
                    this.open(content);
                  }
                }, (error2 => {
                  console.log(error2);
                })
            );
          } else {
            this.is_client_found = false;
            this.message = 'Cet identifiant client n\'existe pas dans la base de donnée';
            this.open(content);
          }
        },
        (error) => {console.log(error);
        }
    );
  }

  valider_retrait(profile: any, content: any, content2: any) {
    this.currentRetrait = profile;
    this.open(content2);
  }

  validerRetrait(content: any, c: any) {
    const data_to_send = {
      id: this.currentRetrait.id,
      montant: this.currentRetrait.montant,
      id_profile: this.currentRetrait.id_profile,
      etat: 1,
      auteur_operation: this.authService.currentUser.username
    };
    this.crudService.putRetrait(data_to_send).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Retrait enregistrée avec succcès';
            this.refreshData(this.current_client.identifiant, content);
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

  private refreshData(id_client: string, content: any) {
    this.crudService.getClientByIdentifier(
        this.authService.currentUser.username,
        id_client + ''
    ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.is_client_found = true;
            this.current_client = reponse.data;
            this.crudService.getRetraits(
                this.authService.currentUser.username, 'true', '' + this.current_client.id
            ).subscribe(
                (reponse2: any) => {
                  if (reponse2.status === true) {
                    this.all_profiles_client = reponse2.data;
                  } else {
                    this.message = 'Impossible de trouver les profiles';
                    this.open(content);
                  }
                }, (error2 => {
                  console.log(error2);
                })
            );
          } else {
            this.is_client_found = false;
            this.message = 'Cet identifiant client n\'existe pas dans la base de donnée';
            this.open(content);
          }
        },
        (error) => {console.log(error);
        }
    );
  }
}
