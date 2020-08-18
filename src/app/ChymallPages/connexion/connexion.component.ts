import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../ChymallServices/crud/crud.service';
import {Router} from '@angular/router';
import {AuthService} from '../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-connexion',
  templateUrl: './connexion.component.html',
  styleUrls: ['./connexion.component.sass']
})
export class ConnexionComponent implements OnInit {
  loginForm: FormGroup;
  message = '';
  isChargement = false;

  constructor(private formBuilder: FormBuilder,
              private authService: AuthService,
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

  connexion() {
    this.isChargement = true;
    const username = this.loginForm.get('username').value;
    const pwd = this.loginForm.get('pwd').value;

    this.authService.auth(username, pwd).subscribe(
        (reponse: any) => {
      if (reponse.status === true) {
        this.authService.currentUser = reponse.data;
        this.authService.connected = true;
        this.isChargement = false;
        if (this.authService.currentUser.service === 'adhesion') {
          this.router.navigate(['clients/new']);
        } else if (this.authService.currentUser.service === 'comptabilite') {
          this.router.navigate(['profiles/all']);
        } else if (this.authService.currentUser.service === 'retrait') {
          this.router.navigate(['retrait/new']);
        } else if (this.authService.currentUser.service === 'technique') {
          this.router.navigate(['retrait/new']);
        }
        // this.router.navigate(['/']);
      } else {
        this.isChargement = false;
        this.message = reponse.message;
      }
    },
        (error1 => {
          this.isChargement = false;
          this.message = 'Une erreur inconnue est survenue';
          console.log(error1);
        }));
  }
}
