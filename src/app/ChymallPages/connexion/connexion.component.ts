import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../ChymallServices/crud/crud.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-connexion',
  templateUrl: './connexion.component.html',
  styleUrls: ['./connexion.component.sass']
})
export class ConnexionComponent implements OnInit {
  loginForm: FormGroup;
  message = '';

  constructor(private formBuilder: FormBuilder,
              private crudService: CrudService,
              private router: Router) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.loginForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      pwd : ['', [Validators.required]]
    });
  }

  newConnexion() {
    const username = this.loginForm.get('username').value;
    const pwd = this.loginForm.get('pwd').value;

    this.crudService.getConnection(username, pwd).subscribe(
        (reponse: any) => {
      if (reponse.status === true) {
        this.crudService.currentUser = reponse.data;
        if (this.crudService.currentUser.service === 'adhesion') {
          this.router.navigate(['clients/new']);
        } else if (this.crudService.currentUser.service === 'comptabilite') {
          this.router.navigate(['profiles/all']);
        } else if (this.crudService.currentUser.service === 'retrait') {
          this.router.navigate(['retrait/new']);
        } else if (this.crudService.currentUser.service === 'technique') {
          this.router.navigate(['retrait/new']);
        }
        this.router.navigate(['']);
      } else {
        this.message = 'Connexion impossible';
      }
    },
        (error1 => {
          this.message = 'Erreur inconnue';
        }));
  }
}
