import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { UsersRoutingModule } from './users-routing.module';

import { UsersComponent } from './containers/users.component';
import { CollectionComponent } from './components/collection/collection.component';
import { DetailComponent } from './components/detail/detail.component';

import { MaterialModule } from '../../shared/material-module';
import { AngularSlickgridModule } from 'angular-slickgrid';
import { ModalModule } from 'ngx-bootstrap';

@NgModule({
  declarations: [
    // USER
    UsersComponent,
    CollectionComponent,
    DetailComponent
  ],
  imports: [
    CommonModule,
    UsersRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    MaterialModule,
    AngularSlickgridModule.forRoot({
      // add any Global Grid Options/Config you might want
      // to avoid passing the same options over and over in each grids of your App
      enableAutoResize: true,
      autoResize: {
        containerId: 'grid-container',
        sidePadding: 15
      }
    }),
    ModalModule.forRoot()
  ]
})
export class UsersModule { }
