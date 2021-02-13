import { Action, createReducer, on } from '@ngrx/store';
import LayoutsState, { initializeLayoutsState } from '../state/layouts.state';

import * as LayoutsActions from '../actions/layouts.actions';

export const appFeatureKey = 'LAYOUTS_STORE';
const initialState = initializeLayoutsState();

const _reducer = createReducer(
  initialState,
  ////////// Logout
  on(LayoutsActions.logout, (state: LayoutsState) => {
    return { 
      ...state, 
      UX: null
    };
  }),
);

export function createLayoutsReducer(state: LayoutsState | undefined, action: Action) {
  return _reducer(state, action);
}