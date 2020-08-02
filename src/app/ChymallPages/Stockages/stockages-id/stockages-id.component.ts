import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Stockage} from '../../../ChymallModels/models/stockage';

@Component({
  selector: 'app-stockages-id',
  templateUrl: './stockages-id.component.html',
  styleUrls: ['./stockages-id.component.sass']
})
export class StockagesIdComponent implements OnInit {

  stockages: Stockage[] = [];

  constructor(private route: ActivatedRoute,
              private crudService: CrudService) { }

  ngOnInit() {
    const id = this.route.snapshot.params.id;
    this.crudService.getStockages(id).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.stockages = reponse.data;
          } else {
            this.stockages = null;
          }
        }
    );
  }

}
