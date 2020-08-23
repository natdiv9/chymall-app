import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../../ChymallServices/auth/auth.service';

@Component({
    selector: 'app-paiements-new',
    templateUrl: './paiements-new.component.html',
    styleUrls: ['./paiements-new.component.sass']
})
export class PaiementsNewComponent implements OnInit {

    newPaiementForm: FormGroup;
    closeResult: string;
    idprofile: number;
    frais_inscription = 0;
    frais_trading = 0;
    message: string;

    constructor(private formBuilder: FormBuilder,
                private router: Router,
                private modalService: NgbModal,
                private crudService: CrudService,
                private authService: AuthService,
                private route: ActivatedRoute) {
    }

    ngOnInit() {
        this.idprofile = +this.route.snapshot.params.idprofile;
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
        this.newPaiementForm = this.formBuilder.group({
            inscription: ['', [Validators.required, Validators.min(0)]],
            trading: ['', [Validators.required, Validators.min(0)]],
            frais_inscription: [0],
            frais_trading: [0]
        });
    }

    newPaiement(content: any) {

        const m_inscription = this.newPaiementForm.get('inscription').value;
        const m_trading = this.newPaiementForm.get('trading').value;

        const paiement = {
            id_profile: this.idprofile,
            montant_inscription: m_inscription,
            montant_trading: m_trading,
            frais_inscription: this.frais_inscription,
            frais_trading: this.frais_trading,
            auteur_operation: this.authService.currentUser.username
        };
        this.crudService.addPaiement(paiement).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.message = 'Paiement effectué avec succès';
                    this.open(content);
                    this.newPaiementForm.reset();
                } else {
                    console.log(reponse.message);
                    this.message = 'Echec de l\'enregistrement du paiement a échoué';
                    this.open(content);
                }
            },
            (error) => {
                console.log(error);
                this.message = 'Echec d\'enregistrement du paiement a échoué';
                this.open(content);
            }
        );

    }

    k_trading(trading: HTMLInputElement) {
        this.frais_trading = (+trading.value * 15) / 100;
    }

    k_inscription(inscription: HTMLInputElement) {
        this.frais_inscription = (+inscription.value * 15) / 100;
    }
}
