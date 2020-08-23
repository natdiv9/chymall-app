import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {Produit} from '../../../ChymallModels/models/produit';

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

  constructor(private  formBuilder: FormBuilder,
              private modalService: NgbModal,
              private crudService: CrudService,
              private authService: AuthService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.username = this.route.snapshot.params.username;
    this.crudService.getProduits(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.produits = reponse.data;
          }
        }
    );
    this.initForm();
  }

  initForm() {
    this.newProfileForm = this.formBuilder.group({
      username: [''],
      produit_adhesion: [''],
      niveau_adhesion: ['', [Validators.required]],
      capital: [''],
      activation_compte: [''],
      activation_trading: ['']
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

  patcs(vip: HTMLSelectElement) {
    const pact = vip.value;
    switch (pact) {
      case 'VIP-1' :
        this.ct_inscription = 28.75;
        this.cout_trading = 0;
        this.cout_total = this.ct_inscription + this.cout_trading;
        this.trading_state = 0;
        break;
      case 'VIP-2' :
        this.ct_inscription = 57.5;
        this.cout_trading = 103.5;
        this.cout_total = this.ct_inscription + this.cout_trading;
        this.trading_state = 1;
        break;
      case 'VIP-3' :
        this.ct_inscription = 115;
        this.cout_trading = 207;
        this.cout_total = this.ct_inscription + this.cout_trading;
        this.trading_state = 1;
        break;
      case 'VIP-4' :
        this.ct_inscription = 345;
        this.cout_trading = 621;
        this.cout_total = this.ct_inscription + this.cout_trading;
        this.trading_state = 1;
        break;
      case 'VIP-5' :
        this.ct_inscription = 690;
        this.cout_trading = 1242;
        this.cout_total = this.ct_inscription + this.cout_trading;
        this.trading_state = 1;
        break;
    }
  }
}
