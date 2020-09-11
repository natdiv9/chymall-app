import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../ChymallServices/crud/crud.service';
import {AuthService} from '../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {Router} from '@angular/router';
import {Pacts} from '../../ChymallModels/models/pacts';

@Component({
  selector: 'app-pacts-all',
  templateUrl: './pacts-all.component.html',
  styleUrls: ['./pacts-all.component.sass']
})
export class PactsAllComponent implements OnInit {
  chargement: boolean;
  nouveau_vip_form: FormGroup;

  closeResult: string;
  message: string;
  message_body: string;
  pacts: any[] = [];
  current_pact: Pacts;

  constructor(
      private crudService: CrudService,
      private authService: AuthService,
      private modalService: NgbModal,
      private router: Router,
      private formBuilder: FormBuilder
  ) { }

  ngOnInit() {
    this.nouveau_vip_form = this.formBuilder.group({
      montant_compte: ['', [Validators.required, Validators.min(0)]],
      montant_trading: ['', [Validators.min(0)]],
      niveau: ['', [Validators.required, Validators.min(1)]]
    });
    this.refresh();
  }

  refresh() {
    this.chargement = true;
    this.crudService.getPacts(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.pacts = reponse.data;
            this.chargement = false;
          } else {
            this.chargement = false;
            console.log(reponse.message);
          }
        }, (error) => {
          console.log(error);
        }
    );
  }

  on_modif_vip(content: any, c: any) {
    const data = {
      id: this.current_pact.id,
      niveau: this.nouveau_vip_form.get('niveau').value,
      montant_compte: this.nouveau_vip_form.get('montant_compte').value,
      montant_trading: this.nouveau_vip_form.get('montant_trading').value,
      auteur_operation: this.authService.currentUser.username
    };
    this.crudService.putPacts(data).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Operation effectuée avec succès';
            this.open(content);
            this.nouveau_vip_form.reset();
            this.refresh();
          } else {
            this.message = 'L\'operation a échoué';
            this.open(content);
            console.log(reponse);
          }
        }, (error) => {
          console.log(error);
        }

    );
  }

  on_new_vip(content: any, c: any) {
    const data = {
      niveau: this.nouveau_vip_form.get('niveau').value,
      montant_compte: this.nouveau_vip_form.get('montant_compte').value,
      montant_trading: this.nouveau_vip_form.get('montant_trading').value,
      auteur_operation: this.authService.currentUser.username
    };
    this.crudService.addPacts(data).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Operation effectuée avec succès';
            this.open(content);
            this.nouveau_vip_form.reset();
            this.refresh();
          } else {
            this.message = 'L\'operation a échoué';
            this.open(content);
            console.log(reponse);
          }
        }, (error) => {
          console.log(error);
        }

    );
  }

  on_btn_modifier_pact(pact: Pacts, content2: any) {
    this.nouveau_vip_form = this.formBuilder.group({
      niveau: [pact.niveau],
      montant_compte: [pact.montant_compte],
      montant_trading: [pact.montant_trading]
    });
    this.current_pact = pact;
    this.open(content2);
  }

  on_btn_supprimer(pact: Pacts, content: any, content_conf: any) {
    this.open(content_conf);
    this.current_pact = pact;
  }

  supprimer_pact(content: any, c: any) {
    this.crudService.deletePact(
        this.authService.currentUser.username,
        this.current_pact.id
    ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Operation effectuée avec succès';
            this.open(content);
            this.refresh();
          } else {
            this.message = 'L\'operation a échoué';
            this.refresh();
            this.open(content);
            console.log(reponse);
          }
        }, (error) => {
          console.log(error);
        }
    );
  }

  on_btn_new_pact(content2: any) {
    this.open(content2);
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
}
