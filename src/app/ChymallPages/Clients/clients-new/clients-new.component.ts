import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
import {Router} from '@angular/router';

@Component({
  selector: 'app-clients-new',
  templateUrl: './clients-new.component.html',
  styleUrls: ['./clients-new.component.sass']
})
export class ClientsNewComponent implements OnInit {

  newClientForm: FormGroup;
  fileUrl: string;
  loaded: boolean;
  loading: boolean;

  heading = 'Modals';
  subheading = 'Wide selection of modal dialogs styles and animations available.';
  icon = 'pe-7s-phone icon-gradient bg-premium-dark';

  closeResult: string;

  constructor(private formBuilder: FormBuilder,
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
    this.newClientForm = this.formBuilder.group({
      telephone: ['', [Validators.required]],
      email: ['', []],
      prenom: ['', [Validators.required]],
      nom: ['', [Validators.required]],
      adresse: ['', [Validators.required]],
      adresse2: [''],
      ville: ['', [Validators.required]],
      pays: ['', [Validators.required]],
      zip: ['', []],
      photo: null
    });
  }

  onUploadFile(file: File) {
    this.loading = true;
    this.crudService.uploadFile(file).then(
        (url: string) => {
          this.fileUrl = url;
          this.loading = false;
          this.loaded = true;
        }
    );
  }
  detectFiles(event) {
    // this.onUploadFile(event.target.files[0]);
  }


  newClient() {
    const client = {
      telephone: this.newClientForm.get('telephone').value,
      email: this.newClientForm.get('email').value,
      prenom: this.newClientForm.get('prenom').value,
      nom: this.newClientForm.get('nom').value,
      adresse: this.newClientForm.get('adresse').value,
      adresse2: this.newClientForm.get('adresse2').value,
      ville: this.newClientForm.get('ville').value,
      pays: this.newClientForm.get('pays').value,
      zip: this.newClientForm.get('zip').value,
      photo: '',
      etat: 1,
      pwd_login: '123456',
      pwd_retrait: '123456'
    };
    this.crudService.addClient(client).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Nouveau client enregistré avec succès');
            this.newClientForm.reset();
          } else {
            this.modalService.open('L\'enregistrement a échoué');
          }
        }
    );
  }
}
