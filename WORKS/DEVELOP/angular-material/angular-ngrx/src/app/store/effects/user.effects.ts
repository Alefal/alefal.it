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
import { User } from '../../shared/models/interfaces/user.interface';
import { UserService } from '../services/user.service';


@Injectable()
export class UserEffects {

  ////////// Users Collection
  loadUsers$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.loadUsers),
      mergeMap(action =>
        this.userService.getUsers().pipe(
          map((data: User[]) => {
            return UserActions.loadUsersSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(UserActions.loadUsersError(error));
          })
        )
      )
    );
  });

  ////////// User Detail
  loadUserDetail$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.loadUserDetail),
      mergeMap(action =>
        this.userService.getUserDetail(action).pipe(
          map((data: User) => {
            console.log('data',data);
            return UserActions.loadUserDetailSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(UserActions.loadUserDetailError(error));
          })
        )
      )
    );
  });

  ////////// User Edit
  userEdit$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.userEdit),
      mergeMap(action =>
        this.userService.editUser(action).pipe(
          map((data: User) => {
            return UserActions.userEditSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(UserActions.userEditError(error));
          })
        )
      )
    );
  });

  ////////// User Create
  userCreate$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(UserActions.userCreate),
      mergeMap(action =>
        this.userService.createUser(action).pipe(
          map((data: User) => {
            return UserActions.userCreateSuccess({ payload: data });
          }),
          catchError((error: Error) => {
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
        this.userService.deleteUser(action).pipe(
          map((data: User) => {
            return UserActions.userDeleteSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(UserActions.userDeleteError(error));
          })
        )
      )
    );
  });

  constructor(
    private userService: UserService, 
    private actions$: Actions
  ) { }
}
