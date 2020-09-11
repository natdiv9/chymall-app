import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {ActivatedRoute, Router} from '@angular/router';
import {Profile} from '../../../ChymallModels/models/profile';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-profiles-update',
  templateUrl: './profiles-update.component.html',
  styleUrls: ['./profiles-update.component.sass']
})
export class ProfilesUpdateComponent implements OnInit {
  updateProfileForm: FormGroup;
  profile: Profile;
  closeResult: string;
  edit_profile_form: FormGroup;
  message: string;
  is_profile_loaded = false;

  constructor(private form_builder: FormBuilder,
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

  initForm() {
    const id = +this.route.snapshot.params.id;
    if (typeof id === 'number') {
      this.crudService.getProfiles(this.authService.currentUser.username, id).subscribe(
          (response: any) => {
            if (response.status === true) {
              this.profile = response.data[0];
              this.is_profile_loaded = true;
              this.edit_profile_form = this.form_builder.group({
                username: [this.profile.username],
                produit_adhesion: [this.profile.produit_adhesion],
                niveau_adhesion: [this.profile.niveau_adhesion],
                capital: [this.profile.capital],
                activation_compte: [this.profile.activation_compte],
                activation_trading: [this.profile.activation_trading],
                username_parain: [this.profile.username_parain],
                password: [this.profile.password]
              });
            } else {
              console.log(response);
            }
          }, (error => {console.log(error); })
      );
    }
  }

  editProfile(content_message: any) {
    this.profile.password = this.edit_profile_form.get('password').value;
    this.crudService.putProfile(Object.assign(
        this.profile,
        {
          auteur_operation: this.authService.currentUser.username
        }
    )).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Modification effectuée avec succès!';
            this.open(content_message);
            this.router.navigate(['/', 'profiles', 'technique']);
          } else {
            this.message = 'Echec de l\'opération!';
            this.open(content_message);
            console.log(reponse.message);
          }
        }, (error) => {
          this.message = 'Echec de l\'opération!';
          this.open(content_message);
          console.log(error);
        }
    );
  }
}
