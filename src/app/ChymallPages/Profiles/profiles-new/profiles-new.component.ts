import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-profiles-new',
  templateUrl: './profiles-new.component.html',
  styleUrls: ['./profiles-new.component.sass']
})
export class ProfilesNewComponent implements OnInit {

  newProfileForm: FormGroup;

  constructor(private  formBuilder: FormBuilder) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newProfileForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      produit: ['', [Validators.required]],
      niveau: ['', [Validators.required]]
    });
  }

  newProfile() {

  }
}
