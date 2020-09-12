import { Component, OnInit } from '@angular/core';
import {Produit} from '../../../ChymallModels/models/produit';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {FormBuilder, FormGroup} from '@angular/forms';
import {Router} from '@angular/router';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {Profile} from '../../../ChymallModels/models/profile';

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
  is_retrait_produit = false;
  constructor(private crudService: CrudService,
              private authService: AuthService,
              private modalService: NgbModal,
              private router: Router,
              private formBuilder: FormBuilder) { }

  ngOnInit() {
    this.retraitProduitForm = this.formBuilder.group({
      id_produit: [''],
      quantite: ['']
    });
    this.crudService.getProduits(this.authService.currentUser.username).subscribe(
          (reponse: any) => {
              if (reponse.status === true) {
                  this.produits = reponse.data;
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

  newRetraitProduit(content) {
    const retrait_produit = {
      id_profile: this.current_profile.id,
      id_produit: +this.retraitProduitForm.get('id_produit').value,
      quantite: this.retraitProduitForm.get('quantite').value,
      auteur_operation: this.authService.currentUser.username
    };

    if (retrait_produit.quantite > this.stock_disponible) {
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

  checkQuantite(qte: string) {
    if (+qte > this.stock_disponible) {
      this.qte_message = 'Le stock est insuffisant';
    } else {
      this.qte_message = '';
    }
  }

  produitChange(id_produit: string) {
    this.find_stock_final(+id_produit);
    console.log(this.currentProduit);
    // this.stock_disponible = this.currentProduit.stock_final;
    // console.log(this.stock_disponible);
  }

  find_stock_final(id_produit: number) {
      for (const produit of this.produits) {
          if (produit.id === id_produit) {
              console.log(produit);
              this.currentProduit = produit;
          }
      }
  }

  retrait_produit_trading(profile: Profile, content: any) {
    this.current_profile = profile;
    this.is_retrait_produit = true;
  }

  retrait_produit_adhesion(profile: Profile, content: any) {
    this.current_profile = profile;
    this.is_retrait_produit = true;
  }

  refresh() {
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
                } else {
                    this.is_client_found = false;
                    this.chargement = false;
                    this.message = 'Une erreur est survenue!';
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
