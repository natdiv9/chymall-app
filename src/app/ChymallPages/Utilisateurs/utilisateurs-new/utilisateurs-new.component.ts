import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Router} from '@angular/router';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-utilisateurs-new',
  templateUrl: './utilisateurs-new.component.html',
  styleUrls: ['./utilisateurs-new.component.sass']
})
export class UtilisateursNewComponent implements OnInit {

  newUserForm: FormGroup;
  private closeResult: string;

  constructor(private  formBuilder: FormBuilder,
              private router: Router,
              private modalService: NgbModal,
              private crudService: CrudService) { }

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
      username: ['', [Validators.required]],
      password: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{6,}/)]],
      service: ['', [Validators.required]]
    });
  }

  newUser() {
    const utilisateur = {
      username: this.newUserForm.get('username').value,
      pwd: this.newUserForm.get('password').value,
      service: this.newUserForm.get('service').value,
      droits: null,
      etat: 1
    };
    this.crudService.addUtilisateur(utilisateur).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Utilisateur enregistré avec succès.');
            this.router.navigate(['utilisateurs/all']);
          } else {
            this.modalService.open('Echec d\'enregistrement.');
          }
        }
    );
  }
}
