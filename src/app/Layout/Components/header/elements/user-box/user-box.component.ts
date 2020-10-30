import {Component, OnInit} from '@angular/core';
import {ThemeOptions} from '../../../../../theme-options';
import {AuthService} from '../../../../../ChymallServices/auth/auth.service';

@Component({
  selector: 'app-user-box',
  templateUrl: './user-box.component.html',
})
export class UserBoxComponent implements OnInit {

  constructor(public globals: ThemeOptions, public authService: AuthService) {
  }

  ngOnInit() {
  }

  deconnecxion() {
    this.authService.logout();
  }
}
