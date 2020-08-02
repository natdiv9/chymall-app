import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Retrait} from '../../../ChymallModels/models/retrait';

@Component({
  selector: 'app-retraits-id',
  templateUrl: './retraits-id.component.html',
  styleUrls: ['./retraits-id.component.sass']
})
export class RetraitsIdComponent implements OnInit {

  retraits: Retrait[] = [];

  constructor(private route: ActivatedRoute,
              private crudService: CrudService) { }

  ngOnInit() {
    const id = this.route.snapshot.params.id;
    this.crudService.getRetraits(id).subscribe(
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
