import { Component } from '@angular/core';

import { AuthenticationService } from './_services/index';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app works!';
  userLogged: boolean = false;

  constructor(public authenticationService: AuthenticationService) {}
}
