import { Routes, RouterModule } from '@angular/router';

import { AuthGuard }            from './_guards/index';

import { LoginComponent }       from './login/login.component';
import { HomeComponent }        from './home/home.component';
import { OrdineComponent }      from './ordine/ordine.component';

const appRoutes: Routes = [
    { path: '',                 component: LoginComponent },
    { path: 'login',            component: LoginComponent },
    { path: 'home',             component: HomeComponent, canActivate: [AuthGuard] },
    { path: 'ordine/:order',    component: OrdineComponent },

    // otherwise redirect to home
    { path: '**', redirectTo: '' }
];

export const routing = RouterModule.forRoot(appRoutes);