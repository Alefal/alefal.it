import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TestslickgridComponent } from './testslickgrid.component';

const routes: Routes = [
  {
    path: '',
    component: TestslickgridComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TestslickgridRoutingModule { }
