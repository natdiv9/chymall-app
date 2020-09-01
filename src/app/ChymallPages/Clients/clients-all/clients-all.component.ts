import {Component, OnInit} from '@angular/core';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {Client} from '../../../ChymallModels/models/client';
import {AuthService} from '../../../ChymallServices/auth/auth.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {error} from 'util';

@Component({
    selector: 'app-clients-all',
    templateUrl: './clients-all.component.html',
    styleUrls: ['./clients-all.component.sass']
})
export class ClientsAllComponent implements OnInit {

    clients: Client[] = [];
    message = '';
    closeResult: string;
    chargement: boolean;

    constructor(
        private crudService: CrudService,
        private authService: AuthService,
        private modalService: NgbModal
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
}
