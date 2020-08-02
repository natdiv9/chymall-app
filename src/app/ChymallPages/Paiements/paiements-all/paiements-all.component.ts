import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Paiement} from '../../../ChymallModels/models/paiement';

@Component({
  selector: 'app-paiements-all',
  templateUrl: './paiements-all.component.html',
  styleUrls: ['./paiements-all.component.sass']
})
export class PaiementsAllComponent implements OnInit {

  paiements: Paiement[] = [];

  constructor(private crudService: CrudService) { }

  ngOnInit() {
    this.crudService.getPaiements().subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.paiements = reponse.data;
          } else {
            this.paiements = null;
          }
        }
    );
  }

}
