import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Router} from '@angular/router';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-utilisateurs-new',
  templateUrl: './utilisateurs-new.component.html',
  styleUrls: ['./utilisateurs-new.component.sass']
})
export class UtilisateursNewComponent implements OnInit {

  newUserForm: FormGroup;
  private closeResult: string;
  private message: string;

  constructor(private  formBuilder: FormBuilder,
              private router: Router,
              private modalService: NgbModal,
              private crudService: CrudService,
              public authService: AuthService) { }

  ngOnInit() {
    this.initForm();
  }


  open(content) {
    this.modalService.open(content,
        {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult =
          `Dismissed ${this.getDismissReason(reason)}`;
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


  initForm() {
    this.newUserForm = this.formBuilder.group({
      username: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{6,}/)]],
      password: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{6,}/)]],
      service: ['', [Validators.required]],
      type_user: ['', [Validators.required]],
      nom: ['', [Validators.required]],
      prenom: ['', [Validators.required]],
      telephone: ['', [Validators.pattern(/[0-9]{9,}/)]],
      bureau: ['', [Validators.required]]
    });
  }

  newUser(content: any) {
    const utilisateur = {
      username: this.newUserForm.get('username').value,
      pwd: this.newUserForm.get('password').value,
      service: this.newUserForm.get('service').value,
      type_user: this.newUserForm.get('type_user').value,
      nom: this.newUserForm.get('nom').value,
      prenom: this.newUserForm.get('prenom').value,
      telephone: this.newUserForm.get('telephone').value,
      bureau: this.newUserForm.get('bureau').value,
      auteur_operation: this.authService.currentUser.username
    };
    this.crudService.addUtilisateur(utilisateur).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Utilisateur enregistré avec succès!';
            this.open(content);
            this.newUserForm.reset();
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
