import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { Auth } from '../../shared/models/interfaces/auth.interface';
import { User } from '../../shared/models/interfaces/user.interface';
import { Router } from '@angular/router';

@Component({
  selector: 'auth',
  templateUrl: './auth.component.html'
})
export class AuthComponent implements OnInit {

  auth: Auth;
  user: User;

  constructor(
    private router: Router,
    private toastr: ToastrService,
  ) {
    this.user = {} as User;
    this.auth = {} as Auth;
    this.auth.authenticate = {} as any;
    this.auth.authenticate.username = '';
    this.auth.authenticate.password = '';
    this.auth.authenticate.rememberme = false;
  }

  ngOnInit() {
    const userCurrent: any = JSON.parse(localStorage.getItem('userCurrent'));
    const userLogged: any = JSON.parse(localStorage.getItem('userLogged'));
    if (userCurrent) {
      this.user = userCurrent;
      if (this.user && userLogged && userLogged.rememberme) {
        this.auth.authenticate.username = userLogged.username;
        this.auth.authenticate.password = userLogged.password;
        this.auth.authenticate.rememberme = userLogged.rememberme;
        this.authentication(this.auth);
      }
    }
  }

  authentication(auth: Auth) {
    //if (auth.authenticate.username == 'alefal' && auth.authenticate.password == 'alefal') {
      const payload = {
        username: auth.authenticate.username,
        password: auth.authenticate.password,
        rememberme: auth.authenticate.rememberme
      };
      localStorage.setItem('userCurrent', JSON.stringify(auth));
      if(auth.authenticate.rememberme) {
        localStorage.setItem('userLogged', JSON.stringify(auth));
      }
      this.router.navigate(['dashboard']);
    //} else {
    //  this.toastr.error('Username or Password Invalid', 'Authentication Failed!!!');
    //}
  }

}
