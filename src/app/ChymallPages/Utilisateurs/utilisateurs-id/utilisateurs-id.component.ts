import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Utilisateur} from '../../../ChymallModels/models/utilisateur';

@Component({
  selector: 'app-utilisateurs-id',
  templateUrl: './utilisateurs-id.component.html',
  styleUrls: ['./utilisateurs-id.component.sass']
})
export class UtilisateursIdComponent implements OnInit {

  utilisateurs: Utilisateur[] = [];

  constructor(private route: ActivatedRoute,
              private crudService: CrudService) { }

  ngOnInit() {
    const id = this.route.snapshot.params.id;
    this.crudService.getUtilisateurs(id).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.utilisateurs = reponse.data;
          } else {
            this.utilisateurs = null;
          }
        }
    );
  }

}
