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

  retraits: Retrait[] = [];

  constructor(private crudService: CrudService,
              private authService: AuthService) { }

  ngOnInit() {
    this.crudService.getRetraits(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.retraits = reponse.data;
          } else {
            this.retraits = null;
          }
        }
    );
  }

}
