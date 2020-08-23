import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-produits-new',
  templateUrl: './produits-new.component.html',
  styleUrls: ['./produits-new.component.sass']
})
export class ProduitsNewComponent implements OnInit {

  newProduitForm: FormGroup;
  closeResult: string;
  private message: string;

  constructor(private  formBuilder: FormBuilder,
              private router: Router,
              private modalService: NgbModal,
              private crudService: CrudService,
              private authService: AuthService) { }

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

  initForm() {
    this.newProduitForm = this.formBuilder.group({
      designation: ['', [Validators.required]],
      quantite: [0, [Validators.required, Validators.min(0)]],
      pacts: ['', [Validators.required]]
    });
  }
  newProduit(content: any) {
    const produit = {
      designation: this.newProduitForm.get('designation').value,
      stock_initial: this.newProduitForm.get('quantite').value,
      stock_final: this.newProduitForm.get('quantite').value,
      pacts: this.newProduitForm.get('pacts').value,
      auteur_operation: this.authService.currentUser.username
    };

    this.crudService.addProduit(produit).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Produit enregistré avec succès!';
            this.open(content);
            this.newProduitForm.reset();
          } else {
            this.message = 'Enregistrement a échoué!';
            console.log(reponse.message);
            this.open(content);
          }
        },
        (error => {
          this.message = 'Enregistrement a échoué!';
          this.open(content);
          console.log(error);
        })
    );
  }
}
