import { Component, OnInit } from '@angular/core';
import {Profile} from '../../../ChymallModels/models/profile';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
  selector: 'app-profile-visualiser-by-client',
  templateUrl: './profile-visualiser-by-client.component.html',
  styleUrls: ['./profile-visualiser-by-client.component.sass']
})
export class ProfileVisualiserByClientComponent implements OnInit {


  profiles: any[] = [];
  username = '';
  message: string;
  closeResult: string;
  chargement: boolean;
  selected_profile: Profile;
  to_be_deleted_id: string;

  constructor(private crudService: CrudService,
              private authService: AuthService,
              private modalService: NgbModal,
              private router: Router,
              private route: ActivatedRoute) {
  }

  ngOnInit() {
    this.refresh();
  }

  refresh() {
    this.chargement = true;
    const id = this.route.snapshot.params.idclient;
    this.username = this.route.snapshot.params.username;
    this.crudService.getProfiles(
        this.authService.currentUser.username,
        id,
        true
    ).subscribe(
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

  demande_validation(supprimer_client: any, id: string) {
    this.to_be_deleted_id = id;
    this.open(supprimer_client);
  }

  supprimer(content: any, c: any) {
    this.crudService.deleteProfile(this.authService.currentUser.username, this.to_be_deleted_id).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Suppression effectuée avec succès!';
            this.open(content);
            // this.router.navigate(['/', 'profiles', 'visualiser']);
            this.refresh();
          } else {
            this.message = 'La suppression a echoué!';
            this.open(content);
          }
        }
    );
  }
}
