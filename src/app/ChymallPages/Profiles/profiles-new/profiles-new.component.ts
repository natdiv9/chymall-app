import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {Produit} from '../../../ChymallModels/models/produit';
import {Pacts} from '../../../ChymallModels/models/pacts';

@Component({
  selector: 'app-profiles-new',
  templateUrl: './profiles-new.component.html',
  styleUrls: ['./profiles-new.component.sass']
})
export class ProfilesNewComponent implements OnInit {

  newProfileForm: FormGroup;

  heading = 'Modals';
  subheading = 'Wide selection of modal dialogs styles and animations available.';
  icon = 'pe-7s-phone icon-gradient bg-premium-dark';

  closeResult: string;

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
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.username = this.route.snapshot.params.username;
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
    this.newProfileForm = this.formBuilder.group({
      username: [''],
      produit_adhesion: [''],
      niveau_adhesion: ['', [Validators.required]],
      capital: [''],
      activation_compte: [''],
      activation_trading: [''],
      username_parain: ['']
    });
  }

  newProfile(content: any) {
    const id = this.route.snapshot.params.id;
    this.username = this.route.snapshot.params.username;
    const profile = {
      id_client: id,
      username: '_incomplet',
      niveau_adhesion: this.newProfileForm.get('niveau_adhesion').value,
      capital: this.cout_total,
      produit_trading: this.newProfileForm.get('produit_adhesion').value,
      produit_adhesion: this.newProfileForm.get('produit_adhesion').value,
      activation_compte: this.ct_inscription,
      activation_trading: this.cout_trading,
      etat_trading: 0,
      etat_activation: 0,
      etat: 1,
      username_parain: this.newProfileForm.get('username_parain').value,
      auteur_operation: this.authService.currentUser.username
    };
    this.crudService.addProfile(profile).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.message = 'Enregistrement profile effectué avec succès!';
            this.open(content);
            this.newProfileForm.reset();
          } else {
            this.message = 'Enregistrement a échoué!';
            this.open(content);
            console.log(reponse.message);
          }
        },
        (error) => {console.log(error); }
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
    this.newProfileForm.get('produit_adhesion').reset();
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
}
