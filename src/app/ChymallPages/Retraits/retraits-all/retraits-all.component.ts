import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Retrait} from '../../../ChymallModels/models/retrait';

@Component({
  selector: 'app-retraits-all',
  templateUrl: './retraits-all.component.html',
  styleUrls: ['./retraits-all.component.sass']
})
export class RetraitsAllComponent implements OnInit {

  retraits: Retrait[] = [];

  constructor(private crudService: CrudService) { }

  ngOnInit() {
    this.crudService.getRetraits().subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.retraits = reponse.data;
          } else {
            this.retraits = null;
          }
        }
    );
  }

}