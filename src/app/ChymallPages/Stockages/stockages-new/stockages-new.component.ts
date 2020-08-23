import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-stockages-new',
  templateUrl: './stockages-new.component.html',
  styleUrls: ['./stockages-new.component.sass']
})
export class StockagesNewComponent implements OnInit {

  newStockageForm: FormGroup;
  closeResult: string;
  idproduit: number;

  constructor(private formBuilder: FormBuilder,
              private crudService: CrudService,
              private authService: AuthService,
              private router: Router,
              private modalService: NgbModal,
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.idproduit = +this.route.snapshot.params.idproduit;
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
    this.newStockageForm = this.formBuilder.group({
      quantite: ['', [Validators.required]]
    });
  }

  newStockage() {
    const stockage = {
      id_produit: +this.route.snapshot.params.idproduit,
      quantite: this.newStockageForm.get('quantite').value,
      auteur_operation: this.authService.currentUser.username
    };
    this.crudService.addStockage(stockage).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Stockage effectuéavec succès!');
            this.newStockageForm.reset();
          } else {
            this.modalService.open('Stockage a échoué');
            this.newStockageForm.reset();
          }
        }, (error) => {
          console.log(error);
    }
    );

  }
}
