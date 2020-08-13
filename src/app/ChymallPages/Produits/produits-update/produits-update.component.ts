import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Produit} from '../../../ChymallModels/models/produit';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-produits-update',
  templateUrl: './produits-update.component.html',
  styleUrls: ['./produits-update.component.sass']
})
export class ProduitsUpdateComponent implements OnInit {
  updateProduitForm: FormGroup;
  produit: Produit;
  closeResult: string;

  constructor(private route: ActivatedRoute,
              private crudService: CrudService,
              private router: Router,
              private modalService: NgbModal,
              private formBuilder: FormBuilder) { }

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
    const id = this.route.snapshot.params.id;
    this.crudService.getProduits(id).subscribe(
        (response: any) => {
          if (response.status) {
            this.produit = response.data;
            this.updateProduitForm = this.formBuilder.group({
              designation: this.produit.designation,
              quantite: this.produit.stock_initial
            });
          }
        }
    );
  }

  updateProduit() {
    const produit = {
      designation: this.updateProduitForm.get('designation').value,
      stock_initial: this.updateProduitForm.get('quantite').value
    };
    this.crudService.putProduit(produit).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Modification effectuée avec succès!');
            this.updateProduitForm.reset();
          } else {
            this.router.navigate(['Modification a échoué!']);
          }
        }
    );

  }
}
