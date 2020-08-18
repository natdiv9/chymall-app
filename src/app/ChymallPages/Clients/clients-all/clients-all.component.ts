import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Client} from '../../../ChymallModels/models/client';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-clients-all',
  templateUrl: './clients-all.component.html',
  styleUrls: ['./clients-all.component.sass']
})
export class ClientsAllComponent implements OnInit {

  clients: Client[] = [];
  message = '';

  constructor(private crudService: CrudService, private authService: AuthService) { }

  ngOnInit() {
    this.crudService.getClients(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.clients = reponse.data;
          } else {
          }
          this.message = 'Aucune information disponible';
          console.log(reponse);
        }
    );
  }

}
