import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {Router} from '@angular/router';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {Client} from '../../../ChymallModels/models/client';
import {Profile} from '../../../ChymallModels/models/profile';

@Component({
  selector: 'app-retraits-demande-new',
  templateUrl: './retraits-demande-new.component.html',
  styleUrls: ['./retraits-demande-new.component.sass']
})
export class RetraitsDemandeNewComponent implements OnInit {
  closeResult: string;
  is_client_found = false;
  current_client: Client;
  all_profiles_client: Profile[] = [];
  message: string;
  current_profile: Profile;
  demandeRetraitForm: FormGroup;
  message_body: string;

  constructor(
      private crudService: CrudService,
      private authService: AuthService,
      private modalService: NgbModal,
      private router: Router,
      private formBuilder: FormBuilder
  ) { }

  ngOnInit() {
    this.demandeRetraitForm = this.formBuilder.group({
      montant: ['', [Validators.required, Validators.min(1)]]
    });
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
            this.crudService.getProfiles(
                this.authService.currentUser.username,
                this.current_client.id,
                true
            ).subscribe(
                (reponse2: any) => {
                  if (reponse2.status === true) {
                    this.all_profiles_client = reponse2.data;
                  }
                }, (error2 => {})
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

  demande_retrait(profile: Profile, content: any, content2: any) {
    this.current_profile = profile;
    this.open(content2);
  }

  newDemandeRetrait(content: any, c: any) {
    const demande = {
      montant: this.demandeRetraitForm.get('montant').value,
      id_profile: this.current_profile.id,
      auteur_operation: this.authService.currentUser.username
    };
    this.crudService.addRetrait(demande).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Demande enregistrée avec succcès';
            this.demandeRetraitForm.reset();
            this.message_body = `CODE DE RETRAIT: ${reponse.data.code}`;
            this.open(content);
          } else {
            this.message = 'Echèc de la demande';
            console.log(demande);
            console.log(reponse.message);
            this.open(content);
          }
        },
        (error => {
          console.log(error);
        })
    );
  }
}
