import { Action, createReducer, on } from '@ngrx/store';
import AuthState, { initializeAuthState } from '../state/auth.state';

import * as AuthActions from '../actions/auth.actions';

export const appFeatureKey = 'AUTH_STORE';
const initialState = initializeAuthState();

const _reducer = createReducer(
  initialState,
  ////////// Authentication
  on(AuthActions.authentication, state => state),
  on(AuthActions.authenticationSuccess, (state: AuthState, payload: any) => {
    console.log('AuthActions.authenticationSuccess payload',payload);
    return { 
      ...state, 
      Authentication: {
        User: payload.user,
        isAuthenticated: true,
        authenticate: state.Authentication.authenticate
      }
    };
  }),
);

export function createAuthReducer(state: AuthState | undefined, action: Action) {
  return _reducer(state, action);
}