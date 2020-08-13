import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

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

  open(content) {
    this.modalService.open(content,
        {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult =
          `Dismissed ${this.getDismissReason(reason)}`;
    });
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }
  openLarge(content) {
    this.modalService.open(content, {
      size: 'lg'
    });
  }

  initForm() {
    this.newRetraitForm = this.formBuilder.group({
      montant: ['', [Validators.required]]
    });
  }

  newRetrait() {
    const retrait = {
      id_profile: 1,
      montant: this.newRetraitForm.get('montant').value,
      date_retrait: null
    };

    console.log(retrait);
    this.crudService.addRetrait(retrait).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Retrait effectué avec succès.');
            this.newRetraitForm.reset();
          } else {
            this.modalService.open('Retrait a échoué.');
            this.newRetraitForm.reset();
          }
        }
    );
  }
}
