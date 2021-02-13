import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

import { mergeMap, map, catchError, tap } from 'rxjs/operators';
import { of } from 'rxjs';

import { Actions, createEffect, ofType } from '@ngrx/effects';
import * as AuthActions from '../actions/auth.actions';

import { NgxSpinnerService } from 'ngx-spinner';
import { HttpService } from '../../../shared/services/http.service';

@Injectable()
export class AuthEffects {

  constructor(
    private actions$: Actions,
    private httpService: HttpService,
    private router: Router,
    private spinner: NgxSpinnerService
  ) { }

  ////////// Authentication
  authentication$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(AuthActions.authentication),
      mergeMap(action =>
        this.httpService.getCallHttpNGRX('/users').pipe(
          map((data: any) => {
            return AuthActions.authenticationSuccess({ user: data[0], auth: action.payload });
          }),
          catchError((error: Error) => {
            console.error('error', error);
            this.spinner.hide();
            return of(AuthActions.authenticationError(error));
          })
        )
      )
    );
  });
  authenticationSuccess$ = createEffect(() => 
    this.actions$.pipe(
      ofType(AuthActions.authenticationSuccess),
      tap((res: any) => {
        this.spinner.hide();
        console.log('authenticationSuccess',res);
        localStorage.setItem('userCurrent', JSON.stringify(res.user));
        if(res.auth.rememberme) {
          localStorage.setItem('userLogged', JSON.stringify(res.auth));
        }
        this.router.navigate(['/users']);
      })
    ),
    { dispatch: false }
  );
}
