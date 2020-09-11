import { Component, OnInit } from '@angular/core';
import {Produit} from '../../../ChymallModels/models/produit';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {Client} from '../../../ChymallModels/models/client';
import {Profile} from '../../../ChymallModels/models/profile';
declare  var $: any;

@Component({
  selector: 'app-retrait-produits-new',
  templateUrl: './retrait-produits-new.component.html',
  styleUrls: ['./retrait-produits-new.component.sass']
})
export class RetraitProduitsNewComponent implements OnInit {

  produits: Produit[] = [];
  retraitProduitForm: FormGroup;
  closeResult: string;
  message: string;
  idprofile: number;
  stock_disponible: number;
  qte_message: string;
  currentProduit: Produit;
   is_client_found = false;
   all_profiles_client: any[] = [];
  current_profile: Profile;
  chargement: boolean;
  lastsearch: string;
  constructor(private crudService: CrudService,
              private authService: AuthService,
              private modalService: NgbModal,
              private router: Router,
              private formBuilder: FormBuilder) { }

  ngOnInit() {
    this.retraitProduitForm = this.formBuilder.group({
      id_produit: [''],
      quantite: [''],
      id_client: ['']
    });
    this.refresh();
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

  newRetraitProduit(content) {

    const retrait_produit = {
      id_profile: this.current_profile.id,
      id_produit: +this.retraitProduitForm.get('id_produit').value,
      quantite: this.retraitProduitForm.get('quantite').value,
      auteur_operation: this.authService.currentUser.username
    };

    if (retrait_produit.quantite > this.stock_disponible) {
      this.message = this.qte_message;
      this.open(content);
      return;
    }

    this.crudService.addRetraitProduit(retrait_produit).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            const produit_update = {
              id: this.currentProduit.id,
              designation: this.currentProduit.designation,
              stock_initial: this.currentProduit.stock_initial,
              stock_final: this.currentProduit.stock_final - retrait_produit.quantite,
              pacts: this.currentProduit.pacts,
              auteur_operation: this.authService.currentUser.username
            };
            this.crudService.putProduit(produit_update).subscribe(
                (reponse2: any) => {
                  if (reponse2.status === true) {
                    this.crudService.putProfile(
                        Object.assign(
                            this.current_profile, {
                              etat_produit_adhesion: 1,
                              auteur_operation: this.authService.currentUser.username
                            }
                        )
                    ).subscribe(
                        (rep: any) => {
                          if (rep.status === true) {
                            this.message = 'Produit retiré avec succès!';
                            this.open(content);
                            this.retraitProduitForm.reset();
                          } else {
                            this.message = 'Echec de la mise à jour profile du trading!';
                            this.open(content);
                            console.log(rep.message);
                          }
                        }, (error) => {
                          this.open(content);
                          console.log(error);
                        }
                    );
                  } else {
                    this.message = 'Echec de la mise a jour du produit!';
                    this.open(content);
                  }
                }
            );
          } else {
            this.message = 'Retrait impossible!';
            this.open(content);
            console.log(reponse);
          }
        },
        (error) => {
          this.message = 'Retrait impossible!';
          this.open(content);
          console.log(error);
        }
    );
  }

  checkQuantite(qte: HTMLInputElement) {
    if (+qte.value > this.stock_disponible) {
      this.qte_message = 'Le stock est insuffisant';
    } else {
      this.qte_message = '';
    }
  }

  produitChange(produit: Produit) {
    this.stock_disponible = produit.stock_final;
    this.currentProduit = produit;
  }

  retrait_produit_trading(profile: Profile, content: any, content2: any) {
    this.current_profile = profile;
    this.open(content2);
  }

  retrait_produit_adhesion(profile: Profile, content: any, content2: any) {
    this.current_profile = profile;
    this.open(content2);
  }

  refresh() {
    this.chargement = true;
    if (this.is_client_found) {
    }
    this.crudService.getProduits(this.authService.currentUser.username).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.produits = reponse.data;
          }
        }
    );
  }

  rechercher(value: HTMLInputElement, content: any) {
        if (value.value === '') {
            return;
        }
        const recherche = value.value;
        this.lastsearch = recherche;
        value.value = '';

        this.crudService.getProfilesByRecherche(
            this.authService.currentUser.username,
            recherche
        ).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.is_client_found = true;
                    this.all_profiles_client = reponse.data;
                    this.chargement = false;
                    if (reponse.data.length === 0) {
                        this.is_client_found = false;
                        this.message = 'Aucune information correspondante!';
                        this.open(content);
                    }
                    console.log(reponse.data);
                } else {
                    this.is_client_found = false;
                    this.chargement = false;
                    this.message = 'Aucune information correspondante!';
                    this.open(content);
                    console.log(reponse.message);
                }
                // tslint:disable-next-line:no-shadowed-variable
            }, (error) => {
                console.log(error);
            }
        );
    }
}
