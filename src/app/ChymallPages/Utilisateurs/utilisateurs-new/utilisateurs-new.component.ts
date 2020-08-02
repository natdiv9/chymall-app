import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-utilisateurs-new',
  templateUrl: './utilisateurs-new.component.html',
  styleUrls: ['./utilisateurs-new.component.sass']
})
export class UtilisateursNewComponent implements OnInit {

  newUserForm: FormGroup;

  constructor(private  formBuilder: FormBuilder) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newUserForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{6,}/)]],
      service: ['', [Validators.required]]
    });
  }

  newUser() {
    const utilisateur = {
      username: this.newUserForm.get('username').value,
      pwd: this.newUserForm.get('password').value,
      service: this.newUserForm.get('service').value,
      droits: null,
      etat: true
    };
  }
}
