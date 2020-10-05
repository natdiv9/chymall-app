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
  all_profiles_client: any[] = [];
  message: string;
  current_profile: Profile;
  demandeRetraitForm: FormGroup;
  message_body: string;
    chargement: boolean;
  private lastsearch: string;

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

  rechercher(value: HTMLInputElement, content: any) {
    if (value.value === '') {
      return;
    }
    const recherche = value.value;
    this.lastsearch = recherche;
    value.value = '';

    this.crudService.getProfilesByRecherche(
        this.authService.currentUser.username,
        recherche
    ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.all_profiles_client = reponse.data;
            this.is_client_found = true;
            this.chargement = false;
            if (reponse.data.length === 0) {
              this.is_client_found = false;
              this.message = 'Aucune information correspondante!';
              this.open(content);
            }
            console.log(reponse.data);
          } else {
            this.is_client_found = false;
            this.chargement = false;
            this.message = 'Cet identifiant client n\'existe pas dans la base de donnée';
            this.open(content);
            console.log(reponse.message);
          }
          // tslint:disable-next-line:no-shadowed-variable
        }, (error) => {
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
            const _document = window.document.body.innerHTML;
            const facture =
                '<!doctype html><html lang=\"en\"><head><meta charset=\"utf-8\">' +
                '<title>Chymall</title>' +
                '<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no\">' +
            '<link rel=\"icon\" type=\"image/x-icon\" href=\"favicon.ico\"></head>' +
                '' +
                '<body style="text-align: center">' +
                '<p style="font-size: 12px;">CHYMALL LUBUMBASHI<br>' +
                '============================================</p>' +
                '<p style="font-size: 12px;">AV. MAMA YEMO LUBUMBASHI, BATIMENT HYPNOSE NIVEAU 2</p>' +
                '<p style="font-size: 12px;">BON DE RETRAIT <br/>=================</p>' +
                '<br>' +
                '<table class="table-responsive" style="border-style: dotted">' +
                '<tr>' +
                '       <th>MONTANT RETIRE</th>' +
                '       <td>' + demande.montant + 'USD</td>' +
                '   </tr>' +
                '</table>' +
                '</body></html>';

            // this.router.navigate(['/', 'facture-retrait']);
            this.open(content);
            // window.document.body.innerHTML = facture;
            // window.print();
            /* const newWin = window.open('', '', 'width=350,height=600');
            newWin.document.write(facture);
            newWin.document.close();
            newWin.focus();
            newWin.print();
            newWin.close(); */
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

  refresh(content: any) {
    this.chargement = true;
    this.crudService.getProfilesByRecherche(
        this.authService.currentUser.username,
        this.lastsearch
    ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.all_profiles_client = reponse.data;
            this.is_client_found = true;
            this.chargement = false;
            if (reponse.data.length === 0) {
              this.message = 'Aucune information correspondante!';
              this.open(content);
            }
            console.log(reponse.data);
          } else {
            this.is_client_found = false;
            this.chargement = false;
            this.message = 'Cet identifiant client n\'existe pas dans la base de donnée';
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
