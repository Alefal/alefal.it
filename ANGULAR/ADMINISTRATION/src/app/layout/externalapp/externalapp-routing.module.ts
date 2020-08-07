import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ExternalAppComponent } from './externalapp.component';

const routes: Routes = [
    {
        path: '', component: ExternalAppComponent
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class ExternalAppRoutingModule {
}