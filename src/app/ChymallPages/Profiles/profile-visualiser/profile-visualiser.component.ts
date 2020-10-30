import { Component, OnInit } from '@angular/core';
import {Profile} from '../../../ChymallModels/models/profile';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {Router} from '@angular/router';

@Component({
  selector: 'app-profile-visualiser',
  templateUrl: './profile-visualiser.component.html',
  styleUrls: ['./profile-visualiser.component.sass']
})
export class ProfileVisualiserComponent implements OnInit {

  profiles: any[] = [];
  message: string;
  closeResult: string;
  isSearchActive: any;
  chargement: boolean;
  selected_profile: Profile;

  constructor(private crudService: CrudService,
              private authService: AuthService,
              private modalService: NgbModal,
              private router: Router) {
  }

  ngOnInit() {
    this.refresh();
  }

  refresh() {
    this.chargement = true;
    this.crudService.getProfiles(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.chargement = false;
            this.profiles = reponse.data;
          } else {
            this.chargement = false;
            this.message = 'Echec de recupération de données';
            console.log(reponse.message);
          }
        }, (error) => {
          this.message = 'Echec de recupération de données';
          console.log(error);
        }
    );
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

  rechercher(value: HTMLInputElement, content: any) {
    if (value.value === '') {
      return;
    }
    const recherche = value.value;
    value.value = '';

    this.crudService.getProfilesByRecherche(
        this.authService.currentUser.username,
        recherche
    ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.profiles = reponse.data;
            console.log(reponse.data);
            if (reponse.data.length === 0) {
              this.message = 'Aucune information correspondante!';
              this.open(content);
            }
          } else {
            console.log(reponse.message);
          }
          // tslint:disable-next-line:no-shadowed-variable
        }, (error) => {
          console.log(error);
        }
    );
  }

}
