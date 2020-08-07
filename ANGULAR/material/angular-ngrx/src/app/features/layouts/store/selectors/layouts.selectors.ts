import { createFeatureSelector, createSelector } from '@ngrx/store';

import AppState from '../../../../store/state/app.state';
import AuthState from '../../../../auth/store/state/auth.state';

export const appStateSelector = createFeatureSelector('appState');
export const authStateSelector = createFeatureSelector('authState');

export const getAppTitle = createSelector(
  appStateSelector,
  (state: AppState) => state && state.Config ? state.Config.settings.title : ''
);
export const getAppVersion = createSelector(
  appStateSelector,
  (state: AppState) => state && state.Config ? state.Config.settings.version : ''
);

export const getAppConfig = createSelector(
  appStateSelector,
  (state: AppState) => state && state.Config ? state.Config : ''
);

export const getUserAuthStatus = createSelector(
	authStateSelector,
  (state: AuthState) => state && state.Authentication ? state.Authentication.isAuthenticated : false
)

export const getUserLogged = createSelector(
	authStateSelector,
  (state: AuthState) => state && state.Authentication && state.Authentication.User ? state.Authentication.User : null
)