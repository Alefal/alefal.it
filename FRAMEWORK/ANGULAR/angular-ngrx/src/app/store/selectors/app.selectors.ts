import { createFeatureSelector, createSelector } from '@ngrx/store';
import AppState from '../state/app.state';

export const appStateSelector = createFeatureSelector('appState');

export const getAppConfig = createSelector(
  appStateSelector,
  (state: AppState) => state && state.Config ? state.Config : ''
);

export const getApiURL = createSelector(
  appStateSelector,
  (state: AppState) => state 
                        && state.Config 
                        && state.Config.settings 
                        && state.Config.settings.apiServer 
                        && state.Config.settings.apiServer.host 
                        ? state.Config.settings.apiServer.host 
                        : ''
);