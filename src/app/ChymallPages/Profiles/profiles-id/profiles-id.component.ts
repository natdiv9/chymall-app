import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Profile} from '../../../ChymallModels/models/profile';

@Component({
  selector: 'app-profiles-id',
  templateUrl: './profiles-id.component.html',
  styleUrls: ['./profiles-id.component.sass']
})
export class ProfilesIdComponent implements OnInit {

  profiles: Profile[] = [];

  constructor(private route: ActivatedRoute,
              private crudService: CrudService) { }

  ngOnInit() {
    const id = this.route.snapshot.params.id;
    this.crudService.getProfiles(id).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.profiles = reponse.data;
          } else {

          }
        }
    );
  }

}
