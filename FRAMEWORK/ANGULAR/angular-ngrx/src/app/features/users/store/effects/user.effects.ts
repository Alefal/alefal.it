/**
 * Effects are an RxJS powered side effect model for Store. 
 * Effects use streams to provide new sources of actions to reduce state based on external interactions such as network requests, 
 * web socket messages and time-based events.
 */
import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';

import { catchError, map, mergeMap } from 'rxjs/operators'
import { EMPTY, of } from 'rxjs';

import * as UserActions from '../actions/user.actions';
import { User } from '../../../../shared/models/interfaces/user.interface';
import { HttpService } from '../../../../shared/services/http.service';
import { NgxSpinnerService } from 'ngx-spinner';

@Injectable()
export class UserEffects {

  constructor(
    private httpService: HttpService,
    private actions$: Actions,
    private spinner: NgxSpinnerService
  ) { }

  ////////// Users Collection
  loadUsers$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.loadUsers),
      mergeMap(action =>
        this.httpService.getCallHttpNGRX('/users').pipe(
          map((data: User[]) => {
            this.spinner.hide();
            return UserActions.loadUsersSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            this.spinner.hide();
            return of(UserActions.loadUsersError(error));
          })
        )
      )
    );
  });

  ////////// User Detail <- TODO: richiamare in metodo generico in HttpService
  loadUserDetail$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.loadUserDetail),
      mergeMap(action =>
        this.httpService.getUserDetail(action).pipe(
          map((data: any) => {
            console.log('data',data);
            this.spinner.hide();
            return UserActions.loadUserDetailSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            this.spinner.hide();
            return of(UserActions.loadUserDetailError(error));
          })
        )
      )
    );
  });

  ////////// User Edit <- TODO: richiamare in metodo generico in HttpService
  userEdit$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.userEdit),
      mergeMap(action =>
        this.httpService.editUser(action).pipe(
          map((data: User) => {
            this.spinner.hide();
            return UserActions.userEditSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            this.spinner.hide();
            return of(UserActions.userEditError(error));
          })
        )
      )
    );
  });

  ////////// User Create <- TODO: richiamare in metodo generico in HttpService
  userCreate$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.userCreate),
      mergeMap(action =>
        this.httpService.createUser(action).pipe(
          map((data: User) => {
            this.spinner.hide();
            return UserActions.userCreateSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            this.spinner.hide();
            return of(UserActions.userCreateError(error));
          })
        )
      )
    );
  });

  ////////// User Delete
  userDelete$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.userDelete),
      mergeMap(action =>
        this.httpService.deleteCallHttpNGRX('/users',action).pipe(
          map((data: any) => {
            this.spinner.hide();
            return UserActions.userDeleteSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            this.spinner.hide();
            return of(UserActions.userDeleteError(error));
          })
        )
      )
    );
  });
}
