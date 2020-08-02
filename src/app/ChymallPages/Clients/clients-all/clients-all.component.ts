import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Client} from '../../../ChymallModels/models/client';

@Component({
  selector: 'app-clients-all',
  templateUrl: './clients-all.component.html',
  styleUrls: ['./clients-all.component.sass']
})
export class ClientsAllComponent implements OnInit {

  clients: Client[] = [];

  constructor(private crudService: CrudService) { }

  ngOnInit() {
    this.crudService.getClients().subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.clients = reponse.data;
          } else {

          }
        }
    );
  }

}
