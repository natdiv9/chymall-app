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

  newCientForm: FormGroup;
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
    this.newCientForm = this.formBuilder.group({
      telephone: ['', [Validators.required]],
      email: [''],
      prenom: ['', [Validators.required]],
      address: ['', [Validators.required]],
      address2: [''],
      city: ['', [Validators.required]],
      state: ['', [Validators.required]],
      zip: [''],
      nom: ['', [Validators.required]],
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
    this.onUploadFile(event.target.files[0]);
  }


  newClient() {
    const client = {
      telephone: this.newCientForm.get('telephone').value,
      email: this.newCientForm.get('email').value,
      prenom: this.newCientForm.get('prenom').value,
      nom: this.newCientForm.get('nom').value,
      address: this.newCientForm.get('address').value,
      address2: this.newCientForm.get('address2').value,
      ville: this.newCientForm.get('ville').value,
      pays: this.newCientForm.get('pays').value,
      zip: this.newCientForm.get('zip').value,
      photo: this.fileUrl,
      etat: true
    };

    this.crudService.addClient(client).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open(this.closeResult);
            this.newCientForm.reset();
          } else {
            this.router.navigate(['clients/new']);
          }
        }
    );
  }
}
