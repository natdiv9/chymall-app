import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {Router} from '@angular/router';

@Component({
  selector: 'app-clients-new',
  templateUrl: './clients-new.component.html',
  styleUrls: ['./clients-new.component.sass']
})
export class ClientsNewComponent implements OnInit {

  newClientForm: FormGroup;
  private fileUrl: string;
  private loaded: boolean;
  private loading: boolean;

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

  initForm() {
    this.newClientForm = this.formBuilder.group({
      telephone: ['', [Validators.required]],
      email: ['', []],
      prenom: ['', [Validators.required]],
      nom: ['', [Validators.required]],
      address: ['', [Validators.required]],
      address2: [''],
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
      address: this.newClientForm.get('address').value,
      address2: this.newClientForm.get('address2').value,
      ville: this.newClientForm.get('ville').value,
      pays: this.newClientForm.get('pays').value,
      zip: this.newClientForm.get('zip').value,
      photo: this.fileUrl,
      etat: true
    };

    console.log(client);

    this.crudService.addClient(client).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open(this.closeResult);
            console.log(client);
            this.newClientForm.reset();
          } else {
            this.router.navigate(['clients/new']);
          }
        }
    );
  }
}
