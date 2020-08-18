import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Stockage} from '../../../ChymallModels/models/stockage';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-stockages-all',
  templateUrl: './stockages-all.component.html',
  styleUrls: ['./stockages-all.component.sass']
})
export class StockagesAllComponent implements OnInit {

  stockages: Stockage[] = [];

  constructor(private crudService: CrudService,
              private authService: AuthService) { }

  ngOnInit() {
    this.crudService.getStockages(this.authService.currentUser.username).subscribe(
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
