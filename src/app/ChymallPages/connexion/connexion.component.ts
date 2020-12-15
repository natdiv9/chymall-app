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
  chargement: boolean;

  constructor(private formBuilder: FormBuilder,
              private authService: AuthService,
              private router: Router) { }

  ngOnInit() {
    this.chargement = false;
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
    this.chargement = true;
    const username = this.loginForm.get('username').value;
    const pwd = this.loginForm.get('pwd').value;

    this.authService.auth(username, pwd).subscribe(
        (reponse: any) => {
      if (reponse.status === true) {
        this.authService.currentUser = reponse.data;
        this.authService.connected = true;
        this.isChargement = false;
        this.chargement = false;
        if (this.authService.currentUser.service === 'adhesion') {
          this.router.navigate(['/', 'clients', 'all']);
        } else if (this.authService.currentUser.service === 'comptabilite') {
          this.router.navigate(['/', 'retraits', 'new']);
        } else if (this.authService.currentUser.service === 'retrait') {
          this.router.navigate(['/', 'retrait-produits', 'all']);
        } else if (this.authService.currentUser.service === 'technique') {
          this.router.navigate(['/profiles/completer']);
        } else if (this.authService.currentUser.service === 'transfert') {
          this.router.navigate(['/', 'retraits', 'demande', 'new']);
        } else if (this.authService.currentUser.service === 'admin') {
          this.router.navigate(['/']);
        } else if (this.authService.currentUser.service === 'profile-enligne') {
          this.router.navigate(['/', 'profiles', 'enligne']);
        } else {
          this.router.navigate(['/connexion']);
          console.log(this.authService.currentUser.service);
        }
      } else {
        this.isChargement = false;
        this.chargement = false;
        this.message = reponse.message;
        console.log(reponse.message);
      }
    },
        (error1 => {
          this.isChargement = false;
          this.message = 'Une erreur inconnue est survenue';
        }));
  }
}
