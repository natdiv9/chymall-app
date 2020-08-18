import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

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
  ct_frais_tranfert = 0;
  ct_inscription = 0;
  trading_state = 0;
  message = '';

  constructor(private  formBuilder: FormBuilder,
              private modalService: NgbModal,
              private crudService: CrudService,
              private authService: AuthService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newProfileForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      produit_trading: ['', [Validators.required]],
      niveau_adhesion: ['', [Validators.required]],
      capital: [''],
      activation_compte: [''],
      activation_trading: ['']
    });
  }

  newProfile(content: any) {
    const id = this.route.snapshot.params.id;
    this.username = this.route.snapshot.params.id;
    const profile = {
      id_client: id,
      username: this.newProfileForm.get('username').value,
      niveau_adhesion: this.newProfileForm.get('niveau_adhesion').value,
      capital: this.ct_inscription,
      produit_trading: this.newProfileForm.get('produit_trading').value,
      activation_compte: this.ct_inscription,
      activation_trading: this.ct_frais_tranfert,
      etat_trading: this.trading_state,
      etat_activation: 1,
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
  openLarge(content) {
    this.modalService.open(content, {
      size: 'lg'
    });
  }

  patcs(vip: HTMLSelectElement) {
    const pact = vip.value;
    switch (pact) {
      case 'VIP-1' :
        this.ct_inscription = 25;
        this.cout_total = 0;
        this.ct_frais_tranfert = 0;
        this.trading_state = 0;
        break;
      case 'VIP-2' :
        this.ct_inscription = 50;
        this.cout_total = 140;
        this.ct_frais_tranfert = (this.cout_total * 15 / 100) + this.cout_total;
        this.trading_state = 1;
        break;
      case 'VIP-3' :
        this.ct_inscription = 100;
        this.cout_total = 280;
        this.ct_frais_tranfert = (this.cout_total * 15 / 100) + this.cout_total;
        this.trading_state = 1;
        break;
      case 'VIP-4' :
        this.ct_inscription = 300;
        this.cout_total = 840;
        this.ct_frais_tranfert = (this.cout_total * 15 / 100) + this.cout_total;
        this.trading_state = 1;
        break;
      case 'VIP-5' :
        this.ct_inscription = 600;
        this.cout_total = 1680;
        this.ct_frais_tranfert = (this.cout_total * 15 / 100) + this.cout_total;
        break;
    }
  }
}
