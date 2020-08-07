import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

import { tap } from 'rxjs/operators';

import { Actions, createEffect, ofType } from '@ngrx/effects';
import * as LayoutsActions from '../actions/layouts.actions';


@Injectable()
export class LayoutsEffects {

  constructor(
    private actions$: Actions,
    private router: Router,
  ) { }

  ////////// Logout
  logout$ = createEffect(() => 
    this.actions$.pipe(
      ofType(LayoutsActions.logout),
      tap((res: any) => {
        localStorage.removeItem('userCurrent');
        localStorage.removeItem('userLogged');
        this.router.navigate(['/auth']);
      })
    ),
    { dispatch: false }
  );
}
