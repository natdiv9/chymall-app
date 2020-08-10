import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ActivatedRoute, Router} from '@angular/router';
import {Client} from '../../../ChymallModels/models/client';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

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
              city: this.client.ville,
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
      etat: true
    };

    this.crudService.putClient(client).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open(this.closeResult);
            this.updateCientForm.reset();
          } else {
            this.router.navigate(['clients/all']);
          }
        }
    );
  }
}
