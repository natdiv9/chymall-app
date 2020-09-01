import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Retrait} from '../../../ChymallModels/models/retrait';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-retraits-all',
  templateUrl: './retraits-all.component.html',
  styleUrls: ['./retraits-all.component.sass']
})
export class RetraitsAllComponent implements OnInit {

  retraits: any[] = [];
  chargement: boolean;
  message: string;
  synthese: any;

  constructor(private crudService: CrudService,
              private authService: AuthService) { }

  ngOnInit() {
      this.refresh();
  }

  getResume() {
      this.crudService.getResume(this.authService.currentUser.username).subscribe(
          (reponse: any) => {
              if (reponse.status === true) {
                  this.synthese = reponse.data[0];
              } else {
                  // this.message = 'Echec de recupération de données';
                  // console.log(reponse.message);
              }
          }, (error => {
              // this.message = 'Echec de recupération de données';
              // console.log(error);
          })
      );
  }
  refresh() {
      this.getResume();
      this.chargement = true;
      this.crudService.getRetraits(this.authService.currentUser.username).subscribe(
          (reponse: any) => {
              if (reponse.status === true) {
                  this.chargement = false;
                  this.retraits = reponse.data;
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
