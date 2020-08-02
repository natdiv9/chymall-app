import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-paiements-new',
  templateUrl: './paiements-new.component.html',
  styleUrls: ['./paiements-new.component.sass']
})
export class PaiementsNewComponent implements OnInit {

  newPaiementForm: FormGroup;

  constructor(private formBuilder: FormBuilder,
              private route: ActivatedRoute) { }

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
    const paiement = {
       idProfile: this.route.snapshot.params.id,
       montant: this.newPaiementForm.get('montant').value,
       motif: this.newPaiementForm.get('motif').value,
       dateOperation: null
    };

  }

}
