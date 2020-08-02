import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Paiement} from '../../../ChymallModels/models/paiement';

@Component({
  selector: 'app-paiements-id',
  templateUrl: './paiements-id.component.html',
  styleUrls: ['./paiements-id.component.sass']
})
export class PaiementsIdComponent implements OnInit {

  paiements: Paiement[] = [];

  constructor(private route: ActivatedRoute,
              private crudService: CrudService) { }

  ngOnInit() {
    const id = this.route.snapshot.params.id;
    this.crudService.getPaiements(id).subscribe(
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
