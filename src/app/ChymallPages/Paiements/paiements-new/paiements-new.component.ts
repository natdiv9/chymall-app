import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-paiements-new',
  templateUrl: './paiements-new.component.html',
  styleUrls: ['./paiements-new.component.sass']
})
export class PaiementsNewComponent implements OnInit {

  newPaiementForm: FormGroup;

  constructor(private formBuilder: FormBuilder) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newPaiementForm = this.formBuilder.group({
      motif: ['', [Validators.required]],
      montant: ['', [Validators.required]]
    });
  }
  newPaiement() {

  }

}
