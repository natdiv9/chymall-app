import { Component, OnInit } from '@angular/core';
import {Color} from 'ng2-charts/ng2-charts';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-analytics',
  templateUrl: './analytics.component.html',
})
export class AnalyticsComponent implements OnInit {

  heading = 'Page de synthèse';
  subheading = 'Vue d\'ensemble sur toutes les activités recentes';
  icon = 'pe-7s-filter icon-gradient bg-warm-flame';
  chargement: boolean;
  message: string;
  synthese: any;

  constructor(private crudService: CrudService, private authService: AuthService) {
  }

  ngOnInit() {
    this.refresh();
  }

  refresh() {
    this.chargement = true;
    this.crudService.getResume(this.authService.currentUser.username).subscribe(
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
