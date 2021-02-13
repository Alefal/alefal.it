import { Routes } from '@angular/router';
import { AuthGuard } from './shared/guards/auth.guard';

export const AppRoutes: Routes = [
  { 
    path: '', 
    loadChildren: () => import('./features/layouts/layouts.module').then(m => m.LayoutsModule),
    canActivate: [AuthGuard]
  },
  {
    path: 'login',
    loadChildren: () => import('./auth/auth.module').then(m => m.AuthModule) 
  }
];
