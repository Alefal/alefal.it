import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { AlertService, AuthenticationService } from '../_services/index';
import { LoadingBar, LoadingBarService } from 'ng2-loading-bar';

import { User } from '../_models/user';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  model: User = new User();
  loading = false;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService,
    private loadingBarService: LoadingBarService,
    private alertService: AlertService) { }

  ngOnInit() {
    // reset login status
    this.authenticationService.logout();
    this.model.username = '';
    this.model.password = '';
    
  }

  login() {
    this.loadingBarService.start();

    this.authenticationService.login(this.model.username, this.model.password)
      .subscribe(data => {
        console.log('res -> '+data.logged);

        if(data.logged == 'autenticated') {
          this.router.navigate(['/home']);
        } else {
          this.alertService.error('Authentication failed!');
          this.loadingBarService.complete();
        }

      },
      error => {
        this.alertService.error(error);
        this.loadingBarService.complete();
      });
    
  }

}
