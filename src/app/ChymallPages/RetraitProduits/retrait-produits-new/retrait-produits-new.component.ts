import { Component, OnInit } from '@angular/core';
import {Produit} from '../../../ChymallModels/models/produit';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-retrait-produits-new',
  templateUrl: './retrait-produits-new.component.html',
  styleUrls: ['./retrait-produits-new.component.sass']
})
export class RetraitProduitsNewComponent implements OnInit {

  produits: Produit[] = [];
  retraitProduitForm: FormGroup;
  closeResult: string;

  constructor(private crudService: CrudService,
              private authService: AuthService,
              private modalService: NgbModal,
              private route: ActivatedRoute,
              private router: Router,
              private formBuilder: FormBuilder) { }

  ngOnInit() {
    this.crudService.getProduits(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.produits = reponse.data;
          }
        }
    );
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
    this.retraitProduitForm = this.formBuilder.group({
      designation: ['', [Validators.required]],
      quantite: ['', [Validators.required, Validators.min(1)]]
    });
  }

  newRetraitProduit() {

    const retrait_produit = {
      id_profile: this.route.snapshot.params.id,
      id_produit: this.retraitProduitForm.get('produit').value,
      quantite: this.retraitProduitForm.get('quantite').value,
      date_retrait: null
    };

    this.crudService.retraitProduit(retrait_produit).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Produit retiré avec succès.');
            this.retraitProduitForm.reset();
          } else {
            this.modalService.open('Retrait impossible.');
            this.retraitProduitForm.reset();
          }
        }
    );
  }
}
