import {Component, OnInit} from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Produit} from '../../../ChymallModels/models/produit';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
    selector: 'app-produits-all',
    templateUrl: './produits-all.component.html',
    styleUrls: ['./produits-all.component.sass']
})
export class ProduitsAllComponent implements OnInit {

    produits: Produit[] = [];
    current_produit: Produit;
    closeResult: string;
    stockForm: FormGroup;
    message: string;

    constructor(
        private crudService: CrudService,
        private authService: AuthService,
        private modalService: NgbModal,
        private formBuilder: FormBuilder
    ) {
    }

    open(content, route  = []) {
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

    on_ajouter_stock(produit: Produit, content2: any) {
        this.current_produit = produit;
        this.stockForm = this.formBuilder.group({
            quantite: ['', [Validators.required, Validators.min(1)]]
        });
        this.open(content2);
    }

    ajouterStock(content: any, c: any) {
        const stockage = {
            quantite: this.stockForm.get('quantite').value,
            id_produit: this.current_produit.id,
            auteur_operation: this.authService.currentUser.username
        };
        const produit_changes = {
            id: this.current_produit.id,
            designation: this.current_produit.designation,
            stock_initial: this.current_produit.stock_initial,
            stock_final: (+this.current_produit.stock_final) + (+this.stockForm.get('quantite').value),
            pacts: this.current_produit.pacts,
            auteur_operation: this.authService.currentUser.username
        };

        this.crudService.addStockage(stockage).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.crudService.putProduit(produit_changes).subscribe(
                        (reponse2: any) => {
                            if (reponse2.status === true) {
                                this.message = 'Stockage enregistré avec succès';
                                this.open(content);
                                this.refresh();
                            } else {
                                this.message = 'Erreur: Impossible de mettre à le produite';
                                this.open(content);
                            }
                        }, (error) => {
                            console.log(error);
                        }
                    );
                } else {
                    this.message = 'Erreur: Impossible d\'enregistrer le stockage';
                    this.open(content);
                    console.log(reponse.message);
                }
            }, error => {
                console.log(error);
            }
        );
    }

    private refresh() {
        this.crudService.getProduits(this.authService.currentUser.username).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.produits = reponse.data;
                } else {
                    this.produits = null;
                }
            }
        );
    }
}
