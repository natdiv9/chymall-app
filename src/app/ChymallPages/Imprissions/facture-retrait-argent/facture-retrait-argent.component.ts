import {AfterViewInit, Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-facture-retrait-argent',
  templateUrl: './facture-retrait-argent.component.html',
  styleUrls: ['./facture-retrait-argent.component.sass']
})
export class FactureRetraitArgentComponent implements OnInit, AfterViewInit {

  constructor() { }

  ngOnInit() {

  }

  ngAfterViewInit(): void {
    //window.print();
  }

}
