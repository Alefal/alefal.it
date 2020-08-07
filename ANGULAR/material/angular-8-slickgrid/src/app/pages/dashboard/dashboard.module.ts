import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FlexLayoutModule } from '@angular/flex-layout';
import { DashboardComponent } from './dashboard.component';
import { DashboardRoutes } from './dashboard.routing';
import { ChartistModule } from 'ng-chartist';

import { TranslateModule } from '@ngx-translate/core';
import { AngularSlickgridModule } from 'angular-slickgrid';
import { ModalModule } from 'ngx-bootstrap';
import { MaterialModule } from '../../shared/material-module';

import { CollectionComponent } from './components/collection/collection.component';
import { CreateModule } from '../create/create.module';

@NgModule({
  declarations: [
    DashboardComponent,
    CollectionComponent
  ],
  imports: [
    CommonModule,
    MaterialModule,
    FlexLayoutModule,
    ChartistModule,
    RouterModule.forChild(DashboardRoutes),
    TranslateModule,
    FormsModule,
    ReactiveFormsModule,
    AngularSlickgridModule.forRoot({
      enableAutoResize: true,
      autoResize: {
        containerId: 'grid-container',
        sidePadding: 15
      }
    }),
    ModalModule.forRoot(),
    // Custom Module
    CreateModule
  ]
})

export class DashboardModule { }
