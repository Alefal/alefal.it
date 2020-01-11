/**
 * Actions are one of the main building blocks in NgRx. Actions express unique events that happen throughout your application. 
 * From user interaction with the page, external interaction through network requests, and direct interaction with device APIs, 
 * these and more events are described with actions.
 */
import { createAction, props } from '@ngrx/store';
import { User } from '../../shared/models/interfaces/user.interface';

export enum UsersActionTypes {
  LOAD_USERS = "[USERS] Load Users",
  LOAD_USERS_SUCCESS = "[USERS] Load Users Success",
  LOAD_USERS_ERROR = "[USERS] Load Users Error",
  LOAD_USER_DETAIL = "[USER] Load User Detail",
  LOAD_USER_DETAIL_SUCCESS = "[USER] Load User Detail Success",
  LOAD_USER_DETAIL_ERROR = "[USER] Load User Detail Error",
  USER_DELETE = "[USER] User Delete",
  USER_DELETE_SUCCESS = "[USER] User Delete Success",
  USER_DELETE_ERROR = "[USER] User Delete Error",
  USER_EDIT = "[USER] User Edit",
  USER_EDIT_SUCCESS = "[USER] User Edit Success",
  USER_EDIT_ERROR = "[USER] User Edit Error",
  USER_CREATION_PREPARE = "[USER] User Creation Prepare",
  USER_CREATE = "[USER] User Create",
  USER_CREATE_SUCCESS = "[USER] User Create Success",
  USER_CREATE_ERROR = "[USER] User Create Error"
}

////////// Users Collection
export const loadUsers = createAction(
  UsersActionTypes.LOAD_USERS
);
export const loadUsersSuccess = createAction(
  UsersActionTypes.LOAD_USERS_SUCCESS,
  props<{ payload: User[] }>()
);
export const loadUsersError = createAction(
  UsersActionTypes.LOAD_USERS_ERROR,
  props<Error>()
);

////////// User Detail
export const loadUserDetail = createAction(
  UsersActionTypes.LOAD_USER_DETAIL,
  props<{ user: User }>()
);
export const loadUserDetailSuccess = createAction(
  UsersActionTypes.LOAD_USER_DETAIL_SUCCESS,
  props<{ payload: User }>()
);
export const loadUserDetailError = createAction(
  UsersActionTypes.LOAD_USER_DETAIL_ERROR,
  props<Error>()
);

////////// User Creation Prepare
export const userCreationPrepare = createAction(
  UsersActionTypes.USER_CREATION_PREPARE,
  props<{ payload: User }>()
);
////////// User Create
export const userCreate = createAction(
  UsersActionTypes.USER_CREATE,
  props<{ user: User }>()
);
export const userCreateSuccess = createAction(
  UsersActionTypes.USER_CREATE_SUCCESS,
  props<{ payload: User }>()
);
export const userCreateError = createAction(
  UsersActionTypes.USER_CREATE_ERROR,
  props<Error>()
);

////////// User Delete
export const userDelete = createAction(
  UsersActionTypes.USER_DELETE,
  props<{ user: User }>()
);
export const userDeleteSuccess = createAction(
  UsersActionTypes.USER_DELETE_SUCCESS,
  props<{ payload: User }>()
);
export const userDeleteError = createAction(
  UsersActionTypes.USER_DELETE_ERROR,
  props<Error>()
);

////////// User Edit
export const userEdit = createAction(
  UsersActionTypes.USER_EDIT,
  props<{ user: User }>()
);
export const userEditSuccess = createAction(
  UsersActionTypes.USER_EDIT_SUCCESS,
  props<{ payload: User }>()
);
export const userEditError = createAction(
  UsersActionTypes.USER_EDIT_ERROR,
  props<Error>()
);

export const UserActions = {
  loadUsers,
  loadUsersSuccess,
  loadUsersError,
  loadUserDetail,
  loadUserDetailSuccess,
  loadUserDetailError,
  userDelete,
  userDeleteSuccess,
  userDeleteError,
  userEdit,
  userEditSuccess,
  userEditError,
  userCreationPrepare,
  userCreate,
  userCreateSuccess,
  userCreateError
};