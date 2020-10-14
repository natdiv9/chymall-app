import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ActivatedRoute, Router} from '@angular/router';
import {Client} from '../../../ChymallModels/models/client';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-clients-update',
  templateUrl: './clients-update.component.html',
  styleUrls: ['./clients-update.component.sass']
})
export class ClientsUpdateComponent implements OnInit {
    updateCientForm: FormGroup;
    client: Client;

  heading = 'Modals';
  subheading = 'Wide selection of modal dialogs styles and animations available.';
  icon = 'pe-7s-phone icon-gradient bg-premium-dark';

  closeResult: string;
  message: string;
  identifiant: string;

  constructor(private formBuilder: FormBuilder,
              private route: ActivatedRoute,
              private modalService: NgbModal,
              private router: Router,
              private crudService: CrudService,
              private authService: AuthService) { }

  ngOnInit() {
    this.initForm();
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

  openLarge(content) {
    this.modalService.open(content, {
      size: 'lg'
    });
  }

  initForm() {
    this.updateCientForm = this.formBuilder.group({
      telephone: '',
      email: '',
      prenom: '',
      nom: '',
      adresse: '',
      ville: '',
      pays: '',
      nom_beneficiaire: '',
      prenom_beneficiaire: '',
      identifiant_sponsor: ''
    });
    const id = +this.route.snapshot.params.id;
    if (typeof id === 'number') {
      this.crudService.getClients(this.authService.currentUser.username, id).subscribe(
          (response: any) => {
            if (response.status === true) {
              console.log(response);
              this.client = response.data[0];
              this.identifiant = this.client.identifiant;
              this.updateCientForm = this.formBuilder.group({
                telephone: this.client.telephone,
                email: [this.client.email, [Validators.email]],
                prenom: this.client.prenom,
                nom: this.client.nom,
                adresse: this.client.adresse,
                ville: this.client.ville,
                pays: this.client.pays,
                nom_beneficiaire: this.client.nom_beneficiaire,
                prenom_beneficiaire: this.client.prenom_beneficiaire,
                identifiant_sponsor: this.client.identifiant_sponsor
              });
            } else {
              console.log(response);
            }
          }, (error => {console.log(error); })
      );
    } else {
      this.router.navigate(['/', 'clients', 'all']);
    }
  }


  updateClient(content: any) {
    const client = {
      id: this.client.id,
      identifiant: this.client.identifiant,
      telephone: this.updateCientForm.get('telephone').value,
      email: this.updateCientForm.get('email').value,
      prenom: this.updateCientForm.get('prenom').value,
      nom: this.updateCientForm.get('nom').value,
      adresse: this.updateCientForm.get('adresse').value,
      ville: this.updateCientForm.get('ville').value,
      pays: this.updateCientForm.get('pays').value,
      nom_beneficiaire: this.updateCientForm.get('nom_beneficiaire').value,
      prenom_beneficiaire: this.updateCientForm.get('prenom_beneficiaire').value,
      identifiant_sponsor: this.updateCientForm.get('identifiant_sponsor').value,
      auteur_operation: this.authService.currentUser.username,
      etat: this.client.etat

    };

    this.crudService.putClient(client).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Modification effectuée avec succès!';
            this.open(content);
            this.router.navigate(['/', 'clients', 'all']);
          } else {
            this.message = 'Modification a echoué!';
            this.open(content);
          }
        }
    );
  }

  supprimer(content: any, c: any) {
    this.crudService.deleteClient(this.authService.currentUser.username, this.client.id).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Suppression effectuée avec succès!';
            this.open(content);
            this.router.navigate(['/', 'clients', 'all']);
          } else {
            this.message = 'La suppression a echoué!';
            this.open(content);
          }
        }
    );
  }

  demande_validation(supprimer_client: any) {
    this.open(supprimer_client);
  }
}
