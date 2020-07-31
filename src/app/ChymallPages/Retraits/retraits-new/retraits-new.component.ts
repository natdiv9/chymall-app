import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-retraits-new',
  templateUrl: './retraits-new.component.html',
  styleUrls: ['./retraits-new.component.sass']
})
export class RetraitsNewComponent implements OnInit {
  newRetraitForm: FormGroup;

  constructor(private  formBuilder: FormBuilder) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newRetraitForm = this.formBuilder.group({
      montant: ['', [Validators.required]]
    });
  }

  newRetrait() {

  }
}
