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

  constructor(private formBuilder: FormBuilder,
              private crudService: CrudService,
              private authService: AuthService,
              private router: Router,
              private route: ActivatedRoute,
              private modalService: NgbModal) { }

  ngOnInit() {
    this.initForm();
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

  initForm() {
    this.id = this.route.snapshot.params.id;
    this.crudService.getUtilisateurs(
        this.authService.currentUser.username,
        +this.id
    ).subscribe(
        (response: any) => {
          if (response.status) {
            this.utilisateur = response.data;
            this.updateUserForm = this.formBuilder.group({
              username: this.utilisateur.username,
              pwd: this.utilisateur.pwd,
              service: this.utilisateur.service,
              droits: this.utilisateur.droits
            });
          }
        }
    );
  }

  updateUser() {
    const utilisateur = {
      username: this.updateUserForm.get('username').value,
      pwd: this.updateUserForm.get('password').value,
      service: this.updateUserForm.get('service').value,
      droits: null,
      etat: 1
    };
    this.crudService.putUtilisateur(utilisateur).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Modification effectuée avec succès.');
            this.router.navigate(['utilisateurs/all']);
          } else {
            this.modalService.open('Echec de modification.');
          }
        }
    );

  }
}
