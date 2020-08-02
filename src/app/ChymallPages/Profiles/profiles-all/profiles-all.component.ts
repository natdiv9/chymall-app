import { Component, OnInit } from '@angular/core';
import {Profile} from '../../../ChymallModels/models/profile';
import { Subscription } from 'rxjs';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-profiles-all',
  templateUrl: './profiles-all.component.html',
  styleUrls: ['./profiles-all.component.sass']
})
export class ProfilesAllComponent implements OnInit {

  profiles: Profile[] = [];

  constructor(private crudService: CrudService,
              private router: Router) { }

  ngOnInit() {
    this.crudService.getProfiles().subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.profiles = reponse.data;
          } else {

          }
        }
    );
  }

}
