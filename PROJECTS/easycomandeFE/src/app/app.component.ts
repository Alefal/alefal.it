import { Component } from '@angular/core';

import { AuthenticationService } from './_services/index';
import { LoadingBar, LoadingBarService } from "ng2-loading-bar";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  height = 2;
  color = "#4092F1";
  runInterval = 50;

  constructor(
    public authenticationService: AuthenticationService,
    private loadingBarService: LoadingBarService
  ) {}
}
