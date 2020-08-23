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

  constructor(
      private crudService: CrudService,
      private authService: AuthService,
  ) { }

  ngOnInit() {
    this.crudService.getRetraitProduit(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.retraits = reponse.data;
          } else {
              console.log(reponse.message);
          }
        }, (error) => {
          console.log(error);
        });
  }

}
