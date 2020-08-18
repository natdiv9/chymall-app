import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Utilisateur} from '../../../ChymallModels/models/utilisateur';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-utilisateurs-all',
  templateUrl: './utilisateurs-all.component.html',
  styleUrls: ['./utilisateurs-all.component.sass']
})
export class UtilisateursAllComponent implements OnInit {

  utilisateurs: Utilisateur[] = [];

  constructor(private crudService: CrudService, private authService: AuthService) { }

  ngOnInit() {
    this.crudService.getUtilisateurs(this.authService.currentUser.username).subscribe(
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
