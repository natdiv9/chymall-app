import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ActivatedRoute, Router} from '@angular/router';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {Utilisateur} from '../../../ChymallModels/models/utilisateur';

@Component({
  selector: 'app-utilisateurs-update',
  templateUrl: './utilisateurs-update.component.html',
  styleUrls: ['./utilisateurs-update.component.sass']
})
export class UtilisateursUpdateComponent implements OnInit {
  updateUserForm: FormGroup;
  utilisateur: Utilisateur;

  constructor(private formBuilder: FormBuilder,
              private crudService: CrudService,
              private router: Router,
              private route: ActivatedRoute,
              private modalService: NgbModal) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    const id = this.route.snapshot.params.id;
    this.crudService.getUtilisateurs(id).subscribe(
        (response: any) => {
          if (response.status) {
            this.utilisateur = response.data;
            this.updateUserForm = this.formBuilder.group({
              username: this.utilisateur.username,
              pwd: this.utilisateur.pwd,
              service: this.utilisateur.service
            });
          }
        }
    );
  }

  updateUser() {

  }
}
