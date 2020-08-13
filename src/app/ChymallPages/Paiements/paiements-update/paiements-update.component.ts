import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Paiement} from '../../../ChymallModels/models/paiement';

@Component({
  selector: 'app-paiements-update',
  templateUrl: './paiements-update.component.html',
  styleUrls: ['./paiements-update.component.sass']
})
export class PaiementsUpdateComponent implements OnInit {
  updatePaiementForm: FormGroup;
  closeResult: string;
  paiement: Paiement;

  constructor(private formBuilder: FormBuilder,
              private route: ActivatedRoute,
              private crudService: CrudService,
              private router: Router,
              private modalService: NgbModal) { }

  ngOnInit() {
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
    this.crudService.getPaiements(id).subscribe(
        (response: any) => {
          if (response.status) {
            this.paiement = response.data;
            this.updatePaiementForm = this.formBuilder.group({
              inscription: this.paiement.montant_inscription,
              trading: this.paiement.montant_trading
            });
          }
        }
    );
  }

  updatePaiement() {
    const m_inscription = this.updatePaiementForm.get('inscription').value;
    const m_trading = this.updatePaiementForm.get('trading').value;

    let f_inscription = (m_inscription * 15) / 100;
    let f_trading = (m_trading.montant * 15) / 100;

    const paiement = {
      id_profile: 1,
      montant_inscription: m_inscription,
      montant_trading: m_trading,
      frais_inscription: f_inscription,
      frais_trading: f_trading,
      date_operation: null
    };

    this.crudService.putPaiement(paiement).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open('Paiement effectué avec succès');
            this.updatePaiementForm.reset();
          } else {
            this.modalService.open('Paiement a échoué');
          }
        }
    );

  }
}
