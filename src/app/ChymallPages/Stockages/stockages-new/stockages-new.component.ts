import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-stockages-new',
  templateUrl: './stockages-new.component.html',
  styleUrls: ['./stockages-new.component.sass']
})
export class StockagesNewComponent implements OnInit {

  newStockageForm: FormGroup;

  constructor(private formBuilder: FormBuilder) { }

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

  }
}
