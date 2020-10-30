import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-rapport-profile',
  templateUrl: './rapport-profile.component.html',
  styleUrls: ['./rapport-profile.component.sass']
})
export class RapportProfileComponent implements OnInit {
  chargement: boolean;
  synthese: any;
  private message: string;

  constructor(private crudService: CrudService, private authService: AuthService) { }

  ngOnInit() {
    this.refresh();
  }

  refresh() {
    this.chargement = true;
    this.crudService.getRapportProfileByDay(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.chargement = false;
            this.synthese = reponse.data[0];
          } else {
            this.chargement = false;
            this.message = 'Echec de recupération de données';
            console.log(reponse.message);
          }
        }, (error => {
          this.message = 'Echec de recupération de données';
          console.log(error);
        })
    );
  }

  changer_date(value: string) {
    this.chargement = true;
    this.crudService.getRapportProfileByDay(this.authService.currentUser.username, value).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.chargement = false;
            this.synthese = reponse.data[0];
          } else {
            this.chargement = false;
            this.message = 'Echec de recupération de données';
            console.log(reponse.message);
          }
        }, (error => {
          this.message = 'Echec de recupération de données';
          console.log(error);
        })
    );
  }
}
