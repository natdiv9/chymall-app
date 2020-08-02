import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Produit} from '../../../ChymallModels/models/produit';

@Component({
  selector: 'app-produits-id',
  templateUrl: './produits-id.component.html',
  styleUrls: ['./produits-id.component.sass']
})
export class ProduitsIdComponent implements OnInit {

  produits: Produit[] = [];

  constructor(private route: ActivatedRoute,
              private crudService: CrudService) { }

  ngOnInit() {
    const id = this.route.snapshot.params.id;
    this.crudService.getProduits(id).subscribe(
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
