import { createFeatureSelector, createSelector } from '@ngrx/store';
import UserState from '../state/user.state';

export const appStateSelector = createFeatureSelector('userState');

export const getUsername = createSelector(
  appStateSelector,
  (state: UserState) => state && state.UserSelected ? state.UserSelected.firstname + state.UserSelected.lastname : ''
);