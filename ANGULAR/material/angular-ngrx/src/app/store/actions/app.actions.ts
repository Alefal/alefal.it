import { createAction, props } from '@ngrx/store';
import { User } from '../../shared/models/interfaces/user.interface';


export enum AppsActionTypes {
  LOAD_APP = "[APPS] Load Apps"
}
////////// Load Apps
export const loadApps = createAction(
  '[App] Load Apps'
);