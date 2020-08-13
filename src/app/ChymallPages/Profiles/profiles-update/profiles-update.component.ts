import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {ActivatedRoute, Router} from '@angular/router';
import {Profile} from '../../../ChymallModels/models/profile';

@Component({
  selector: 'app-profiles-update',
  templateUrl: './profiles-update.component.html',
  styleUrls: ['./profiles-update.component.sass']
})
export class ProfilesUpdateComponent implements OnInit {
  updateProfileForm: FormGroup;
  profile: Profile;
  closeResult: string;

  constructor(private formBuilder: FormBuilder,
              private crudService: CrudService,
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
  openLarge(content) {
    this.modalService.open(content, {
      size: 'lg'
    });
  }
  initForm() {
    const id = this.route.snapshot.params.id;
    this.crudService.getProfiles(id).subscribe(
        (response: any) => {
          if (response.status) {
            this.profile = response.data;
            this.updateProfileForm = this.formBuilder.group({
              idClient: this.profile.id_client,
              username: this.profile.username,
              produit: this.profile.produit,
              niveau: this.profile.niveau,
              etatTrading: this.profile.etat_trading,
              etatCompte: this.profile.etat_compte,
              etat: this.profile.etat
            });
          }
        }
    );
  }

  updateProfile() {
    const profile = {
      id_client: this.profile.id_client,
      username: this.updateProfileForm.get('username').value,
      produit: this.updateProfileForm.get('produit').value,
      niveau: this.updateProfileForm.get('niveau').value,
      etat_trading: this.profile.etat_trading,
      etat_compte: this.profile.etat_compte,
      etat: 1
    };

    this.crudService.putProfile(profile).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Modification effectuée avec succès!');
            this.updateProfileForm.reset();
          } else {
            this.modalService.open('Modification a échoué!');
            this.updateProfileForm.reset();
          }
        }
    );
  }
}
