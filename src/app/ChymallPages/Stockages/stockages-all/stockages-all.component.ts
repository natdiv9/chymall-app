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

  stockages: Stockage[] | any[] = [];
    chargement: boolean;
    message: string;

  constructor(private crudService: CrudService,
              private authService: AuthService) { }

  ngOnInit() {
    this.refresh();
  }

  refresh() {
      this.chargement = true;
      this.crudService.getStockages(this.authService.currentUser.username).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.chargement = false;
                    this.stockages = reponse.data;
                } else {
                    this.chargement = false;
                    this.message = 'Echec de recupération de données';
                    console.log(reponse.message);
                }
            }, (error => {
              this.message = 'Echec de recupération de données';
              console.log(error);
          })
        );
    }
}
