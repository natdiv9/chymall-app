import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Produit} from '../../../ChymallModels/models/produit';

@Component({
  selector: 'app-produits-all',
  templateUrl: './produits-all.component.html',
  styleUrls: ['./produits-all.component.sass']
})
export class ProduitsAllComponent implements OnInit {

  produits: Produit[] = [];

  constructor(private crudService: CrudService) { }

  ngOnInit() {
    this.crudService.getProduits().subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.produits = reponse.data;
          } else {
            this.produits = null;
          }
        }
    );
  }

}
