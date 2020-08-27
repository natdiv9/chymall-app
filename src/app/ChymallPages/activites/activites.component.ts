import { Component, OnInit } from '@angular/core';
import {Color} from 'ng2-charts';
import {CrudService} from '../../ChymallServices/crud/crud.service';

@Component({
  selector: 'app-activites',
  templateUrl: './activites.component.html',
  styleUrls: ['./activites.component.sass']
})
export class ActivitesComponent implements OnInit {

  operations: any[] = [];
    chargement: boolean;

  constructor(private crudService: CrudService) {
  }

  ngOnInit() {
    this.refresh();
  }

  refresh() {
      this.chargement = true;
      this.crudService.getOperations()
          .subscribe((reponse: any) => {
              if (reponse.status === true) {
                  this.chargement = false;
                  this.operations = reponse.data;
              } else {
                  console.log(reponse.message);
              }
          }, (error => {
              console.log();
          }));
  }

}
