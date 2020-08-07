import { Action, createReducer, on } from '@ngrx/store';
import AppState, { initializeAppState } from '../state/app.state';

import * as AppActions from '../actions/app.actions';

export const appFeatureKey = 'APP_STORE';

const initialState = initializeAppState();

const _reducer = createReducer(
  initialState,
  ////////// Load App
  on(AppActions.loadApps, state => state),
);

export function createAppReducer(state: AppState | undefined, action: Action) {
  return _reducer(state, action);
}