import { createAction, props } from '@ngrx/store';
import { User } from '../../../shared/models/interfaces/user.interface';


export enum AuthActionTypes {
  AUTHENTICATION = "[APPS] Authentication",
  AUTHENTICATION_SUCCESS = "[APPS] Authentication Success",
  AUTHENTICATION_ERROR = "[APPS] Authentication Error"
}
////////// Authentication
export const authentication = createAction(
  AuthActionTypes.AUTHENTICATION,
  props<{ payload: any }>()
);
export const authenticationSuccess = createAction(
  AuthActionTypes.AUTHENTICATION_SUCCESS,
  props<{ user: any, auth: any }>()
);
export const authenticationError = createAction(
  AuthActionTypes.AUTHENTICATION_ERROR,
  props<Error>()
);