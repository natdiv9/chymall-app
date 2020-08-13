import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-produits-new',
  templateUrl: './produits-new.component.html',
  styleUrls: ['./produits-new.component.sass']
})
export class ProduitsNewComponent implements OnInit {

  newProduitForm: FormGroup;
  closeResult: string;

  constructor(private  formBuilder: FormBuilder,
              private router: Router,
              private route: ActivatedRoute,
              private modalService: NgbModal,
              private crudService: CrudService) { }

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
    this.newProduitForm = this.formBuilder.group({
      designation: ['', [Validators.required]],
      stockInitial: ['', [Validators.required]]
    });
  }
  newProduit() {
    const produit = {
      designation: this.newProduitForm.get('designation').value,
      stock_initial: this.newProduitForm.get('stockInitial').value
    };

    this.crudService.addProduit(produit).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Produit enregistré avec succès!');
            this.newProduitForm.reset();
          } else {
            this.modalService.open('Enregistrement a échoué!');
          }
          console.log(reponse);
        }
    );
  }
}
