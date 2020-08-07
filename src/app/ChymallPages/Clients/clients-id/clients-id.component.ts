import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Client} from '../../../ChymallModels/models/client';

@Component({
  selector: 'app-clients-id',
  templateUrl: './clients-id.component.html',
  styleUrls: ['./clients-id.component.sass']
})
export class ClientsIdComponent implements OnInit {

  clients: Client[] = [];

  constructor(private route: ActivatedRoute,
              private crudService: CrudService) { }

  ngOnInit() {
    const id = this.route.snapshot.params.id;
    this.crudService.getClients(id).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.clients = reponse.data;
          } else {

          }
        }
    );
  }

}
