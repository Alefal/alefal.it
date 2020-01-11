import { createFeatureSelector, createSelector } from '@ngrx/store';
import AppState from '../state/app.state';

export const appStateSelector = createFeatureSelector('appState');

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
