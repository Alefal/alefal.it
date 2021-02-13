import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FlexLayoutModule } from '@angular/flex-layout';

import { LayoutsRoutingModule } from './layouts-routing.module';
import { MaterialModule } from '../shared/material-module';
import { TranslateModule } from '@ngx-translate/core';
import { ModalModule } from 'ngx-bootstrap';

import { LayoutsComponent } from './containers/layouts.component';
import { AppHeaderComponent } from './components/header/header.component';
import { AppSidebarComponent } from './components/sidebar/sidebar.component';
import { AppProfileComponent } from './components/profile/profile.component';

import { CreateModule } from '../pages/create/create.module';

@NgModule({
  declarations: [
    LayoutsComponent,
    AppHeaderComponent,
    AppSidebarComponent,
    AppProfileComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    LayoutsRoutingModule,
    FlexLayoutModule,
    MaterialModule,
    ModalModule.forRoot(),
    TranslateModule,
    // Custom Module
    CreateModule
  ]
})
export class LayoutsModule { }
