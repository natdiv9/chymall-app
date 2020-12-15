import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-clients-enligne',
  templateUrl: './clients-enligne.component.html',
  styleUrls: ['./clients-enligne.component.sass']
})

export class ClientsEnligneComponent implements OnInit {

  newClientForm: FormGroup;
  loading: boolean;

  heading = 'Modals';
  subheading = 'Wide selection of modal dialogs styles and animations available.';
  icon = 'pe-7s-phone icon-gradient bg-premium-dark';

  closeResult: string;
  message: string;
  identifiant: string;

  constructor(private formBuilder: FormBuilder,
              private modalService: NgbModal,
              private router: Router,
              private crudService: CrudService,
              private authService: AuthService) { }

  ngOnInit() {
    this.initForm();
  }

  open(content, route  = []) {
    this.modalService.open(content,
        {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
      this.router.navigate(route);
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

  initForm() {
    this.newClientForm = this.formBuilder.group({
      telephone: ['', [Validators.required]],
      email: ['', [Validators.email]],
      prenom: ['', [Validators.required]],
      nom: ['', [Validators.required]],
      adresse: [''],
      ville: [this.authService.currentUser.bureau],
      pays: ['RD Congo'],
      nom_beneficiaire: '',
      prenom_beneficiaire: ''
    });
  }

  newClient(content: any) {
    const client = {
      telephone: this.newClientForm.get('telephone').value,
      email: this.newClientForm.get('email').value,
      prenom: this.newClientForm.get('prenom').value,
      nom: this.newClientForm.get('nom').value,
      adresse: this.newClientForm.get('adresse').value,
      ville: this.newClientForm.get('ville').value,
      pays: this.newClientForm.get('pays').value,
      nom_beneficiaire: this.newClientForm.get('nom_beneficiaire').value,
      prenom_beneficiaire: this.newClientForm.get('prenom_beneficiaire').value,
      identifiant_sponsor: '-',
      ajoute_par: this.authService.currentUser.username,
      auteur_operation: this.authService.currentUser.username
    };
    this.crudService.addClient(client).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.identifiant = reponse.data.identifiant;
            this.message = 'Nouveau client enregistré avec succès';
            this.open(content, ['/', 'profiles', 'enligne']);
            this.newClientForm.reset();
          } else {
            this.message = 'L\'enregistrement a échoué';
            this.open(content);
            console.log(reponse.message);
          }
        },
        (error => {
          this.message = 'L\'enregistrement a échoué';
          this.open(content);
          console.log(error);
        })
    );
  }
}
