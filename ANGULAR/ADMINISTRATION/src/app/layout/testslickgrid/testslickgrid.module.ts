import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { TestslickgridRoutingModule } from './testslickgrid-routing.module';
import { TestslickgridComponent } from './testslickgrid.component';
import { AngularSlickgridModule } from 'angular-slickgrid';

@NgModule({
  declarations: [TestslickgridComponent],
  imports: [
    CommonModule,
    FormsModule,
    TestslickgridRoutingModule,
    AngularSlickgridModule.forRoot({
      // add any Global Grid Options/Config you might want
      // to avoid passing the same options over and over in each grids of your App
      enableAutoResize: true,
      autoResize: {
        containerId: 'grid-container',
        sidePadding: 15
      }
    })
  ]
})
export class TestslickgridModule { }
