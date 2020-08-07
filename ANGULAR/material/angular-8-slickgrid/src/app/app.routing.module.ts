import { Routes, RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';

export const AppRoutes: Routes = [
  { 
    path: '', 
    loadChildren: () => import('./layouts/layouts.module').then(m => m.LayoutsModule)
  },
  {
    path: '**', redirectTo: ''
  }
];

@NgModule({
  imports: [RouterModule.forRoot(AppRoutes,
    {
      useHash: true,
      anchorScrolling: 'enabled',
      onSameUrlNavigation: 'reload',
      scrollPositionRestoration: 'enabled',
      // enableTracing: true
    }
  )],
  exports: [RouterModule]
})
export class AppRoutingModule { }
