import { Component, OnInit } from '@angular/core';
import {RetraitProduits} from '../../../ChymallModels/models/retrait-produits';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-retrait-produits-all',
  templateUrl: './retrait-produits-all.component.html',
  styleUrls: ['./retrait-produits-all.component.sass']
})
export class RetraitProduitsAllComponent implements OnInit {
    retraits: any[] = [];
    chargement: boolean;
    message: string;

  constructor(
      private crudService: CrudService,
      private authService: AuthService,
  ) { }

  ngOnInit() {
    this.refresh();
  }

    refresh() {
        this.chargement = true;
        this.crudService.getRetraitProduit(this.authService.currentUser.username).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.chargement = false;
                    this.retraits = reponse.data;
                } else {
                    this.chargement = false;
                    this.message = 'Echec de recupération de données';
                    console.log(reponse.message);
                }
            }, (error) => {
                this.message = 'Echec de recupération de données';
                console.log(error);
            });
    }
}
