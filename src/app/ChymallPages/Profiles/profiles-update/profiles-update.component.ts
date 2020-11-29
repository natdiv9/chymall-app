import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {ActivatedRoute, Router} from '@angular/router';
import {Profile} from '../../../ChymallModels/models/profile';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {Produit} from '../../../ChymallModels/models/produit';

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
    is_profile_loaded = false;

    /*
    username: string;
    cout_total = 0;
    cout_trading = 0;
    ct_inscription = 0;
    trading_state = 0;
    produits: Produit[] = [];
    chargement: boolean;
    all_pacts: any[] = [];
    produits_by_pact: Produit[] = [];

    constructor(private form_builder: FormBuilder,
                private crudService: CrudService,
                private authService: AuthService,
                private router: Router,
                private route: ActivatedRoute,
                private modalService: NgbModal) { }

    ngOnInit() {
      this.get_pacts();
      this.crudService.getProduits(this.authService.currentUser.username).subscribe(
          (reponse: any) => {
            if (reponse.status === true) {
              this.produits = reponse.data;
            }
          }
      );
      this.initForm();
    }

    get_pacts() {
      this.chargement = true;
      this.crudService.getPacts(this.authService.currentUser.username).subscribe(
          (reponse: any) => {
            if (reponse.status === true) {
              this.all_pacts = reponse.data;
              this.chargement = false;
            } else {
              this.chargement = false;
              console.log(reponse.message);
            }
          }, (error) => {
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
                  password_parain: [this.profile.password_parain],
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
      this.profile.username = this.edit_profile_form.get('username').value;
      this.profile.username_parain = this.edit_profile_form.get('username_parain').value;
      this.profile.password_parain = this.edit_profile_form.get('password_parain').value;
      this.profile.password = this.edit_profile_form.get('password').value;
      this.profile.niveau_adhesion = this.edit_profile_form.get('niveau_adhesion').value;
      this.profile.produit_trading = this.edit_profile_form.get('produit_adhesion').value;
      this.profile.produit_adhesion = this.edit_profile_form.get('produit_adhesion').value;
      this.profile.activation_compte = this.ct_inscription;
      this.profile.activation_trading = this.cout_trading;
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

    choix_patcs(pact: any) {
      this.updateProfileForm.get('produit_adhesion').reset();
      this.produits_by_pact = [];
      this.get_products_by_pacts(pact);
      if (pact === 1) {
        this.trading_state = 0;
      } else {
        this.trading_state = 1;
      }

      for (const p of this.all_pacts) {
        if (pact === p.niveau) {
          this.ct_inscription = p.montant_compte;
          this.cout_trading = p.montant_trading;
          this.cout_total = p.total;
          break;
        }
      }
    }
    private get_products_by_pacts(pact: number) {
      this.produits_by_pact = [];
      for (const pr of this.produits) {
        if (pr.pacts === pact) {
          this.produits_by_pact.push(pr);
        }
      }
    } */

    username: string;
    cout_total = 0;
    cout_trading = 0;
    ct_inscription = 0;
    trading_state = 0;
    message = '';
    produits: Produit[] = [];
    chargement: boolean;
    all_pacts: any[] = [];
    produits_by_pact: Produit[] = [];

    constructor(private  formBuilder: FormBuilder,
                private modalService: NgbModal,
                private crudService: CrudService,
                private authService: AuthService,
                private router: Router,
                private route: ActivatedRoute) {
    }

    ngOnInit() {
        this.get_pacts();
        this.crudService.getProduits(this.authService.currentUser.username).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.produits = reponse.data;
                }
            }
        );
        this.initForm();
    }

    get_pacts() {
        this.chargement = true;
        this.crudService.getPacts(this.authService.currentUser.username).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.all_pacts = reponse.data;
                    this.chargement = false;
                } else {
                    this.chargement = false;
                    console.log(reponse.message);
                }
            }, (error) => {
                console.log(error);
            }
        );
    }

    initForm() {
        const id = +this.route.snapshot.params.id;
        if (typeof id === 'number') {
            this.crudService.getProfiles(this.authService.currentUser.username, id).subscribe(
                (response: any) => {
                    if (response.status === true) {
                        this.profile = response.data[0];
                        this.is_profile_loaded = true;
                        this.edit_profile_form = this.formBuilder.group({
                            username: [this.profile.username],
                            produit_adhesion: [this.profile.produit_adhesion],
                            niveau_adhesion: [this.profile.niveau_adhesion],
                            capital: [this.profile.capital],
                            activation_compte: [this.profile.activation_compte],
                            activation_trading: [this.profile.activation_trading],
                            username_parain: [this.profile.username_parain],
                            password_parain: [this.profile.password_parain],
                            password: [this.profile.password],
                            activation_compte_state: [this.profile.etat_activation == 1 ? true : false],
                            activation_trading_state: [this.profile.etat_trading == 1 ? true : false]
                        });
                    } else {
                        console.log(response);
                    }
                }, (error => {
                    console.log(error);
                })
            );
        }
    }

    editProfile(content: any) {
        const id = this.route.snapshot.params.id;
        this.username = this.route.snapshot.params.username;
        this.profile.username = this.edit_profile_form.get('username').value;
        this.profile.niveau_adhesion = this.edit_profile_form.get('niveau_adhesion').value;
        this.profile.capital = (this.cout_total === 0) ? this.profile.capital : this.cout_total;
        this.profile.produit_trading = this.edit_profile_form.get('produit_adhesion').value;
        this.profile.produit_adhesion = this.edit_profile_form.get('produit_adhesion').value;
        this.profile.activation_compte = (this.ct_inscription === 0) ? this.profile.activation_compte : this.ct_inscription;
        this.profile.activation_trading = (this.cout_trading === 0) ? this.profile.activation_trading : this.cout_trading;
        this.profile.username_parain = this.edit_profile_form.get('username_parain').value;
        this.profile.password_parain = this.edit_profile_form.get('password_parain').value;
        this.profile.password = this.edit_profile_form.get('password').value;
        this.profile.etat_trading = this.edit_profile_form.get('activation_trading_state').value ? 1 : 0;
        this.profile.etat_activation = this.edit_profile_form.get('activation_compte_state').value ? 1 : 0;
        this.crudService.putProfile(Object.assign(
            this.profile,
            {
                auteur_operation: this.authService.currentUser.username
            }
        )).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.message = 'Modification profile effectuée avec succès!';
                    this.open(content);
                } else {
                    if (reponse.message === 'DOUBLON') {
                        this.message = 'Ce username existe dans le système';
                    } else {
                        this.message = 'La modification a échoué!';
                    }
                    this.open(content);
                    console.log(reponse.message);
                }
            },
            (error) => {
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

    choix_patcs(pact: any) {
        this.edit_profile_form.get('produit_adhesion').reset();
        this.produits_by_pact = [];
        this.get_products_by_pacts(pact);
        if (pact === 1) {
            this.trading_state = 0;
        } else {
            this.trading_state = 1;
        }

        for (const p of this.all_pacts) {
            if (pact === p.niveau) {
                this.ct_inscription = p.montant_compte;
                this.cout_trading = p.montant_trading;
                this.cout_total = p.total;
                break;
            }
        }
    }

    private get_products_by_pacts(pact: number) {
        this.produits_by_pact = [];
        for (const pr of this.produits) {
            if (pr.pacts === pact) {
                this.produits_by_pact.push(pr);
            }
        }
    }

    is_allowed() {
        const droits = ['admin', 'technique', 'profile-enligne'];
        for (const droit of droits) {
            if (this.authService.currentUser.service === droit) {
                return false;
            }
        }
        return true;
    }
}
