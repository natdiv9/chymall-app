import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {CrudService} from '../../../ChymallServices/crud/crud.service';
import {ModalDismissReasons, NgbModal} from '@ng-bootstrap/ng-bootstrap';

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

  constructor(private  formBuilder: FormBuilder,
              private modalService: NgbModal,
              private crudService: CrudService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.newProfileForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      produit: ['', [Validators.required]],
      niveau: ['', [Validators.required]]
    });
  }

  newProfile() {
    const profile = {
      idClient: this.route.snapshot.params.id,
      username: this.newProfileForm.get('username').value,
      produit: this.newProfileForm.get('produit').value,
      niveau: this.newProfileForm.get('niveau').value,
      etatTrading: false,
      etatCompte: false,
      etat: true
    };
    console.log(profile);
    this.crudService.addProfile(profile).subscribe(
        (reponse: any) => {
          if (reponse.status === true) {
            this.modalService.open(this.closeResult);
            this.newProfileForm.reset();
          } else {
            this.router.navigate(['profiles/new']);
          }
        }
    );
  }
  open(content) {
    this.modalService.open(content).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }
  openLarge(content) {
    this.modalService.open(content, {
      size: 'lg'
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
}
