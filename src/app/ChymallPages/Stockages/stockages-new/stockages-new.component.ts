import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-stockages-new',
  templateUrl: './stockages-new.component.html',
  styleUrls: ['./stockages-new.component.sass']
})
export class StockagesNewComponent implements OnInit {

  newStockageForm: FormGroup;
  closeResult: string;

  constructor(private formBuilder: FormBuilder,
              private crudService: CrudService,
              private router: Router,
              private modalService: NgbModal,
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
    this.newStockageForm = this.formBuilder.group({
      operation: ['', [Validators.required]],
      quantite: ['', [Validators.required]]
    });
  }

  newStockage() {
    const stockage = {
      id_produit: this.route.snapshot.params.id,
      quantite: this.newStockageForm.get('quantite').value,
      operation: this.newStockageForm.get('operation').value,
      date_operation: null
    };
    this.crudService.addStockage(stockage).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('' + stockage.operation + 'effectuée' + 'avec succès.');
            this.newStockageForm.reset();
          } else {
            this.modalService.open('' + stockage.operation + 'a échoué' + '');
            this.newStockageForm.reset();
          }
        }
    );

  }
}
