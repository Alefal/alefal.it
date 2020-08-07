import { createFeatureSelector, createSelector } from '@ngrx/store';

import AppState from '../../../store/state/app.state';
import AuthState from '../state/auth.state';

export const appStateSelector = createFeatureSelector('appState');
export const authStateSelector = createFeatureSelector('authState');

export const getUserAuthStatus = createSelector(
	authStateSelector,
  (state: AuthState) => state && state.Authentication ? state.Authentication.isAuthenticated : false
)

export const getUserLogged = createSelector(
	authStateSelector,
  (state: AuthState) => state && state.Authentication && state.Authentication.User ? state.Authentication.User : null
)


export const getAppConfig = createSelector(
  authStateSelector,
  (state: AppState) => state && state.Config ? state.Config : ''
);