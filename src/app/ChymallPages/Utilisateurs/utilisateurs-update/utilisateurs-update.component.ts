import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ActivatedRoute, Router} from '@angular/router';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {Utilisateur} from '../../../ChymallModels/models/utilisateur';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-utilisateurs-update',
  templateUrl: './utilisateurs-update.component.html',
  styleUrls: ['./utilisateurs-update.component.sass']
})
export class UtilisateursUpdateComponent implements OnInit {
  updateUserForm: FormGroup;
  utilisateur: Utilisateur;
  private closeResult: string;
  id: string;
  message: string;
  chargement: boolean;

  constructor(private formBuilder: FormBuilder,
              private crudService: CrudService,
              public authService: AuthService,
              private router: Router,
              private route: ActivatedRoute,
              private modalService: NgbModal) { }

  ngOnInit() {
    this.refresh();
  }

  open(content) {
    this.modalService.open(content,
        {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  openLarge(content) {
    this.modalService.open(content, {
      size: 'lg'
    });
  }

  refresh() {
    this.chargement = true;
    this.id = this.route.snapshot.params.id;
    this.crudService.getUtilisateurs(
        this.authService.currentUser.username,
        +this.id
    ).subscribe(
        (response: any) => {
          if (response.status) {
            this.utilisateur = response.data[0];
            this.chargement = false;
            this.updateUserForm = this.formBuilder.group({
              username: this.utilisateur.username,
              password: this.utilisateur.pwd,
              service: this.utilisateur.service,
              type_user: this.utilisateur.type_user,
              nom: this.utilisateur.nom,
              prenom: this.utilisateur.prenom,
              telephone: this.utilisateur.telephone,
              bureau: this.utilisateur.bureau,
            });
          }
        }
    );
  }

  updateUser(content: any) {
    const utilisateur = {
      username: this.updateUserForm.get('username').value,
      pwd: this.updateUserForm.get('password').value,
      service: this.updateUserForm.get('service').value,
      type_user: this.updateUserForm.get('type_user').value,
      nom: this.updateUserForm.get('nom').value,
      prenom: this.updateUserForm.get('prenom').value,
      telephone: this.updateUserForm.get('telephone').value,
      bureau: this.updateUserForm.get('bureau').value,
      auteur_operation: this.authService.currentUser.username,
      etat: this.utilisateur.etat,
      id: this.utilisateur.id
    };
    this.crudService.putUtilisateur(utilisateur).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Utilisateur enregistré avec succès!';
            this.open(content);
            this.updateUserForm.reset();
          } else {
            this.message = 'Echec de l\'enregistrement!';
            this.open(content);
            console.log(reponse.message);
          }
        },
        (error => {
          this.message = 'Echec de l\'enregistrement!';
          this.open(content);
          console.log(error);
        })
    );

  }
}
