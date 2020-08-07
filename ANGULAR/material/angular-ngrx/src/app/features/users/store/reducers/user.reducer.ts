/**
 * Reducers in NgRx are responsible for handling transitions from one state to the next state in your application.
 */

import { Action, createReducer, on } from '@ngrx/store';
import * as UserActions from '../actions/user.actions';
import UserState, { initializeUserState } from '../state/user.state';

export const userFeatureKey = 'APP_USER';

const initialState = initializeUserState();

const _reducer = createReducer(
  initialState,
  ////////// Users Collection
  on(UserActions.loadUsers, state => state),
  on(UserActions.loadUsersSuccess, (state: UserState, { payload }) => {
    return { 
      ...state, 
      Users: payload, 
      UserError: null 
    };
  }),
  ////////// User Detail
  on(UserActions.loadUserDetail, state => state),
  on(UserActions.loadUserDetailSuccess, (state: UserState, { payload }) => {
    return { 
      ...state,
      UserSelected: payload, 
      UserError: null 
    }; 
  }),
  ////////// User Creation
  on(UserActions.userCreationPrepare, (state: UserState, { payload }) => {
    return { 
      ...state,
      UserSelected: payload, 
      UserError: null 
    }; 
  }),
  ////////// User Create
  on(UserActions.userCreate, state => state),
  on(UserActions.userCreateSuccess, (state: UserState, { payload }) => {
    return {
      ...state, 
      Users: [...state.Users, payload],
      UserError: null ,
      UserSelected: payload
    };
  }),
  ////////// User Edit
  on(UserActions.userEdit, state => state),
  on(UserActions.userEditSuccess, (state: UserState, { payload }) => {
    var index = state.Users.findIndex(item => item.id === payload.id);
    return {
      ...state, 
      Users: state.Users.map((el) => {
        if (el.id == payload.id) {
          return { ...state.Users[index] = Object.assign({}, state.Users[index], payload)};
        } else {
          return el;
        }
      }),
      UserError: null ,
      UserSelected: payload
    };
  }),
  ////////// User Delete
  on(UserActions.userDelete, state => state),
  on(UserActions.userDeleteSuccess, (state: UserState, { payload }) => {
    return { 
      ...state, 
      Users: [...state.Users.filter(item => item.id !== payload.id)], 
      UserError: null,
      UserSelected: null
    };
  }),
);

export function createUserReducer(state: UserState | undefined, action: Action) {
  return _reducer(state, action);
}
