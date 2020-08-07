import { Injectable } from '@angular/core';

import { concatMap } from 'rxjs/operators';
import { EMPTY, of } from 'rxjs';

import { Actions, createEffect, ofType } from '@ngrx/effects';
import * as AppActions from '../actions/app.actions';

@Injectable()
export class AppEffects {

  constructor(
    private actions$: Actions
  ) { }

  loadApps$ = createEffect(() => {
    return this.actions$.pipe(

      ofType(AppActions.loadApps),
      /** An EMPTY observable only emits completion. Replace with your own observable API request */
      concatMap(() => EMPTY)
    );
  });
}
