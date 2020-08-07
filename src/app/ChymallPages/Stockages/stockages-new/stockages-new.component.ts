import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

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

  initForm() {
    this.newStockageForm = this.formBuilder.group({
      operation: ['', [Validators.required]],
      quantite: ['', [Validators.required]]
    });
  }

  newStockage() {
    const stockage = {
      idProduit: this.route.snapshot.params.id,
      quantite: this.newStockageForm.get('quantite').value,
      operation: this.newStockageForm.get('operation').value,
      dateOperation: null
    };
    console.log(stockage);
    this.crudService.addStockage(stockage).subscribe(
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
