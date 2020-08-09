import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-retraits-new',
  templateUrl: './retraits-new.component.html',
  styleUrls: ['./retraits-new.component.sass']
})
export class RetraitsNewComponent implements OnInit {
  newRetraitForm: FormGroup;
  closeResult: string;

  constructor(private  formBuilder: FormBuilder,
              private crudService: CrudService,
              private modalService: NgbModal,
              private router: Router,
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
      id_profile: this.route.snapshot.params.id,
      montant: this.newRetraitForm.get('montant').value,
      date_retrait: null
    };

    console.log(retrait);
    this.crudService.addRetrait(retrait).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open(this.closeResult);
            this.newRetraitForm.reset();
          } else {
            this.router.navigate(['profiles/new']);
          }
        }
    );
  }
}
