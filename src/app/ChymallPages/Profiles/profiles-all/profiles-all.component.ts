import { Component, OnInit } from '@angular/core';
import {Profile} from '../../../ChymallModels/models/profile';
import { Subscription } from 'rxjs';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Router} from '@angular/router';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-profiles-all',
  templateUrl: './profiles-all.component.html',
  styleUrls: ['./profiles-all.component.sass']
})
export class ProfilesAllComponent implements OnInit {

  profiles: Profile[] = [];
    message: string;
    closeResult: string;

  constructor(private crudService: CrudService,
              private authService: AuthService,
              private modalService: NgbModal,
              private router: Router) { }

  ngOnInit() {
    this.crudService.getProfiles(this.authService.currentUser.username ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.profiles = reponse.data;
          } else {
              this.message = 'Echec de recupération de données';
          }
        }
    );
  }

    activer_trading(profile: Profile, content: any) {
        profile.etat_trading = 1;
        this.crudService.putProfile(Object.assign(
            profile,
            {auteur_operation: this.authService.currentUser.username}
        )).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.message = 'Activation du trading effectuée avec succès!';
                    this.open(content);
                } else {
                    this.message = 'Echec d\'activation du trading!';
                    this.open(content);
                    console.log(reponse.message);
                }
            },
            (error) => {
                this.message = 'Echec d\'activation du trading!';
                this.open(content);
                console.log(error);
            }
        );
    }

    activer_compte(profile: Profile, content: any) {
        profile.etat_activation = 1;
        this.crudService.putProfile(Object.assign(
            profile,
            {auteur_operation: this.authService.currentUser.username}
        )).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.message = 'Activation du compte effectuée avec succès!';
                    this.open(content);
                } else {
                    this.message = 'Echec d\'activation du compte!';
                    this.open(content);
                    console.log(reponse.message);
                }
            },
            (error) => {
                this.message = 'Echec d\'activation du compte!';
                this.open(content);
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

}
