import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ActivatedRoute, Router} from '@angular/router';
import {Client} from '../../../ChymallModels/models/client';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

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

  constructor(private formBuilder: FormBuilder,
              private route: ActivatedRoute,
              private modalService: NgbModal,
              private router: Router,
              private crudService: CrudService) { }

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
    const id = this.route.snapshot.params.id;
    this.crudService.getClients(id).subscribe(
        (response: any) => {
          if (response.status) {
            this.client = response.data;
            this.updateCientForm = this.formBuilder.group({
              telephone: this.client.telephone,
              email: this.client.email,
              prenom: this.client.prenom,
              adresse: this.client.adresse,
              adresse2: this.client.adresse2,
              ville: this.client.ville,
              state: this.client.pays,
              zip: this.client.zip,
              nom: this.client.nom,
              photo: this.client.photo
            });
          }
        }
    );
  }


  updateClient() {
    const client = {
      telephone: this.updateCientForm.get('telephone').value,
      email: this.updateCientForm.get('email').value,
      prenom: this.updateCientForm.get('prenom').value,
      nom: this.updateCientForm.get('nom').value,
      adresse: this.updateCientForm.get('adresse').value,
      adresse2: this.updateCientForm.get('adresse2').value,
      ville: this.updateCientForm.get('ville').value,
      pays: this.updateCientForm.get('pays').value,
      zip: this.updateCientForm.get('zip').value,
      photo: this.client.photo,
      etat: 1,
      pwd_login: '123456',
      pwd_retrait: '123456'
    };

    this.crudService.putClient(client).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Modification effectuée avec succès!');
            this.updateCientForm.reset();
          } else {
            this.modalService.open('Modification a echoué!');
          }
        }
    );
  }
}
