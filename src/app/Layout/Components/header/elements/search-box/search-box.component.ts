import {Component, Input, OnInit} from '@angular/core';

@Component({
  selector: 'app-search-box',
  templateUrl: './search-box.component.html',
})
export class SearchBoxComponent implements OnInit {

  @Input() recherche_on;
  public isActive: any;

  constructor() { }

  ngOnInit() {
  }

}
