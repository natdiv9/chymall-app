import { Component, OnInit } from '@angular/core';
import {Stockage} from '../../../ChymallModels/models/stockage';
import {ActivatedRoute, Router} from '@angular/router';
import {FormBuilder, FormGroup} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-stockages-update',
  templateUrl: './stockages-update.component.html',
  styleUrls: ['./stockages-update.component.sass']
})
export class StockagesUpdateComponent implements OnInit {

  stockage: Stockage;
  updateStockageForm: FormGroup;
  closeResult: string;

  constructor(private route: ActivatedRoute,
              private modalService: NgbModal,
              private router: Router,
              private formBuilder: FormBuilder,
              private crudService: CrudService) { }

  ngOnInit() {
  }

  initForm() {
    const id = this.route.snapshot.params.id;
    this.crudService.getStockages(id).subscribe(
        (response: any) => {
          if (response.status) {
            this.stockage = response.data;
            this.updateStockageForm = this.formBuilder.group({
              operation: this.stockage.operation,
              quantite: this.stockage.operation
            });
          }
        }
    );
  }

  updateStockage() {
    const stockage = {
      idProduit: this.stockage.idProduit,
      quantite: this.updateStockageForm.get('quantite').value,
      operation: this.updateStockageForm.get('operation').value,
      dateOperation: null
    };

    this.crudService.putStockage(stockage).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open(this.closeResult);
          } else {
            this.router.navigate(['stockages/all']);
          }
        }
    );

  }
}
