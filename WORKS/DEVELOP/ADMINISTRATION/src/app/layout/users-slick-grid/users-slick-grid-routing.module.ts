import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UsersSlickGridComponent } from './users-slick-grid.component';

const routes: Routes = [
  { path: '', component: UsersSlickGridComponent }
]

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UsersSlickGridRoutingModule { }
