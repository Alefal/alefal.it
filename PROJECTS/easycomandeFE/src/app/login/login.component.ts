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

  user: User = new User();

  loading = false;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService,
    private loadingBarService: LoadingBarService,
    private alertService: AlertService) { }

  ngOnInit() {
    this.route.params
      .subscribe(params => {
        if (params['logout']) {
          console.log('logout!');
          this.authenticationService.logout();
          this.router.navigate(['/']);
        }
      });
    
    if(localStorage.getItem('currentUserRemeberMe')) {
      this.user.username    = localStorage.getItem('currentUserEmail');
      this.user.password    = localStorage.getItem('currentUserPass');
      this.user.rememberme  = localStorage.getItem('currentUserRemeberMe');
      this.autologin();
    } else {
      // reset login status
      this.user.username = '';
      this.user.password = '';
      this.user.rememberme = '';
    }

    this.user.username = 'admin@easycomande.it';
    this.user.password = 'Abc123def';
  }

  //Login
  login() {
    console.log('username -> '+this.user.username);
    console.log('password -> '+this.user.password);
    console.log('rememberme -> '+this.user.rememberme);
    
    this.loadingBarService.start();

    this.authenticationService
      .login(this.user.username, this.user.password)
      .subscribe(user => {
        console.log('res -> '+JSON.stringify(user));

        if(user.logged == 'autenticated') {
          localStorage.setItem('currentUser', user.name);
          
          if(this.user.rememberme) {
            localStorage.setItem('currentUserEmail', this.user.username);
            localStorage.setItem('currentUserPass', this.user.password);
            localStorage.setItem('currentUserRemeberMe', this.user.rememberme);
          }

          localStorage.setItem('api_token', user.api_token);
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

  //Login: remember me
  autologin() {
    this.loadingBarService.start();

    this.authenticationService
      .login(this.user.username, this.user.password)
      .subscribe(user => {
        console.log('res -> '+JSON.stringify(user));

        if(user.logged == 'autenticated') {
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
