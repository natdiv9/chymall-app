import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';

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

  constructor(private formBuilder: FormBuilder,
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

  }
}
