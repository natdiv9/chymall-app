import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-paiements-new',
  templateUrl: './paiements-new.component.html',
  styleUrls: ['./paiements-new.component.sass']
})
export class PaiementsNewComponent implements OnInit {

  newPaiementForm: FormGroup;
  closeResult: string;

  constructor(private formBuilder: FormBuilder,
              private router: Router,
              private modalService: NgbModal,
              private crudService: CrudService,
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

    this.crudService.addPaiement(paiement).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open(this.closeResult);
            this.newPaiementForm.reset();
          } else {
            this.router.navigate(['paiements/all']);
          }
        }
    );

  }

}
