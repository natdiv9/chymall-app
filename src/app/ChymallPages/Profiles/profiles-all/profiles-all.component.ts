import { Component, OnInit } from '@angular/core';
import {Profile} from '../../../ChymallModels/models/profile';
import { Subscription } from 'rxjs';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Router} from '@angular/router';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-profiles-all',
  templateUrl: './profiles-all.component.html',
  styleUrls: ['./profiles-all.component.sass']
})
export class ProfilesAllComponent implements OnInit {

  profiles: any[] = [];

  constructor(private crudService: CrudService,
              private authService: AuthService,
              private router: Router) { }

  ngOnInit() {
    this.crudService.getProfiles(this.authService.currentUser.username ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.profiles = reponse.data;
          } else {

          }
        }
    );
  }

}
