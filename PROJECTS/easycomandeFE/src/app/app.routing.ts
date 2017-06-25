import { Routes, RouterModule } from '@angular/router';

import { AuthGuard }            from './_guards/index';

import { LoginComponent }       from './login/login.component';
import { HomeComponent }        from './home/home.component';
import { AddComponent }         from './add/add.component';
import { OrderComponent }       from './order/order.component';
import { MenuComponent }        from './menu/menu.component';

const appRoutes: Routes = [
    { path: '',                                 component: LoginComponent },
    { path: 'login',                            component: LoginComponent },
    { path: 'login/:logout',                    component: LoginComponent },
    { path: 'home',                             component: HomeComponent, canActivate: [AuthGuard] },
    { path: 'add',                              component: AddComponent, canActivate: [AuthGuard] },
    { path: 'add/:order',                       component: AddComponent, canActivate: [AuthGuard] },
    { path: 'menu',                             component: MenuComponent, canActivate: [AuthGuard] },
    { path: 'ordine/:order/:check',             component: OrderComponent },

    // otherwise redirect to home
    { path: '**', redirectTo: '' }
];

export const routing = RouterModule.forRoot(appRoutes);