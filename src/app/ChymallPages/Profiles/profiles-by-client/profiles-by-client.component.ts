import {Component, OnInit} from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ActivatedRoute, Router} from '@angular/router';
import {Profile} from '../../../ChymallModels/models/profile';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
    selector: 'app-profiles-by-client',
    templateUrl: './profiles-by-client.component.html',
    styleUrls: ['./profiles-by-client.component.sass']
})
export class ProfilesByClientComponent implements OnInit {

    profiles: Profile[] = [];
    username = '';
    message: string;
  closeResult: string;
    source = ['Afghanistan', 'Czech Republic', 'Denmark', 'Djibouti', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore'];

    constructor(private crudService: CrudService,
                private authService: AuthService,
                private modalService: NgbModal,
                private router: Router,
                private route: ActivatedRoute) {
    }

    ngOnInit() {
        const id = this.route.snapshot.params.idclient;
        this.username = this.route.snapshot.params.username;
        this.crudService.getProfiles(this.authService.currentUser.username, id, true).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.profiles = reponse.data;
                } else {

                }
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
}
