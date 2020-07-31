import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-produits-new',
  templateUrl: './produits-new.component.html',
  styleUrls: ['./produits-new.component.sass']
})
export class ProduitsNewComponent implements OnInit {

  newProduitForm: FormGroup;

  constructor(private  formBuilder: FormBuilder) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newProduitForm = this.formBuilder.group({
      designation: ['', [Validators.required]],
      quantite: ['', [Validators.required]]
    });
  }
  newProduit() {

  }
}
