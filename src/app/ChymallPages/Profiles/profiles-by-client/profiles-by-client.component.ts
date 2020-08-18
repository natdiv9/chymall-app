import { Component, OnInit } from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
  selector: 'app-profiles-by-client',
  templateUrl: './profiles-by-client.component.html',
  styleUrls: ['./profiles-by-client.component.sass']
})
export class ProfilesByClientComponent implements OnInit {

  profiles: any[] = [];
  username = '';

  constructor(private crudService: CrudService,
              private authService: AuthService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit() {
    const id = this.route.snapshot.params.idclient;
    this.username = this.route.snapshot.params.username;
    this.crudService.getProfiles(this.authService.currentUser.username, id, true).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.profiles = reponse.data;
          } else {

          }
        }
    );
  }
}
