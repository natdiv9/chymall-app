import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-retraits-new',
  templateUrl: './retraits-new.component.html',
  styleUrls: ['./retraits-new.component.sass']
})
export class RetraitsNewComponent implements OnInit {
  newRetraitForm: FormGroup;

  constructor(private  formBuilder: FormBuilder,
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newRetraitForm = this.formBuilder.group({
      montant: ['', [Validators.required]]
    });
  }

  newRetrait() {
    const retrait = {
      idProfile: this.route.snapshot.params.id,
      montant: this.newRetraitForm.get('montant').value,
      dateRetrait: null
    };
  }
}
