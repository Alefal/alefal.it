import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { Store, select } from '@ngrx/store';

import AppState from '../../store/state/app.state';
import AuthState from '../store/state/auth.state';

import { getAppConfig } from '../../store/selectors/app.selectors';

import * as AuthActions from '../store/actions/auth.actions';

import { Auth } from '../../shared/models/interfaces/auth.interface';
import { User } from '../../shared/models/interfaces/user.interface';

@Component({
  selector: 'auth',
  templateUrl: './auth.component.html'
})
export class AuthComponent implements OnInit {

  auth: Auth;
  user: User;
  appTitle$: Observable<string>;
  appVersion$: Observable<string>;

  appConfig$: Observable<any>;
  appIsAuthenticated$: Observable<any>;
  userLogged$: Observable<any>;

  constructor(
    private storeApp: Store<{ appState: AppState }>,
    private storeAuth: Store<{ authState: AuthState }>,
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
    // Load Config
    this.appConfig$ = this.storeApp.pipe(select(getAppConfig));

    // SELECTOR: AppState -> Config 
    this.appConfig$
      .pipe(
        map(el => {
          console.log('el',el);
        })
      )
      .subscribe();

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
    if (auth.authenticate.username == 'alefal' && auth.authenticate.password == 'alefal') {
      const payload = {
        username: auth.authenticate.username,
        password: auth.authenticate.password,
        rememberme: auth.authenticate.rememberme
      };
      this.storeAuth.dispatch(AuthActions.authentication({ payload }));
    } else {
      this.toastr.error('Username or Password Invalid', 'Authentication Failed!!!');
    }
  }

}
