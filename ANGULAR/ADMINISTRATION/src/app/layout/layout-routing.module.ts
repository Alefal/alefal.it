import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LayoutComponent } from './layout.component';
import { AuthGuard } from '../shared';

const routes: Routes = [
    {
        path: '',
        component: LayoutComponent,
        children: [
            { path: '', redirectTo: 'dashboard', pathMatch: 'prefix' },
            // tslint:disable-next-line: max-line-length
            // { path: 'dashboard', loadChildren: () => import('./dashboard/dashboard.module').then(m => m.DashboardModule), canActivate: [AuthGuard] },
            { path: 'dashboard', loadChildren: './dashboard/dashboard.module#DashboardModule', canActivate: [AuthGuard] },
            { path: 'test', loadChildren: './test/test.module#TestModule', canActivate: [AuthGuard] },
            { path: 'testslickgrid', loadChildren: './testslickgrid/testslickgrid.module#TestslickgridModule', canActivate: [AuthGuard] },
            { path: 'calendar', loadChildren: './calendar/calendar.module#CalendarModule', canActivate: [AuthGuard] },
            { path: 'users', loadChildren: './users/users.module#UsersModule', canActivate: [AuthGuard] },
            { path: 'userssg', loadChildren: './users-slick-grid/users-slick-grid.module#UsersSlickGridModule', canActivate: [AuthGuard] },
            { path: 'externalapp', loadChildren: './externalapp/externalapp.module#ExternalAppModule', canActivate: [AuthGuard] }
        ]
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class LayoutRoutingModule {}
