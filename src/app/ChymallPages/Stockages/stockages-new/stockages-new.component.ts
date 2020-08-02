import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-stockages-new',
  templateUrl: './stockages-new.component.html',
  styleUrls: ['./stockages-new.component.sass']
})
export class StockagesNewComponent implements OnInit {

  newStockageForm: FormGroup;

  constructor(private formBuilder: FormBuilder,
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newStockageForm = this.formBuilder.group({
      operation: ['', [Validators.required]],
      quantite: ['', [Validators.required]]
    });
  }

  newStockage() {
    const stockage = {
      idProduit: this.route.snapshot.params.id,
      quantite: this.newStockageForm.get('quantite').value,
      operation: this.newStockageForm.get('operation').value,
      dateOperation: null
    };
  }
}
