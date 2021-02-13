import { createAction, props } from '@ngrx/store';

export enum LayoustsActionTypes {
  LOGOUT = "[APPS] Logout"
}
////////// Logout
export const logout = createAction(
  LayoustsActionTypes.LOGOUT
);