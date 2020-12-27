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

    clients: any[] = [];
    message = '';
    closeResult: string;
    chargement: boolean;
    page = 1;
    nb_pages: number;

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

    refresh(page = 1) {
        this.chargement = true;
        const id = undefined;
        this.crudService.getClients(this.authService.currentUser.username, id, page).subscribe(
            (reponse: any) => {
                if (reponse.status === true) {
                    this.chargement = false;
                    this.clients = reponse.data.array;
                    this.nb_pages = reponse.data.nb_pages;
                    // console.log(reponse.data);
                } else {
                    this.chargement = false;
                    this.message = 'Echec de recupération de données';
                    console.log(reponse.message);
                }
                this.message = 'Echec de recupération de données';
                console.log(reponse);
            }, (error1 => console.log(error1))
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

    validerSuppression(content: any, c: any) {

    }

    onPageChange(event: any) {
        this.refresh(+event);
    }
}
