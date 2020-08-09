import { Component, OnInit } from '@angular/core';
import {Produit} from '../../../ChymallModels/models/produit';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

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
              private modalService: NgbModal,
              private route: ActivatedRoute,
              private router: Router,
              private formBuilder: FormBuilder) { }

  ngOnInit() {
    this.crudService.getProduits().subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.produits = reponse.data;
          }
        }
    );
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
            this.modalService.open(this.closeResult);
            this.retraitProduitForm.reset();
          } else {
            this.router.navigate(['retrait-produits/new']);
          }
        }
    );
  }
}
