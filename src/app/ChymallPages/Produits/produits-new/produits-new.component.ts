import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

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

  initForm() {
    this.newProduitForm = this.formBuilder.group({
      designation: ['', [Validators.required]],
      quantite: ['', [Validators.required]]
    });
  }
  newProduit() {
    const produit = {
      designation: this.newProduitForm.get('designation').value,
      stockInitial: this.newProduitForm.get('quantite').value
    };

    this.crudService.addProduit(produit).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open(this.closeResult);
            this.newProduitForm.reset();
          } else {
            this.router.navigate(['clients/new']);
          }
        }
    );
  }
}
