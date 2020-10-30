import { Component, OnInit } from '@angular/core';
import {Client} from '../../../ChymallModels/models/client';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {Produit} from '../../../ChymallModels/models/produit';
import {Router} from '@angular/router';

@Component({
  selector: 'app-profiles-enligne',
  templateUrl: './profiles-enligne.component.html',
  styleUrls: ['./profiles-enligne.component.sass']
})
export class ProfilesEnligneComponent implements OnInit {
  clients: any[] = [];
  message = '';
  closeResult: string;
  chargement: boolean;
  creating_profile = false;
  current_client: Client;
  new_profile_form: FormGroup;

  cout_total = 0;
  cout_trading = 0;
  ct_inscription = 0;
  trading_state = 0;
  produits: Produit[] = [];
  all_pacts: any[] = [];
  produits_by_pact: Produit[] = [];

  constructor(
      private crudService: CrudService,
      private form_builder: FormBuilder,
      private authService: AuthService,
      private modalService: NgbModal,
      private router: Router
  ) {
  }

  open(content, route = []) {
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

  ngOnInit() {
    this.refresh();
  }

  refresh() {
    this.chargement = true;
    this.crudService.getClients(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.chargement = false;
            this.clients = reponse.data;
          } else {
            this.chargement = false;
            this.message = 'Echec de recupération de données';
            console.log(reponse.message);
          }
          this.message = 'Echec de recupération de données';
          console.log(reponse);
        }
    );
  }

  rechercher(value: HTMLInputElement, content: any) {
    if (value.value === '') {
      return;
    }
    const recherche = value.value;
    value.value = '';
    this.crudService.getClientsByRecherche(
        this.authService.currentUser.username,
        recherche
    ).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.clients = reponse.data;
            console.log(reponse.data);
          } else {
            console.log(reponse.message);
          }
          // tslint:disable-next-line:no-shadowed-variable
        }, (error) => {
          console.log(error);
        }
    );
  }

  choix_patcs(pact: any) {
    this.new_profile_form.get('produit_adhesion').reset();
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

  get_pacts() {
    this.chargement = true;
    this.crudService.getProduits(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.produits = reponse.data;
          }
        }
    );
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

  private get_products_by_pacts(pact: number) {
    this.produits_by_pact = [];
    for (const pr of this.produits) {
      if (pr.pacts === pact) {
        this.produits_by_pact.push(pr);
      }
    }
  }

  new_profile_enligne(client: Client) {
    this.current_client = client;
    this.creating_profile = true;
    this.get_pacts();
    this.new_profile_form = this.form_builder.group({
      username: [''],
      produit_adhesion: [''],
      niveau_adhesion: ['', [Validators.required]],
      capital: [''],
      activation_compte: [''],
      activation_trading: [''],
      username_parain: [''],
      password: [''],
      activation_compte_state: true,
      activation_trading_state: false
    });
  }

  newProfile(content: any) {
    const profile = {
      id_client: this.current_client.id,
      username: this.new_profile_form.get('username').value,
      niveau_adhesion: this.new_profile_form.get('niveau_adhesion').value,
      capital: this.cout_total,
      produit_trading: this.new_profile_form.get('produit_adhesion').value,
      produit_adhesion: this.new_profile_form.get('produit_adhesion').value,
      password: this.new_profile_form.get('password').value,
      activation_compte: this.ct_inscription,
      activation_trading: this.cout_trading,
      etat_trading: this.new_profile_form.get('activation_trading_state').value ? 1 : 0,
      etat_activation: this.new_profile_form.get('activation_compte_state').value ? 1 : 0,
      etat: 2,
      etat_produit_adhesion: 1,
      username_parain: this.new_profile_form.get('username_parain').value,
      auteur_operation: this.authService.currentUser.username,
      ajoute_par: this.authService.currentUser.username,
      is_online_profile: 1
    };
    this.crudService.addProfile(profile).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Enregistrement profile effectué avec succès!';
            this.open(content);
            this.new_profile_form.reset();
            // this.router.navigate(['/', 'profiles', this.current_client.id, this.current_client.identifiant, 'all']);
            this.creating_profile = false;
          } else {
            this.message = 'Enregistrement a échoué!';
            this.open(content);
            console.log(reponse);
          }
        },
        (error) => {console.log(error); }
    );
  }
}
